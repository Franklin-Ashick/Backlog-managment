<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admindash.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="Backlog_managment.Admin.Report" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dom-to-image/2.6.0/dom-to-image.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="page-header">
                <h3 class="page-title">Report</h3>
                
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                             <form id="form1"   runat="server">
                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary btn-rounded btn-fw" Text="Print" OnClientClick="generatePDF()" />
                            </form>
                            </li>
                        <li class="breadcrumb-item active" aria-current="page">View</li>
                    </ol>
                </nav>
                    
            </div>
            <div id="printContent">
            <div class="row">
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Backlog</h4>
                            <p class="card-description">Details</p>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Course Code</th>
                                            <th>Course Name</th>
                                            <th>Student Name</th>
                                            <th>Email</th>
                                            <th>Department</th>
                                            <th>Semester</th>
                                            <th>Total Marks</th>
                                            <th>Obtained Marks</th>
                                            <th>Backlog Fee</th>

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
                                                string query = "SELECT id, course_code, course_name, total_marks, obtained_marks, backlog_fee, student_name, email, department, semester FROM backlog";

                                                SqlCommand command = new SqlCommand(query, connection);

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
                                                    string email = reader.GetString(reader.GetOrdinal("email"));
                                                    string department = reader.GetString(reader.GetOrdinal("department"));
                                                    string semester = reader.GetString(reader.GetOrdinal("semester"));
                                        %>
                                        <tr>
                                            <td><%= courseCode %></td>
                                            <td><%= courseName %></td>
                                            <td><%= studentName %></td>
                                            <td><%= email %></td>
                                            <td><%= department %></td>
                                            <td><%= semester %></td>
                                            <td><%= totalMarks %></td>
                                            <td><%= obtainedMarks %></td>
                                            <td><%= backlogFee %></td>


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
                            <h4 class="card-title">Results</h4>
                            <p class="card-description">Passed Students</p>
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
                                                string query = "SELECT * FROM Results WHERE ResultStatus = 'Pass'";

                                                SqlCommand command = new SqlCommand(query, connection);

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
                            <h4 class="card-title">Results</h4>
                            <p class="card-description">Failed Students</p>
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
                                                string query = "SELECT * FROM Results WHERE ResultStatus = 'Fail'";

                                                SqlCommand command = new SqlCommand(query, connection);

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
                            <p class="card-description">Backlog Fee Payment </p>
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

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%  
                                            // Connection string for your SQL Server database


                                            using (SqlConnection connection = new SqlConnection(connectionString))
                                            {
                                                // SQL query to fetch payment details
                                                string query = "SELECT * FROM Payment";

                                                SqlCommand command = new SqlCommand(query, connection);

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
                            <h4 class="card-title">Timetable</h4>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Semester</th>
                                            <th>Department</th>
                                            <th>Course ID</th>
                                            <th>Course Name</th>
                                            <th>Date</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%  
                                            // Connection string for your SQL Server database

                                            using (SqlConnection connection = new SqlConnection(connectionString))
                                            {
                                                // SQL query to fetch timetable data
                                                string query = "SELECT id, Semester, Department, course_id, course_name, date FROM timetable";

                                                SqlCommand command = new SqlCommand(query, connection);

                                                connection.Open();

                                                SqlDataReader reader = command.ExecuteReader();

                                                // Loop through the result set and generate the table rows dynamically
                                                while (reader.Read())
                                                {
                                                    int timetableId = reader.GetInt32(reader.GetOrdinal("id"));
                                                    string semester = reader.GetString(reader.GetOrdinal("Semester"));
                                                    string department = reader.GetString(reader.GetOrdinal("Department"));
                                                    string courseId = reader.GetString(reader.GetOrdinal("course_id"));
                                                    string courseName = reader.GetString(reader.GetOrdinal("course_name"));
                                                    DateTime date = reader.GetDateTime(reader.GetOrdinal("date"));
                                        %>
                                        <tr>
                                            <td><%= semester %></td>
                                            <td><%= department %></td>
                                            <td><%= courseId %></td>
                                            <td><%= courseName %></td>
                                            <td><%= date.ToString("yyyy-MM-dd") %></td>

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
        </div>
            </div></div>
    
         <script type="text/javascript">
             function generatePDF() {
                 var printDiv = document.getElementById("printContent");
                 var printContents = printDiv.innerHTML;
                 var originalContents = document.body.innerHTML;
                 document.body.innerHTML = printContents;
                 window.print();
                 document.body.innerHTML = originalContents;
             }
         </script>
</asp:Content>