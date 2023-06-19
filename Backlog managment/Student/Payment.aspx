<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student_Dashboard.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Backlog_managment.Student.Payment" %>
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
                                <h4 class="card-title">Make Payment</h4>
                                <div class="form-group">
                                    <label for="txtAmount">Amount:</label>
<asp:TextBox ID="txtBacklogFee" runat="server"  ReadOnly="true" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="ddlPaymentMethod">Payment Method:</label>
                                    <asp:DropDownList ID="ddlPaymentMethod" runat="server" CssClass="form-control">
                                        <asp:ListItem Text="Credit Card" Value="CreditCard"></asp:ListItem>
                                        <asp:ListItem Text="Debit Card" Value="DebitCard"></asp:ListItem>
                                        <asp:ListItem Text="Net Banking" Value="NetBanking"></asp:ListItem>
                                       
                                    </asp:DropDownList>
                                </div>
                                <asp:Button ID="btnPay" runat="server" Text="Pay Now" CssClass="btn btn-primary" OnClick="btnPay_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</asp:Content>
