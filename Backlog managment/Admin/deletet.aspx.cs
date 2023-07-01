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
    public partial class deletet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["timetableId"] != null)
                {
                    int timetableId = Convert.ToInt32(Request.QueryString["timetableId"]);
                    DeleteTimetable(timetableId);
                }
            }
        }

        private void DeleteTimetable(int timetableId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM timetable WHERE id = @timetableId";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@timetableId", timetableId);

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }

            Response.Redirect("Timetable.aspx");
        }
    }
}