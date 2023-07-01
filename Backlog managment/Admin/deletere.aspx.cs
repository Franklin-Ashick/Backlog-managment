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
    public partial class deletere : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // Get the record ID from the query string
            int recordId = Convert.ToInt32(Request.QueryString["id"]);

            // Delete the record from the database
            string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Results WHERE id = @Id";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Id", recordId);

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }

            // Redirect back to the results page
            Response.Redirect("Results.aspx");
        }
    }
}