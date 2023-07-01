<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student_Dashboard.Master" AutoEventWireup="true" CodeBehind="backlog.aspx.cs" Inherits="Backlog_managment.Student.backlog" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="main-panel">
        <div class="content-wrapper">
            <form runat="server">
                <div class="row">
                    <div class="col-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <div class="form-group">
                                <h4 class="card-title">Select Semester</h4>
                                <asp:DropDownList ID="semesterDropDown" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Semester 1" Value="Semester 1"></asp:ListItem>
                                    <asp:ListItem Text="Semester 2" Value="Semester 2"></asp:ListItem>
                                    <asp:ListItem Text="Semester 3" Value="Semester 3"></asp:ListItem>
                                    <asp:ListItem Text="Semester 4" Value="Semester 4"></asp:ListItem>
                                    <asp:ListItem Text="Semester 5" Value="Semester 5"></asp:ListItem>
                                    <asp:ListItem Text="Semester 6" Value="Semester 6"></asp:ListItem>
                                </asp:DropDownList>
                                    </div>
                                <asp:Button ID="submitButton" runat="server" Text="Submit" CssClass="btn btn-primary mr-2" OnClick="submitButton_Click" />

                                
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Subjects</h4>
                    <p class="card-description"> Can pay From here 
                    </p>
                    <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Course Code</th>
                                                <th>Course Name</th>
                                                <th>Total Marks</th>
                                                <th>Obtained Marks</th>
                                                <th>Backlog Fee</th>
                                                <th>Action</th>
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
                                                // SQL query to fetch backlog details for the given semester
                                                string query = "SELECT course_code, course_name, total_marks, obtained_marks, backlog_fee FROM backlog WHERE semester = @Semester";

                                                SqlCommand command = new SqlCommand(query, connection);
                                                command.Parameters.AddWithValue("@Semester", semesterDropDown.SelectedValue);

                                                connection.Open();

                                                SqlDataReader reader = command.ExecuteReader();

                                                // Loop through the result set and generate the table rows dynamically
                                                while (reader.Read())
                                                {
                                                    string courseCode = reader.GetString(reader.GetOrdinal("course_code"));
                                                    string courseName = reader.GetString(reader.GetOrdinal("course_name"));
                                                    int totalMarks = reader.GetInt32(reader.GetOrdinal("total_marks"));
                                                    int obtainedMarks = reader.GetInt32(reader.GetOrdinal("obtained_marks"));
                                                    decimal backlogFee = reader.GetDecimal(reader.GetOrdinal("backlog_fee"));
                                            %>
                                            <tr>
                                                <td><%= courseCode %></td>
                                                <td><%= courseName %></td>
                                                <td><%= totalMarks %></td>
                                                <td><%= obtainedMarks %></td>
                                                <td><%= backlogFee %></td>
                                               <td>
<a href="payment.aspx?courseCode=<%= courseCode %>&courseName=<%= courseName %>&backlogFee=<%= backlogFee %>&semester=<%= semesterDropDown.SelectedValue %>" class="btn btn-inverse-primary btn-fw">Pay</a>

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