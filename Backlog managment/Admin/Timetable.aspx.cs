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
    public partial class Timetable : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
     

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string semester = Request.Form["semester"];
            string department = Request.Form["department"];
            string course_id = Request.Form["course_id"];
            string course_name = Request.Form["course_name"];
            DateTime date = Convert.ToDateTime(Request.Form["date"]);

            string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO [timetable] (Semester, department, course_id, course_name, date) VALUES (@Semester, @Department, @CourseId, @CourseName, @Date)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Semester", semester);
                    cmd.Parameters.AddWithValue("@Department", department);
                    cmd.Parameters.AddWithValue("@CourseId", course_id);
                    cmd.Parameters.AddWithValue("@CourseName", course_name);
                    cmd.Parameters.AddWithValue("@Date", date);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            Response.Redirect(Request.RawUrl);
        }
    }

 
}
