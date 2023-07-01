<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student_Dashboard.Master" AutoEventWireup="true" CodeBehind="Timetable.aspx.cs" Inherits="Backlog_managment.Student.Results" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1"  ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="main-panel">
        <div class="content-wrapper">
            <form runat="server">
                <div class="row">
                

                    <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Time Table</h4>
                    <p class="card-description"> Of your Department 
                    </p>
    
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Semester</th>
                    <th>Department</th>
                    <th>Course Code</th>
                    <th>Course Name</th>
                    <th>Date</th>
                   
                </tr>
            </thead>
            <tbody>
                <%  
                // Retrieve the department from the session
                string department = Session["Department"] as string;

                // Connection string for your SQL Server database
                string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // SQL query to fetch timetable data for the specified department
                    string query = "SELECT Semester, department, course_id, course_name, date FROM timetable WHERE Department = @Department";

                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Department", department);

                    connection.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    // Loop through the result set and generate the table rows dynamically
                    while (reader.Read())
                    {
                        string semester = reader.GetString(reader.GetOrdinal("Semester"));
                        string dept = reader.GetString(reader.GetOrdinal("department"));
                        string courseCode = reader.GetString(reader.GetOrdinal("course_id"));
                        string courseName = reader.GetString(reader.GetOrdinal("course_name"));
                        DateTime date = reader.GetDateTime(reader.GetOrdinal("date"));
                        
                %>
                <tr>
                    <td><%= semester %></td>
                    <td><%= dept %></td>
                    <td><%= courseCode %></td>
                    <td><%= courseName %></td>
                    <td><%= date.ToShortDateString() %></td>
                  
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
                      </div></div></div></div></form></div></div>
</asp:Content>