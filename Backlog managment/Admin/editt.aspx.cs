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
    public partial class editt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["timetableId"] != null)
                {
                    int timetableId = Convert.ToInt32(Request.QueryString["timetableId"]);
                    LoadTimetableDetails(timetableId);
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["timetableId"] != null)
            {
                int timetableId = Convert.ToInt32(Request.QueryString["timetableId"]);
                string semester  = ddlSemester.SelectedValue;
                string department = ddlDepartment.SelectedValue;
                string courseId = txtCourseId.Text;
                string courseName = txtCourseName.Text;
                string date = txtDate.Text;
              
                string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "UPDATE timetable SET Semester = @semester, department = @department, " +
                        "course_id = @courseId, course_name = @courseName, [date] = @date WHERE id = @timetableId";

                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@semester", semester);
                    command.Parameters.AddWithValue("@department", department);
                    command.Parameters.AddWithValue("@courseId", courseId);
                    command.Parameters.AddWithValue("@courseName", courseName);
                    command.Parameters.AddWithValue("@date", date);
                    command.Parameters.AddWithValue("@timetableId", timetableId);

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }

                Response.Redirect("Timetable.aspx");
            }
        }

        private void LoadTimetableDetails(int timetableId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT Semester, department, course_id, course_name, [date] FROM timetable WHERE id = @timetableId";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@timetableId", timetableId);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    string semesterValue = reader["Semester"].ToString();
                    string departmentValue = reader["department"].ToString();
                    string courseId = reader["course_id"].ToString();
                    string courseName = reader["course_name"].ToString();
                    string dateValue = reader["date"].ToString();

                    ddlSemester.SelectedValue = semesterValue;
                    ddlDepartment.SelectedValue = departmentValue;
                    txtCourseId.Text = courseId;
                    txtCourseName.Text = courseName;
                    txtDate.Text = dateValue;
                }

                reader.Close();
                connection.Close();
            }
        }
    }
}