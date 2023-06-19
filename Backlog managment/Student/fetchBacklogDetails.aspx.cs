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
    public partial class fetchBacklogDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string selectedSemester = Request.QueryString["semester"];
            System.Text.StringBuilder backlogTableRows = new System.Text.StringBuilder();

            string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT CourseCode, CourseName, TotalMarks, ObtainedMarks, BacklogFee FROM BacklogDetails WHERE Semester = @Semester";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Semester", selectedSemester);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    string courseCode = reader["CourseCode"].ToString();
                    string courseName = reader["CourseName"].ToString();
                    // Get other column values

                    // Generate the table row dynamically
                    string tableRow = $"<tr>" +
                                        $"<td>{courseCode}</td>" +
                                        $"<td>{courseName}</td>" +
                                        // Add other columns here
                                        $"<td><a href='PaymentPage.aspx?courseCode={courseCode}'>Pay Fees</a></td>" +
                                     $"</tr>";

                    backlogTableBody.InnerHtml += tableRow;
                }

                reader.Close();
            }
        }
    }
}