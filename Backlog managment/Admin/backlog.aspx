<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admindash.Master" AutoEventWireup="true" CodeBehind="backlog.aspx.cs" Inherits="Backlog_managment.Admin.backlog" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="main-panel">
  <div class="content-wrapper">
    <div class="page-header">
      <h3 class="page-title">Backlog Details</h3>
      <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="#">Upload</a></li>
          <li    class="breadcrumb-item active" aria-current="page">Edit</li>
        </ol>
      </nav>
    </div>
    <div class="row">
      <div class="col-12 grid-margin">
        <div class="card">
          <div class="card-body">
            <h4 class="card-title">Upload Backlog Details</h4>
            <form class="form-sample" method="post" runat="server" onsubmit="return validateForm()">
              <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
              <p class="card-description">Backlog Details</p>
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
                    <label class="col-sm-3 col-form-label">Email</label>
                    <div class="col-sm-9">
                      <input type="email" class="form-control" name="email" required />
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
                    <label class="col-sm-3 col-form-label">Backlog Fee</label>
                    <div class="col-sm-9">
                      <input type="number" step="0.01" class="form-control" name="backlog_fee" required />
                    </div>
                  </div>
                </div>
              </div>
              <button type="submit" class="btn btn-primary">Save</button>
            </form>
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







    </div>

  </div>
</div>

<script>

    function validateForm() {
        // Get the form inputs
        var studentName = document.querySelector('input[name="student_name"]').value;
        var regNumber = document.querySelector('input[name="reg_number"]').value;
        var email = document.querySelector('input[name="email"]').value;
        var department = document.querySelector('select[name="department"]').value;
        var semester = document.querySelector('select[name="semester"]').value;
        var courseCode = document.querySelector('input[name="course_code"]').value;
        var courseName = document.querySelector('input[name="course_name"]').value;
        var totalMarks = document.querySelector('input[name="total_marks"]').value;
        var obtainedMarks = document.querySelector('input[name="obtained_marks"]').value;
        var backlogFee = document.querySelector('input[name="backlog_fee"]').value;

        // Perform validation
        if (studentName === "" || regNumber === "" || email === "" || department === "" || semester === "" || courseCode === "" || courseName === "" || totalMarks === "" || obtainedMarks === "" || backlogFee === "") {
            alert("Please fill in all the details.");
            return false; // Prevent form submission
        }

        // Additional validation logic if needed

        return true; // Submit the form
    }
</script>


</asp:Content>
