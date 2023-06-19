<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admindash.Master" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="Backlog_managment.Admin.Results" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="main-panel">
    <div class="content-wrapper">
        <div class="page-header">
            <h3 class="page-title">Results Details</h3>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Upload</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Edit</li>
                </ol>
            </nav>
        </div>
        <div class="row">
            <div class="col-12 grid-margin">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Upload Results Details</h4>
                        <form class="form-sample" method="post" runat="server" onsubmit="return validateForm()">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <p class="card-description">Results Details</p>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Student Name</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="student_name" required />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Registration Number</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="reg_number" pattern="[A-Z0-9]+" required />
                                            <small>Registration number should be a combination of numbers and capital letters.</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                             
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Department</label>
                                        <div class="col-sm-9">
                                            <select class="form-control" name="department" required>
                                                <option value="">Select Department</option>
                                                     <option value="BCA">BCA</option>
                    <option value="BSc">BSc</option>
                    <option value="BA">BA</option>
                    <option value="BBA">BBA</option>
                    <option value="MCA">MCA</option>
                    <option value="MCom">MCom</option>
                    <option value="MSc">MSc</option>
                    <option value="MA">MA</option>
                    <option value="MBA">MBA</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Semester</label>
                                        <div class="col-sm-9">
                                            <select class="form-control" name="semester" required>
                                                <option value="">Select Semester</option>
                                                <option value="Semester 1">Semester 1</option>
                                                <option value="Semester 2">Semester 2</option>
                                                <option value="Semester 3">Semester 3</option>
                                                <option value="Semester 4">Semester 4</option>
                                                <option value="Semester 5">Semester 5</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Course Code</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="course_code" required />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Course Name</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="course_name" required />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Total Marks</label>
                                        <div class="col-sm-9">
                                            <input type="number" class="form-control" name="total_marks" required />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Obtained Marks</label>
                                        <div class="col-sm-9">
                                            <input type="number" class="form-control" name="obtained_marks" required />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Result Status</label>
                                        <div class="col-sm-9">
                                            <select class="form-control" name="result_status" required>
                                                <option value="">Select Result Status</option>
                                                <option value="Pass">Pass</option>
                                                <option value="Fail">Fail</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <asp:Button ID="Button1" class="btn btn-primary" runat="server" OnClick="btnInsert_Click" Text="Submit" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
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
                                        <th>Action</th>
                                    </tr>
                                </thead>
                               <!-- Update the table body section with the fetched data -->
<!-- Update the table body section with the fetched data -->
<tbody>
    <%  
    // Retrieve the results from the SQL database
    string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

    using (SqlConnection connection = new SqlConnection(connectionString))
    {
        string query = "SELECT * FROM Results";

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
    </div>
</div>

</asp:Content>
