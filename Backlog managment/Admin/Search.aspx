<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admindash.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="Backlog_managment.Admin.Search" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="main-panel">
        <div class="content-wrapper">
            <div class="page-header">
      <h3 class="page-title">Search Details</h3>
      <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="#">Search</a></li>
          <li class="breadcrumb-item active" aria-current="page">Edit</li>
        </ol>
      </nav>
    </div>
            <form runat="server">
                <div class="row">
                    <div class="col-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <div class="form-group">
                                  <h4 class="card-title">Enter Reg Number</h4>
    <input type="text" class="form-control" id="regnum" runat="server" placeholder="Registration Number">
 </div>
                                <asp:Button ID="submitButton" runat="server" Text="Submit" CssClass="btn btn-primary mr-2" OnClick="submitButton_Click" />


                            </div>
                        </div>
                    </div>


                            <div class="col-lg-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Subjects</h4>
            <p class="card-description">Details</p>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Course Code</th>
                            <th>Course Name</th> 
                            <th>Student Name</th>
                            <th>Reg Number</th>
                            <th>Email</th>
                            <th>Department</th>
                            <th>Semester</th>
                            <th>Total Marks</th>
                            <th>Obtained Marks</th>
                            <th>Backlog Fee</th>
                          
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%  
                        // Retrieve the registration number from the session

                        // Connection string for your SQL Server database
                        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

                        using (SqlConnection connection = new SqlConnection(connectionString))
                        {
                            // SQL query to fetch backlog details for the given registration number
                        
  string query = "SELECT id, course_code, course_name, total_marks, obtained_marks, backlog_fee, student_name, reg_number, email, department, semester FROM backlog WHERE reg_number = @RegistrationNumber";

                            SqlCommand command = new SqlCommand(query, connection);
                            command.Parameters.AddWithValue("@RegistrationNumber", regnum.Value);

                            connection.Open();

                            SqlDataReader reader = command.ExecuteReader();

                            // Loop through the result set and generate the table rows dynamically
                            while (reader.Read())
                            {
                                int backlogId = reader.GetInt32(reader.GetOrdinal("id"));

                                string courseCode = reader.GetString(reader.GetOrdinal("course_code"));
                                string courseName = reader.GetString(reader.GetOrdinal("course_name"));
                                int totalMarks = reader.GetInt32(reader.GetOrdinal("total_marks"));
                                int obtainedMarks = reader.GetInt32(reader.GetOrdinal("obtained_marks"));
                                decimal backlogFee = reader.GetDecimal(reader.GetOrdinal("backlog_fee"));
                                string studentName = reader.GetString(reader.GetOrdinal("student_name"));
                                                                                string registrationNumber = reader.GetString(reader.GetOrdinal("reg_number"));

                                string email = reader.GetString(reader.GetOrdinal("email"));
                                string department = reader.GetString(reader.GetOrdinal("department"));
                                string semester = reader.GetString(reader.GetOrdinal("semester"));
                        %>
                        <tr>
                            <td><%= courseCode %></td>
                            <td><%= courseName %></td>
                            <td><%= studentName %></td>
                                        <td><%= registrationNumber %></td>

                            <td><%= email %></td>
                            <td><%= department %></td>
                            <td><%= semester %></td>
                            <td><%= totalMarks %></td>
                            <td><%= obtainedMarks %></td>
                            <td><%= backlogFee %></td>
                            
                            <td>
                                <a href="edit.aspx?backlogId=<%= backlogId %>" class="btn btn-inverse-primary btn">Edit</a>
                                <a href="delete.aspx?backlogId=<%= backlogId %>" class="btn btn-inverse-danger btn" onclick="return confirm('Are you sure you want to delete this record?')">Delete</a>
                            </td>
                        </tr>
                        <% 
                            }
                            
                            reader.Close();
                            connection.Close();
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
                        <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Payment</h4>
                        <p class="card-description">Backlog Students Payment details </p>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Registration Number</th>
                                        <th>Student Name</th>
                                        <th>Course Code</th>
                                        <th>Course Name</th>
                                        <th>Semester</th>
                                        <th>Amount</th>
                                        <th>Payment Method</th>
                                        <th>Payment Date</th>
                                        <th>Department</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%  
                                    // Connection string for your SQL Server database

                                    using (SqlConnection connection = new SqlConnection(connectionString))
                                    {
                                        // SQL query to fetch payment details
                                        string query = "SELECT * FROM Payment WHERE RegistrationNumber = @RegistrationNumber";

                            SqlCommand command = new SqlCommand(query, connection);
                            command.Parameters.AddWithValue("@RegistrationNumber", regnum.Value);

                                        connection.Open();

                                        SqlDataReader reader = command.ExecuteReader();

                                        // Loop through the result set and generate the table rows dynamically
                                        while (reader.Read())
                                        {
                                            int id = reader.GetInt32(reader.GetOrdinal("ID"));
                                            string registrationNumber = reader.GetString(reader.GetOrdinal("RegistrationNumber"));
                                            string studentName = reader.GetString(reader.GetOrdinal("StudentName"));
                                            string courseCode = reader.GetString(reader.GetOrdinal("CourseCode"));
                                            string courseName = reader.GetString(reader.GetOrdinal("CourseName"));
                                            string semester = reader.GetString(reader.GetOrdinal("Semester"));
                                            decimal amount = reader.GetDecimal(reader.GetOrdinal("Amount"));
                                            string paymentMethod = reader.GetString(reader.GetOrdinal("PaymentMethod"));
                                            DateTime paymentDate = reader.GetDateTime(reader.GetOrdinal("PaymentDate"));
                                            string department = reader.GetString(reader.GetOrdinal("Department"));
                                    %>
                                    <tr>
                                       
                                        <td><%= registrationNumber %></td>
                                        <td><%= studentName %></td>
                                        <td><%= courseCode %></td>
                                        <td><%= courseName %></td>
                                        <td><%= semester %></td>
                                        <td><%= amount %></td>
                                        <td><%= paymentMethod %></td>
                                        <td><%= paymentDate.ToString("yyyy-MM-dd") %></td>
                                        <td><%= department %></td>
                                        <td>
                                            <a href="deletepay.aspx?id=<%= id %>" class="btn btn-inverse-danger btn-fw" onclick="return confirm('Are you sure you want to delete this record?')">Delete</a>
                                        </td>
                                    </tr>
                                    <% 
                                        }
                                        
                                        reader.Close();
                                        connection.Close();
                                    }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
                            <div class="col-12 grid-margin">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Results Table</h4>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Student Name</th>
                                        <th>Registration Number</th>
                                        <th>Course Code</th>
                                        <th>Course Name</th>
                                        <th>Semester</th>
                                        <th>Department</th>
                                        <th>Total Marks</th>
                                        <th>Obtained Marks</th>
                                        <th>Result Status</th>
                                    </tr>
                                </thead>
                               <!-- Update the table body section with the fetched data -->
<!-- Update the table body section with the fetched data -->
<tbody>
    <%  
    // Retrieve the results from the SQL database

    using (SqlConnection connection = new SqlConnection(connectionString))
    {
        string query = "SELECT * FROM Results WHERE RegistrationNumber = @RegistrationNumber";

                            SqlCommand command = new SqlCommand(query, connection);
                            command.Parameters.AddWithValue("@RegistrationNumber", regnum.Value);

        connection.Open();

        SqlDataReader reader = command.ExecuteReader();

        // Loop through the result set and generate the table rows dynamically
        while (reader.Read())
        {
            int id = reader.GetInt32(reader.GetOrdinal("id"));
            string studentName = reader.GetString(reader.GetOrdinal("StudentName"));
            string regNumber = reader.GetString(reader.GetOrdinal("RegistrationNumber"));
            string courseCode = reader.GetString(reader.GetOrdinal("CourseCode"));
            string courseName = reader.GetString(reader.GetOrdinal("CourseName"));
            string semester = reader.GetString(reader.GetOrdinal("Semester"));
            string department = reader.GetString(reader.GetOrdinal("Department"));
            int totalMarks = reader.GetInt32(reader.GetOrdinal("TotalMarks"));
            int obtainedMarks = reader.GetInt32(reader.GetOrdinal("ObtainedMarks"));
            string resultStatus = reader.GetString(reader.GetOrdinal("ResultStatus"));
    %>
    <tr>
        
        <td><%= studentName %></td>
        <td><%= regNumber %></td>
        <td><%= courseCode %></td>
        <td><%= courseName %></td>
        <td><%= semester %></td>
        <td><%= department %></td>
        <td><%= totalMarks %></td>
        <td><%= obtainedMarks %></td>
        <td><%= resultStatus %></td>
        <td>
            <a href="editre.aspx?id=<%= id %>" class="btn btn-inverse-primary btn">Edit</a>
            <a href="deletere.aspx?id=<%= id %>" class="btn btn-inverse-danger btn" onclick="return confirm('Are you sure you want to delete this record?')">Delete</a>
        </td>
    </tr>
    <% 
        }
        
        reader.Close();
        connection.Close();
    }
    %>
</tbody>

                            </table>
                        </div>
                    </div>
                </div>
            </div>
                          


                </div>
            </form>
        </div>
    </div>
</asp:Content>