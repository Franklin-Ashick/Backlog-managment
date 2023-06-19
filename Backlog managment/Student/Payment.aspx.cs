using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Backlog_managment.Student
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["courseCode"] != null && Request.QueryString["courseName"] != null && Request.QueryString["backlogFee"] != null && Request.QueryString["semester"] != null)
                {
                    string courseCode = Request.QueryString["courseCode"];
                    string courseName = Request.QueryString["courseName"];
                    decimal backlogFee = Convert.ToDecimal(Request.QueryString["backlogFee"]);
                    txtBacklogFee.Text = Convert.ToDecimal(Request.QueryString["backlogFee"]).ToString("0.00");

                    string semester = Request.QueryString["semester"];

                    // Store the values in session for later use
                    Session["CourseCode"] = courseCode;
                    Session["CourseName"] = courseName;
                    Session["BacklogFee"] = backlogFee;
                    Session["Semester"] = semester;
                }
            }
        }
                 
            protected void btnPay_Click(object sender, EventArgs e)
            {
                // Retrieve the payment details from the previous page or session variables
                string registrationNumber = Session["RegistrationNumber"] as string;
                string studentName = Session["FullName"] as string;
                string courseCode = Session["CourseCode"] as string;
                string courseName = Session["CourseName"] as string;
                string semester = Session["Semester"] as string;
                string department = Session["Department"] as string;
                string paymentMethod = ddlPaymentMethod.SelectedValue;

                // Store the payment details in the database
                string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Payment (RegistrationNumber, StudentName, CourseCode, CourseName, Semester, Department, Amount, PaymentMethod) " +
                        "VALUES (@RegistrationNumber, @StudentName, @CourseCode, @CourseName, @Semester, @Department, @Amount, @PaymentMethod)";

                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@RegistrationNumber", registrationNumber);
                    command.Parameters.AddWithValue("@StudentName", studentName);
                    command.Parameters.AddWithValue("@CourseCode", courseCode);
                    command.Parameters.AddWithValue("@CourseName", courseName);
                    command.Parameters.AddWithValue("@Semester", semester);
                    command.Parameters.AddWithValue("@Department", department);
                    command.Parameters.AddWithValue("@Amount", txtBacklogFee.Text);
                    command.Parameters.AddWithValue("@PaymentMethod", paymentMethod);

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }

            string script = "alert('Payment was successful.'); window.location.href = 'backlog.aspx';";
            ClientScript.RegisterStartupScript(this.GetType(), "PaymentSuccess", script, true);

        }

    }
    }
