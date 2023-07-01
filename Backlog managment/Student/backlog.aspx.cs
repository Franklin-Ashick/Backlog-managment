using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Backlog_managment.Student
{
    public partial class backlog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the page is loaded for the first time
            //if (!IsPostBack)
            //{
            //    FetchBacklogDetails("1");
            //}
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            //string registrationNumber = Session["RegistrationNumber"] as string;
            //string semester = semesterDropDown.SelectedValue;

            //string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

            //using (SqlConnection connection = new SqlConnection(connectionString))
            //{
            //    string query = "SELECT course_code, course_name, total_marks, obtained_marks, backlog_fee FROM backlog WHERE semester = @Semester AND reg_number = @RegistrationNumber";

            //    SqlCommand command = new SqlCommand(query, connection);
            //    command.Parameters.AddWithValue("@Semester", semester);
            //    command.Parameters.AddWithValue("@RegistrationNumber", registrationNumber);

            //    SqlDataAdapter adapter = new SqlDataAdapter(command);
            //    DataTable dataTable = new DataTable();

            //    adapter.Fill(dataTable);

            //    backlogGridView.DataSource = dataTable;
            //    backlogGridView.DataBind();
            

        }

        protected void backlogGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
