<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admindash.Master" AutoEventWireup="true" CodeBehind="editre.aspx.cs" Inherits="Backlog_managment.Admin.editre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="main-panel">
        <div class="content-wrapper">
            <div class="page-header">
                <h3 class="page-title">Edit Results</h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Upload</a></li>
                        <li class="breadcrumb-item"><a href="#">Edit</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Edit Results</li>
                    </ol>
                </nav>
            </div>
            <div class="row">
                <div class="col-12 grid-margin">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Edit Results</h4>
                            <form class="form-sample" method="post" runat="server" onsubmit="return validateForm()">
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <p class="card-description">Results Details</p>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Student Name</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="student_name" id="student_name" runat="server" required />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Registration Number</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="reg_number" id="reg_number" runat="server" pattern="[A-Z0-9]+" required />
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
                                                <select class="form-control" name="department" id="department" runat="server" required>
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
                                            <label class="col-sm-3 col-form-label">Course Name</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="course_name" id="course_name" runat="server" required />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Course Code</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="course_code" id="course_code" runat="server" required />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Semester</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="semester" id="semester" runat="server" required />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Total Marks</label>
                                            <div class="col-sm-9">
                                                <input type="number" class="form-control" name="total_marks" id="total_marks" runat="server" required />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Obtained Marks</label>
                                            <div class="col-sm-9">
                                                <input type="number" class="form-control" name="obtained_marks" id="obtained_marks" runat="server" required />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Result Status</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" name="result_status" id="result_status" runat="server" required>
                                                    <option value="">Select Result Status</option>
                                                    <option value="Pass">Pass</option>
                                                    <option value="Fail">Fail</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary mr-2" OnClick="btnUpdate_Click" />
                                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-light" OnClick="btnCancel_Click" />
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
