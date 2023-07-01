<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student_Dashboard.Master" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="Backlog_managment.Student.Results1" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-panel" >
        <div class="content-wrapper">
            <div class="row">
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">

                            
                            <h4 class="card-title">Results</h4>
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
                                    <tbody>
                                        <%  
                                        // Retrieve the registration number from the session
                                        string registrationNumber = Session["RegistrationNumber"] as string;

                                        // Connection string for your SQL Server database
                                        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

                                        using (SqlConnection connection = new SqlConnection(connectionString))
                                        {
                                            // SQL query to fetch results data for the specified registration number
                                            string query = "SELECT StudentName, RegistrationNumber, CourseCode, CourseName, Semester, Department, TotalMarks, ObtainedMarks, ResultStatus FROM Results WHERE RegistrationNumber = @RegistrationNumber";

                                            SqlCommand command = new SqlCommand(query, connection);
                                            command.Parameters.AddWithValue("@RegistrationNumber", registrationNumber);

                                            connection.Open();

                                            SqlDataReader reader = command.ExecuteReader();

                                            // Loop through the result set and generate the table rows dynamically
                                            while (reader.Read())
                                            {
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
            </div>
        </div>
    </div>
</asp:Content>
