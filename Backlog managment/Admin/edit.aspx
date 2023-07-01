<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admindash.Master" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="Backlog_managment.Admin.edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
      <div class="col-12 grid-margin">
        <div class="card">
          <div class="card-body">
            <h4 class="card-title">Edit Backlog Details</h4>
            <form class="form-sample" method="post" runat="server" onsubmit="return validateForm()">
              <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
              <p class="card-description">Backlog Details</p>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Student Name</label>
                    <div class="col-sm-9">
                      <asp:TextBox ID="student_name" runat="server" CssClass="form-control" Required></asp:TextBox>
                    </div>
                  </div>
                </div>
               <div class="col-md-6">
                  <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Registration Number</label>
                    <div class="col-sm-9">
                      <asp:TextBox ID="reg_number" runat="server" CssClass="form-control" Pattern="[A-Z0-9]+" Required></asp:TextBox>
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
                      <asp:TextBox ID="email" runat="server" CssClass="form-control" Required></asp:TextBox>
                    </div>
                  </div>
                </div>
               <div class="col-md-6">
                  <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Department</label>
                    <div class="col-sm-9">
                        <asp:DropDownList ID="department" runat="server" CssClass="form-control" Required>
                            <asp:ListItem Value="">Select Department</asp:ListItem>
                            <asp:ListItem Value="BCA">BCA</asp:ListItem>
                            <asp:ListItem Value="BCom">BCom</asp:ListItem>
                            <asp:ListItem Value="BBA">BCom</asp:ListItem>
                            <asp:ListItem Value="Other">Other</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Semester</label>
                    <div class="col-sm-9">
                      <asp:DropDownList ID="semester" runat="server" CssClass="form-control" Required>
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
                    <label class="col-sm-3 col-form-label">Course Code</label>
                    <div class="col-sm-9">
                      <asp:TextBox ID="course_code" runat="server" CssClass="form-control" Required></asp:TextBox>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Course Name</label>
                    <div class="col-sm-9">
                      <asp:TextBox ID="course_name" runat="server" CssClass="form-control" Required></asp:TextBox>
                    </div>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Total Marks</label>
                    <div class="col-sm-9">
                      <asp:TextBox ID="total_marks" runat="server" CssClass="form-control" Required></asp:TextBox>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Obtained Marks</label>
                    <div class="col-sm-9">
                      <asp:TextBox ID="obtained_marks" runat="server" CssClass="form-control" Required></asp:TextBox>
                    </div>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Backlog Fee</label>
                    <div class="col-sm-9">
                      <asp:TextBox ID="backlog_fee" runat="server" CssClass="form-control" Required></asp:TextBox>
                    </div>
                  </div>
                </div>
              </div>
                <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Update" OnClick="btnSave_Click" />
            
            </form>
          </div>
        </div>
      </div>
    </div>
</asp:Content>
