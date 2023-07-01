using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Backlog_managment.Admin
{
    public partial class Results : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnInsert_Click(object sender, EventArgs e)
        { // Get the form input values
            string studentName = Request.Form["student_name"];
            string regNumber = Request.Form["reg_number"];
            string department = Request.Form["department"];
            string semester = Request.Form["semester"];
            string courseCode = Request.Form["course_code"];
            string courseName = Request.Form["course_name"];
            int totalMarks = Convert.ToInt32(Request.Form["total_marks"]);
            int obtainedMarks = Convert.ToInt32(Request.Form["obtained_marks"]);
            string resultStatus = Request.Form["result_status"];

            // Insert the data into the SQL database
            string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Results (StudentName, RegistrationNumber, Department, Semester, CourseCode, CourseName, TotalMarks, ObtainedMarks, ResultStatus) " +
                               "VALUES (@StudentName, @RegistrationNumber, @Department, @Semester, @CourseCode, @CourseName, @TotalMarks, @ObtainedMarks, @ResultStatus)";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@StudentName", studentName);
                command.Parameters.AddWithValue("@RegistrationNumber", regNumber);
                command.Parameters.AddWithValue("@Department", department);
                command.Parameters.AddWithValue("@Semester", semester);
                command.Parameters.AddWithValue("@CourseCode", courseCode);
                command.Parameters.AddWithValue("@CourseName", courseName);
                command.Parameters.AddWithValue("@TotalMarks", totalMarks);
                command.Parameters.AddWithValue("@ObtainedMarks", obtainedMarks);
                command.Parameters.AddWithValue("@ResultStatus", resultStatus);

                connection.Open();
                int rowsAffected = command.ExecuteNonQuery();
                connection.Close();

                if (rowsAffected > 0)
                {
                    // Insertion successful, perform any additional actions
                    // Redirect to a success page or show a success message
                    Response.Redirect("Results.aspx");
                }
                else
                {
                    // Insertion failed, handle the error
                    // Display an error message or redirect to an error page
                    Response.Redirect("Results.aspx");
                }
            }
        }
    }
}
