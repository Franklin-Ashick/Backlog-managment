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
    public partial class edit : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve the backlog ID from the query string
                if (Request.QueryString["backlogId"] != null)
                {
                    int backlogId = Convert.ToInt32(Request.QueryString["backlogId"]);
                    // Retrieve the backlog details from the database
                    LoadBacklogDetails(backlogId);
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // Retrieve the backlog ID from the query string
            if (Request.QueryString["backlogId"] != null)
            {
                int backlogId = Convert.ToInt32(Request.QueryString["backlogId"]);

                // Retrieve the updated values from the form
                string studentName = student_name.Text;
                string regNumber = reg_number.Text;
                string emailId = email.Text;
                string departmentt = department.SelectedItem.Value;
                string semestert = semester.SelectedItem.Value;
                string courseCode = course_code.Text;
                string courseName = course_name.Text;
                int totalMarks = Convert.ToInt32(total_marks.Text);
                int obtainedMarks = Convert.ToInt32(obtained_marks.Text);
                decimal backlogFee = Convert.ToDecimal(backlog_fee.Text);

                // Connection string for your SQL Server database
                string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // SQL query to update the backlog details
                    string query = "UPDATE backlog SET student_name = @studentName, reg_number = @regNumber, " +
                        "email = @emailId, department = @department, semester = @semester, " +
                        "course_code = @courseCode, course_name = @courseName, total_marks = @totalMarks, " +
                        "obtained_marks = @obtainedMarks, backlog_fee = @backlogFee WHERE id = @backlogId";

                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@studentName", studentName);
                    command.Parameters.AddWithValue("@regNumber", regNumber);
                    command.Parameters.AddWithValue("@emailId", emailId);
                    command.Parameters.AddWithValue("@department", departmentt);
                    command.Parameters.AddWithValue("@semester", semestert);
                    command.Parameters.AddWithValue("@courseCode", courseCode);
                    command.Parameters.AddWithValue("@courseName", courseName);
                    command.Parameters.AddWithValue("@totalMarks", totalMarks);
                    command.Parameters.AddWithValue("@obtainedMarks", obtainedMarks);
                    command.Parameters.AddWithValue("@backlogFee", backlogFee);
                    command.Parameters.AddWithValue("@backlogId", backlogId);

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }

                Response.Redirect("backlog.aspx");
            }
        }

        private void LoadBacklogDetails(int backlogId)
        {
            // Connection string for your SQL Server database
            string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // SQL query to fetch the backlog details based on the ID
                string query = "SELECT student_name, reg_number, email, department, semester, " +
                    "course_code, course_name, total_marks, obtained_marks, backlog_fee " +
                    "FROM backlog WHERE id = @backlogId";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@backlogId", backlogId);

                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    // Set the retrieved values to the form controls
                    student_name.Text = reader["student_name"].ToString();
                    reg_number.Text = reader["reg_number"].ToString();
                    email.Text = reader["email"].ToString();
                    department.SelectedValue = reader["department"].ToString();
                    semester.SelectedValue = reader["semester"].ToString();
                    course_code.Text = reader["course_code"].ToString();
                    course_name.Text = reader["course_name"].ToString();
                    total_marks.Text = reader["total_marks"].ToString();
                    obtained_marks.Text = reader["obtained_marks"].ToString();
                    backlog_fee.Text = reader["backlog_fee"].ToString();
                }

                reader.Close();
                connection.Close();
            }
        }
    }
}