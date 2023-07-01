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
    public partial class editre : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = Request.QueryString["id"];

                if (!string.IsNullOrEmpty(id))
                {
                    LoadResults(id);
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];

            if (!string.IsNullOrEmpty(id))
            {
                UpdateResults(id);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Results.aspx");
        }

        private void LoadResults(string id)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Results WHERE id = @id";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        student_name.Value = reader["StudentName"].ToString();
                        reg_number.Value = reader["RegistrationNumber"].ToString();
                    ;
                        department.Value = reader["Department"].ToString();
                        course_name.Value = reader["CourseName"].ToString();
                        course_code.Value = reader["CourseCode"].ToString();
                        semester.Value = reader["Semester"].ToString();
                        total_marks.Value = reader["TotalMarks"].ToString();
                        obtained_marks.Value = reader["ObtainedMarks"].ToString();
                        result_status.Value = reader["ResultStatus"].ToString();
                    }
                }

                reader.Close();
            }
        }

        private void UpdateResults(string id)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "UPDATE Results SET StudentName = @studentName, RegistrationNumber = @regNumber, "
                             + "Department = @department, CourseName = @courseName, CourseCode = @courseCode, "
                             + "Semester = @semester, TotalMarks = @totalMarks, ObtainedMarks = @obtainedMarks, "
                             + "ResultStatus = @resultStatus WHERE id = @id";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@studentName", student_name.Value);
                cmd.Parameters.AddWithValue("@regNumber", reg_number.Value);
          
                cmd.Parameters.AddWithValue("@department", department.Value);
                cmd.Parameters.AddWithValue("@courseName", course_name.Value);
                cmd.Parameters.AddWithValue("@courseCode", course_code.Value);
                cmd.Parameters.AddWithValue("@semester", semester.Value);
                cmd.Parameters.AddWithValue("@totalMarks", total_marks.Value);
                cmd.Parameters.AddWithValue("@obtainedMarks", obtained_marks.Value);
                cmd.Parameters.AddWithValue("@resultStatus", result_status.Value);
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    // Update successful
                    Response.Redirect("Results.aspx");
                }
                else
                {
                    // Update failed
                    // Display an error message or take appropriate action
                }
            }
        }
    }
}