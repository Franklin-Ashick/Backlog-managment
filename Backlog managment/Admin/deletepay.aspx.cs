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
    public partial class deletepay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the ID parameter exists in the query string
            if (Request.QueryString["id"] != null)
            {
                // Retrieve the ID parameter from the query string
                int paymentId = Convert.ToInt32(Request.QueryString["id"]);

                // Connection string for your SQL Server database
                string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // SQL query to delete the payment record
                    string query = "DELETE FROM Payment WHERE ID = @PaymentId";

                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@PaymentId", paymentId);

                    connection.Open();

                    command.ExecuteNonQuery();

                    connection.Close();
                }
            }

            // Redirect back to the payment page
            Response.Redirect("Payment.aspx");
        }
    }
}