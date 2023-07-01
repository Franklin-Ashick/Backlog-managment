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
    public partial class backlog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                // Retrieve the form data
                string studentName = Request.Form["student_name"];
                string regNumber = Request.Form["reg_number"];
                string email = Request.Form["email"];
                string department = Request.Form["department"];
                string semester = Request.Form["semester"];
                string courseCode = Request.Form["course_code"];
                string courseName = Request.Form["course_name"];
                int totalMarks = Convert.ToInt32(Request.Form["total_marks"]);
                int obtainedMarks = Convert.ToInt32(Request.Form["obtained_marks"]);
                decimal backlogFee = Convert.ToDecimal(Request.Form["backlog_fee"]);

                // Database connection settings
                string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

                // Create a new SQL connection
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    // Create the SQL command
                    SqlCommand cmd = new SqlCommand("INSERT INTO backlog (student_name, reg_number, email, department, semester, course_code, course_name, total_marks, obtained_marks, backlog_fee) " +
                                                        "VALUES (@studentName, @regNumber, @email, @department, @semester, @courseCode, @courseName, @totalMarks, @obtainedMarks, @backlogFee)", conn);

                    // Add t   he parameters
                    cmd.Parameters.AddWithValue("@studentName", studentName);
                    cmd.Parameters.AddWithValue("@regNumber", regNumber);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@department", department);
                    cmd.Parameters.AddWithValue("@semester", semester);
                    cmd.Parameters.AddWithValue("@courseCode", courseCode);
                    cmd.Parameters.AddWithValue("@courseName", courseName);
                    cmd.Parameters.AddWithValue("@totalMarks", totalMarks);
                    cmd.Parameters.AddWithValue("@obtainedMarks", obtainedMarks);
                    cmd.Parameters.AddWithValue("@backlogFee", backlogFee);

                    try
                    {
                        // Open the connection
                        conn.Open();

                        // Execute the command
                        cmd.ExecuteNonQuery();

                        // Display a success message
                        Response.Write("Data saved successfully.");
                    }
                    catch (Exception ex)
                    {
                        // Display an error message
                        Response.Write("Error: " + ex.Message);
                    }
                    finally
                    {
                        // Close the connection
                        conn.Close();
                    }
                }
            }
        }

    }
}