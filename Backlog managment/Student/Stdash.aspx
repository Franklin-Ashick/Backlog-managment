<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student_Dashboard.Master" AutoEventWireup="true" CodeBehind="Stdash.aspx.cs" Inherits="Backlog_managment.Student.Stdash" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-panel">
          <div class="content-wrapper">
       <%
// Retrieve the registration number from the session
string rrregistrationNumber = Session["RegistrationNumber"] as string;

// Initialize variables to store the statistics
int numberOfBacklogs = 0;
int resultsAnnouncedCount = 0;
decimal totalPaymentPaid = 0;

// Connection string for your SQL Server database
string connectionStringgg = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

// Retrieve the number of backlogs
using (SqlConnection connection = new SqlConnection(connectionStringgg))
{
    string query = "SELECT COUNT(*) FROM backlog WHERE reg_number = @RegistrationNumber";

    SqlCommand command = new SqlCommand(query, connection);
    command.Parameters.AddWithValue("@RegistrationNumber", registrationNumber);

    connection.Open();

    // Execute the query and retrieve the count of backlogs
    numberOfBacklogs = (int)command.ExecuteScalar();

    connection.Close();
}

// Retrieve the count of results announced
using (SqlConnection connection = new SqlConnection(connectionStringgg))
{
    string query = "SELECT COUNT(*) FROM Results WHERE RegistrationNumber = @RegistrationNumber";

    SqlCommand command = new SqlCommand(query, connection);
    command.Parameters.AddWithValue("@RegistrationNumber", registrationNumber);

    connection.Open();

    // Execute the query and retrieve the count of announced results
    resultsAnnouncedCount = (int)command.ExecuteScalar();

    connection.Close();
}

// Retrieve the total payment paid
using (SqlConnection connection = new SqlConnection(connectionStringgg))
{
    string query = "SELECT SUM(Amount) AS TotalPaymentPaid FROM Payment WHERE RegistrationNumber = @RegistrationNumber";

    SqlCommand command = new SqlCommand(query, connection);
    command.Parameters.AddWithValue("@RegistrationNumber", registrationNumber);

    connection.Open();

    // Execute the query and retrieve the total payment paid
    object totalPaymentPaidObj = command.ExecuteScalar();
    if (totalPaymentPaidObj != DBNull.Value && totalPaymentPaidObj != null)
    {
        totalPaymentPaid = Convert.ToDecimal(totalPaymentPaidObj);
    }

    connection.Close();
}


%>

<div class="row">
    <div class="col-sm-4 grid-margin">
        <div class="card">
            <div class="card-body">
                <h5>Number Of Backlog</h5>
                <div class="row">
                    <div class="col-8 col-sm-12 col-xl-8 my-auto">
                        <div class="d-flex d-sm-block d-md-flex align-items-center">
                            <h2 class="mb-0"><%= numberOfBacklogs %></h2>
                        </div>
                    </div>
                    <div class="col-4 col-sm-12 col-xl-4 text-center text-xl-right">
                        <i class="icon-lg mdi mdi-codepen text-primary ml-auto"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-4 grid-margin">
        <div class="card">
            <div class="card-body">
                <h5>Results Announced</h5>
                <div class="row">
                    <div class="col-8 col-sm-12 col-xl-8 my-auto">
                        <div class="d-flex d-sm-block d-md-flex align-items-center">
                            <h2 class="mb-0"><%= resultsAnnouncedCount %></h2>
                        </div>
                    </div>
                    <div class="col-4 col-sm-12 col-xl-4 text-center text-xl-right">
                        <i class="icon-lg mdi mdi-wallet-travel text-danger ml-auto"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-4 grid-margin">
        <div class="card">
            <div class="card-body">
                <h5>Payment Paid</h5>
                <div class="row">
                    <div class="col-8 col-sm-12 col-xl-8 my-auto">
                        <div class="d-flex d-sm-block d-md-flex align-items-center">
                            <h2 class="mb-0">₹ <%= totalPaymentPaid %></h2>
                        </div>
                    </div>
                    <div class="col-4 col-sm-12 col-xl-4 text-center text-xl-right">
                        <i class="icon-lg mdi mdi-monitor text-success ml-auto"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

           
        
           
<div class="row">
    <div class="col-12 grid-margin">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Timetable</h4>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Semester</th>
                                <th>Department</th>
                                <th>Course ID</th>
                                <th>Course Name</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%@ Import Namespace="System.Data.SqlClient" %>
                            <% string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString; %>
                            <% using (SqlConnection connection = new SqlConnection(connectionString))
                               {
                                   string departmentFilter = Session["Department"].ToString(); // Retrieve department from Session
                                     //string departmentFilter = "BCA";
                                   string query = "SELECT * FROM timetable WHERE department = @department";
                                   SqlCommand command = new SqlCommand(query, connection);
                                   command.Parameters.AddWithValue("@department", departmentFilter);
                                   connection.Open();
                                   SqlDataReader reader = command.ExecuteReader();

                                   while (reader.Read())
                                   {
                                       int id = Convert.ToInt32(reader["id"]);
                                       string semester = reader["Semester"].ToString();
                                       string department = reader["department"].ToString();
                                       string courseId = reader["course_id"].ToString();
                                       string courseName = reader["course_name"].ToString();
                                       DateTime date = Convert.ToDateTime(reader["date"]);

                                       %>
                                       <tr>
                                           <td><%= id %></td>
                                           <td><%= semester %></td>
                                           <td><%= department %></td>
                                           <td><%= courseId %></td>
                                           <td><%= courseName %></td>
                                           <td><%= date.ToString("yyyy-MM-dd") %></td>
                                       </tr>
                                       <%
                                   }
                                   reader.Close();
                               }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

       <div class="row">
  <div class="col-lg-12 grid-margin stretch-card">
    <div class="card">
      <div class="card-body">
        <h4 class="card-title">Backlog Details</h4>
        <div class="table-responsive">
         <table class="table table-striped">
    <thead>
        <tr>
            <th>Semester</th>
            <th>Course Code</th>
            <th>Course Name</th>
            <th>Total Marks</th>
            <th>Obtained Marks</th>
            <th>Backlog Fee</th>
        </tr>
    </thead>
    <tbody>
        <%  
        // Retrieve the registration number from the session
       // string registrationNumber = Session["RegistrationNumber"] as string;
        
        // Connection string for your SQL Server database
        string connectionStringg = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;;
        
        using (SqlConnection connectiong = new SqlConnection(connectionStringg))
        {
            // SQL query to fetch backlog details for the given registration number
            string queryg = "SELECT semester, course_code, course_name, total_marks, obtained_marks, backlog_fee FROM backlog WHERE reg_number = @RegistrationNumber";
            
            SqlCommand commandg = new SqlCommand(queryg, connectiong);
            commandg.Parameters.AddWithValue("@RegistrationNumber", registrationNumber);
            
            connectiong.Open();
            
            SqlDataReader readerg = commandg.ExecuteReader();
            
            // Loop through the result set and display the data
            while (readerg.Read())
            {
                string semester = readerg.GetString(readerg.GetOrdinal("semester"));
                string courseCode = readerg.GetString(readerg.GetOrdinal("course_code"));
                string courseName = readerg.GetString(readerg.GetOrdinal("course_name"));
                int totalMarks = readerg.GetInt32(readerg.GetOrdinal("total_marks"));
                int obtainedMarks = readerg.GetInt32(readerg.GetOrdinal("obtained_marks"));
                decimal backlogFee = readerg.GetDecimal(readerg.GetOrdinal("backlog_fee"));
        %>
        <tr>
            <td><%= semester %></td>
            <td><%= courseCode %></td>
            <td><%= courseName %></td>
            <td><%= totalMarks %></td>
            <td><%= obtainedMarks %></td>
            <td><%= backlogFee %></td>
        </tr>
        <% 
            }
            
            readerg.Close();
            connectiong.Close();
        }
        %>
    </tbody>
</table>

        </div>
      </div>
    </div>
  </div>
</div>
            
          </div>
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
          
          <!-- partial -->
        </div>
</asp:Content>

