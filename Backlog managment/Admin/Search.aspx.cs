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
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            //string registrationNumber = Request.Form["regnum"]; // Retrieve the entered registration number from the form field

            //// Use the registration number to fetch the details from the database
            //// Connection string for your SQL Server database
            //string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

            //using (SqlConnection connection = new SqlConnection(connectionString))
            //{
            //    // SQL query to fetch backlog details for the given registration number
            //    string query = "SELECT course_code, course_name, total_marks, obtained_marks, backlog_fee FROM backlog WHERE RegistrationNumber = @RegistrationNumber";

            //    SqlCommand command = new SqlCommand(query, connection);
            //    command.Parameters.AddWithValue("@RegistrationNumber", registrationNumber);

            //    connection.Open();

            //    SqlDataReader reader = command.ExecuteReader();

            //    // Loop through the result set and generate the table rows dynamically
            //    while (reader.Read())
            //    {
            //        string courseCode = reader.GetString(reader.GetOrdinal("course_code"));
            //        string courseName = reader.GetString(reader.GetOrdinal("course_name"));
            //        int totalMarks = reader.GetInt32(reader.GetOrdinal("total_marks"));
            //        int obtainedMarks = reader.GetInt32(reader.GetOrdinal("obtained_marks"));
            //        decimal backlogFee = reader.GetDecimal(reader.GetOrdinal("backlog_fee"));

            //        // Display the details or store them in a variable to be used in the HTML markup
            //    }

            //    reader.Close();
            //    connection.Close();
            //}
        }
    }
}