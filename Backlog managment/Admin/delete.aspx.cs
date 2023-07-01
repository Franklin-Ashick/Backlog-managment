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
    public partial class updateBacklog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the backlogId query parameter is provided
                if (Request.QueryString["backlogId"] != null)
                {
                    int backlogId = Convert.ToInt32(Request.QueryString["backlogId"]);

                    // Connection string for your SQL Server database
                    string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        // SQL query to delete the record with the given backlog ID
                        string query = "DELETE FROM backlog WHERE id = @BacklogId";

                        SqlCommand command = new SqlCommand(query, connection);
                        command.Parameters.AddWithValue("@BacklogId", backlogId);

                        connection.Open();

                        // Execute the delete query
                        command.ExecuteNonQuery();
                    }

                    // Redirect back to the backlog.aspx page after deletion
                    Response.Redirect("backlog.aspx");
                }
            }
        }
    }
}
