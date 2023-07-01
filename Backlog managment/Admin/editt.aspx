<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admindash.Master" AutoEventWireup="true" CodeBehind="editt.aspx.cs" Inherits="Backlog_managment.Admin.editt" %>
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
                            <h4 class="card-title">Edit Timetable</h4>
                            <form class="form-sample" method="post" runat="server">
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <p class="card-description">Update Timetable</p>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Semester</label>
                                           <div class="col-sm-9">
    <asp:DropDownList ID="ddlSemester" runat="server" CssClass="form-control" Required="true">
        <asp:ListItem Value="">Select Semester</asp:ListItem>
        <asp:ListItem Value="Semester 1">Semester 1</asp:ListItem>
        <asp:ListItem Value="Semester 2">Semester 2</asp:ListItem>
        <asp:ListItem Value="Semester 3">Semester 3</asp:ListItem>
        <asp:ListItem Value="Semester 4">Semester 4</asp:ListItem>
        <asp:ListItem Value="Semester 5">Semester 5</asp:ListItem>
        <asp:ListItem Value="Semester 6">Semester 6</asp:ListItem>
    </asp:DropDownList>
</div>

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Department</label>
                                            <div class="col-sm-9">
                                                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control" Required="true" >
                                                    <asp:ListItem Text="Select Department" Value=""></asp:ListItem>
                                                    <asp:ListItem Text="BCA" Value="BCA"></asp:ListItem>
                                                    <asp:ListItem Text="BSc" Value="BSc"></asp:ListItem>
                                                    <asp:ListItem Text="BA" Value="BA"></asp:ListItem>
                                                    <asp:ListItem Text="BBA" Value="BBA"></asp:ListItem>
                                                    <asp:ListItem Text="MCA" Value="MCA"></asp:ListItem>
                                                    <asp:ListItem Text="MCom" Value="MCom"></asp:ListItem>
                                                    <asp:ListItem Text="MSc" Value="MSc"></asp:ListItem>
                                                    <asp:ListItem Text="MA" Value="MA"></asp:ListItem>
                                                    <asp:ListItem Text="MBA" Value="MBA"></asp:ListItem>
                                                </asp:DropDownList>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Course ID</label>
                                            <div class="col-sm-9">
                                                <asp:TextBox runat="server" ID="txtCourseId" CssClass="form-control" required></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCourseId" CssClass="text-danger" Display="Dynamic" ErrorMessage="Please enter a course ID."></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Course Name</label>
                                            <div class="col-sm-9">
                                                <asp:TextBox runat="server" ID="txtCourseName" CssClass="form-control" required></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCourseName" CssClass="text-danger" Display="Dynamic" ErrorMessage="Please enter a course name."></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Date</label>
                                            <div class="col-sm-9">
                                                <asp:TextBox runat="server" ID="txtDate" CssClass="form-control" TextMode="Date" required></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDate" CssClass="text-danger" Display="Dynamic" ErrorMessage="Please select a date."></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <asp:Button ID="btnSubmit" runat="server" Text="Update" OnClick="btnSubmit_Click" CssClass="btn btn-primary" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>