<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admindash.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Backlog_managment.Admin.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%@ Import Namespace="System.Data.SqlClient" %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="main-panel">
        <div class="content-wrapper">
            <div class="page-header">
                <h3 class="page-title">Payment Details</h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Updated</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Delete</li>
                    </ol>
                </nav>
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
                                    string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

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
        </div>
    </div>
</asp:Content>
