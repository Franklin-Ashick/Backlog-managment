<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admindash.Master" AutoEventWireup="true" CodeBehind="Timetable.aspx.cs" Inherits="Backlog_managment.Admin.Timetable" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="page-header">
                <h3 class="page-title">Timetable</h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Upload</a></li>
                        <li class="breadcrumb-item active" aria-current="page">View</li>
                    </ol>
                </nav>
            </div>
            <div class="row">
                <div class="col-12 grid-margin">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Enter Timetable</h4>
                            <form class="form-sample" method="post" runat="server" onsubmit="return validateForm()">
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <p class="card-description">Timetable Details</p>
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
                                                    <option value="Semester 6">Semester 6</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
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
                                            <label class="col-sm-3 col-form-label">Course ID</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="course_id" required />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Course Name</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="course_name" required />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Date</label>
                                            <div class="col-sm-9">
                                                <input type="date" class="form-control" name="date" required />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-primary"></asp:Button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
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
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%  
                        // Connection string for your SQL Server database
                        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

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
                            <td>
                                <a href="editt.aspx?timetableId=<%= timetableId %>" class="btn btn-inverse-primary btn-fw">Edit</a>
                                <a href="deletet.aspx?timetableId=<%= timetableId %>" class="btn btn-inverse-danger btn-fw" onclick="return confirm('Are you sure you want to delete this record?')">Delete</a>
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

    <script>
        function validateForm() {
            var semester = document.forms[0].semester.value;
            var department = document.forms[0].department.value;
            var course_id = document.forms[0].course_id.value;
            var course_name = document.forms[0].course_name.value;
            var date = document.forms[0].date.value;

            if (semester === "" || department === "" || course_id === "" || course_name === "" || date === "") {
                alert("All fields must be filled out");
                return false;
            }

            return true;
        }
    </script>
</asp:Content>