<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reg.aspx.cs" Inherits="Backlog_managment.Login.Reg" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Registration</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <!-- CSS here -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/slicknav.css">
    <link rel="stylesheet" href="assets/css/flaticon.css">
    <link rel="stylesheet" href="assets/css/progressbar_barfiller.css">
    <link rel="stylesheet" href="assets/css/gijgo.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/animated-headline.css">
    <link rel="stylesheet" href="assets/css/magnific-popup.css">
    <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/slick.css">
    <link rel="stylesheet" href="assets/css/nice-select.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
        .styled-select {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background: url("assets/img/arrow.png") no-repeat right center;
            padding-right: 25px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            color: #0026ff;
            width: 100%;
            height: 34px;
            line-height: 1.42857143;
            box-sizing: border-box; /* Ensure box-sizing includes padding and border */
            padding: 12px 170px; /* Set padding to match the textboxes */
        }

            .styled-select:focus {
                outline: none;
            }

        .select-wrapper {
            position: relative;
            display: inline-block;
        }

            .select-wrapper::after {
                content: '';
                position: absolute;
                top: 50%;
                right: 10px;
                width: 8px;
                height: 8px;
                margin-top: -4px;
                border-top: 1px solid #999;
                border-right: 1px solid #999;
                transform: rotate(45deg);
                pointer-events: none;
            }
    </style>
</head>
<body>

    <script runat="server">
     protected void btnSubmit_Click(object sender, EventArgs e)
{
    string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

    string fullName = Request.Form["name"];
    string regNumber = Request.Form["reg_number"];
    string email = Request.Form["email"];
    string password = Request.Form["password"];
    string department = Request.Form["department"];

    using (SqlConnection connection = new SqlConnection(connectionString))
    {
        string insertQuery = "INSERT INTO users (full_name, reg_number, email, password, department) VALUES (@FullName, @RegNumber, @Email, @Password, @Department)";

        SqlCommand command = new SqlCommand(insertQuery, connection);
        command.Parameters.AddWithValue("@FullName", fullName);
        command.Parameters.AddWithValue("@RegNumber", regNumber);
        command.Parameters.AddWithValue("@Email", email);
        command.Parameters.AddWithValue("@Password", password);
        command.Parameters.AddWithValue("@Department", department);

        try
        {
            connection.Open();
            int rowsAffected = command.ExecuteNonQuery();
            if (rowsAffected > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "RegistrationComplete", "alert('Registration completed!'); window.location.href = 'llo.aspx';", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "RegistrationError", "alert('Registration failed!');", true);
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "RegistrationError", $"alert('Registration failed: {ex.Message}');", true);
        }
        finally
        {
            connection.Close();
        }
    }
}

    </script>

    <main class="login-body" data-vide-bg="assets/img/login-bg.mp4">
        <!-- Login Admin -->
        <form class="form-default" action="" runat="server" method="POST">
            <div class="login-form">
                <!-- logo-login -->
                <div class="logo-login">
                    <a href="index.html">
                        <img src="assets/img/logo/loder.png" alt=""></a>
                </div>
                <h2>Registration Here</h2>

                <div class="form-input">
                    <label for="name">Full name</label>
                    <input type="text" required name="name" placeholder="Full name">
                </div>
                <div class="form-input">
                    <label for="reg_number">Registration Number</label>
                    <input type="text"required name="reg_number" placeholder="Registration Number">
                </div>
                <div class="form-input">
                    <label for="department">Department</label>
                    <div class="select-wrapper">
                        <select name="department" id="department" required class="styled-select">
                            <option value="BCA">BCA</option>
                            <option value="BCom">BCom</option>
                            <option value="BSc">BSc</option>
                            <option value="BA">BA</option>
                            <option value="BBA">BBA</option>
                        </select>
                    </div>
                </div>
                <div class="form-input">
                    <label for="email">Email Address</label>
                    <input type="email" name="email" required placeholder="Email Address">
                </div>
                <div class="form-input">
                    <label for="password">Password</label>
                    <input type="password" required name="password" placeholder="Password">
                </div>
                <div class="form-input">
                    <label for="confirm_password">Confirm Password</label>
                    <input type="password" required name="confirm_password" placeholder="Confirm Password">
                </div>
                <div class="form-input pt-30">
                    <asp:Button ID="Button1" runat="server" Text="submit" OnClick="btnSubmit_Click" />

                </div>
                <!-- Forget Password -->
                <a href="llo.aspx" class="registration">Login</a>
            </div>
        </form>
        <!-- /end login form -->
    </main>




    <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <!-- Jquery, Popper, Bootstrap -->
    <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="./assets/js/popper.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="./assets/js/jquery.slicknav.min.js"></script>

    <!-- Video bg -->
    <script src="./assets/js/jquery.vide.js"></script>

    <!-- Jquery Slick , Owl-Carousel Plugins -->
    <script src="./assets/js/owl.carousel.min.js"></script>
    <script src="./assets/js/slick.min.js"></script>
    <!-- One Page, Animated-HeadLin -->
    <script src="./assets/js/wow.min.js"></script>
    <script src="./assets/js/animated.headline.js"></script>
    <script src="./assets/js/jquery.magnific-popup.js"></script>

    <!-- Date Picker -->
    <script src="./assets/js/gijgo.min.js"></script>
    <!-- Nice-select, sticky -->
    <script src="./assets/js/jquery.nice-select.min.js"></script>
    <script src="./assets/js/jquery.sticky.js"></script>
    <!-- Progress -->
    <script src="./assets/js/jquery.barfiller.js"></script>

    <!-- counter , waypoint,Hover Direction -->
    <script src="./assets/js/jquery.counterup.min.js"></script>
    <script src="./assets/js/waypoints.min.js"></script>
    <script src="./assets/js/jquery.countdown.min.js"></script>
    <script src="./assets/js/hover-direction-snake.min.js"></script>

    <!-- contact js -->
    <script src="./assets/js/contact.js"></script>
    <script src="./assets/js/jquery.form.js"></script>
    <script src="./assets/js/jquery.validate.min.js"></script>
    <script src="./assets/js/mail-script.js"></script>
    <script src="./assets/js/jquery.ajaxchimp.min.js"></script>

    <!-- Jquery Plugins, main Jquery -->
    <script src="./assets/js/plugins.js"></script>
    <script src="./assets/js/main.js"></script>

</body>
</html>
