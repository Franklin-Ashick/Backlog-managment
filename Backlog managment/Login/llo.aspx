<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="llo.aspx.cs" Inherits="Backlog_managment.Login.llo" %>

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

	<!-- CSS here    -->
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
        string loginType = Request.Form["login-type"];
        string email = Request.Form["email"];
        string password = Request.Form["password"];

        if (loginType == "student")
        {
            bool isUserValid = VerifyStudentCredentials(email, password);
            (string regNumber, string fullName, string department) = GetStudentDetails(email, password);

            if (isUserValid && !string.IsNullOrEmpty(regNumber))
            {
                // Store user details in session variables
                Session["RegistrationNumber"] = regNumber;
                Session["FullName"] = fullName;
                Session["Department"] = department;

                Response.Redirect("../Student/Stdash.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "InvalidCredentials", "alert('Invalid credentials. Please try again.');", true);
            }
        }
        else if (loginType == "admin")
        {
            bool isAdminValid = VerifyAdminCredentials(email, password);

            if (isAdminValid)
            {
                Response.Redirect("../Admin/AdminDashboard.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "InvalidCredentials", "alert('Invalid credentials. Please try again.');", true);
            }
        }
    }

    private bool VerifyStudentCredentials(string email, string password)
    {
        // Perform the database query to verify student credentials
        // Replace this with your actual database query logic

        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        bool isUserValid = false;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT COUNT(*) FROM users WHERE email = @Email AND password = @Password";

            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@Email", email);
            command.Parameters.AddWithValue("@Password", password);

            connection.Open();
            int count = (int)command.ExecuteScalar();
            connection.Close();

            isUserValid = count > 0;
        }

        return isUserValid;
    }

    private (string, string, string) GetStudentDetails(string email, string password)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        string regNumber = "";
        string fullName = "";
        string department = "";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT reg_number, full_name, department FROM users WHERE email = @Email AND password = @Password";

            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@Email", email);
            command.Parameters.AddWithValue("@Password", password);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                regNumber = reader["reg_number"].ToString();
                fullName = reader["full_name"].ToString();
                department = reader["department"].ToString();
            }
            connection.Close();
        }

        return (regNumber, fullName, department);

    }


    private bool VerifyAdminCredentials(string email, string password)
    {
        return (email == "111" && password == "111");
    }

    private (string, string, string) GetRegistrationNumber(string email, string password)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        string regNumber = "";
        string fullName = "";
        string department = "";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT reg_number, full_name, department FROM users WHERE email = @Email AND password = @Password";

            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@Email", email);
            command.Parameters.AddWithValue("@Password", password);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                regNumber = reader["reg_number"].ToString();
                fullName = reader["full_name"].ToString();
                department = reader["department"].ToString();
            }
            connection.Close();
        }

        return (regNumber, fullName, department);
    }
</script>


<main class="login-body" data-vide-bg="assets/img/login-bg.mp4">
    <!-- Login Admin -->
    <form class="form-default" action="" runat="server" method="POST">
        <div class="login-form">
            <!-- logo-login -->
            <div class="logo-login">
                <a><img src="assets/img/logo/loder.png" alt=""></a>
            </div>
            <h2>Login Here</h2>

            
            <div class="form-input">
                <label for="email">Email Address</label>
                <input type="text" name="email" placeholder="Email Address">
            </div>
            <div class="form-input">
                <label for="password">Password</label>
                <input type="password" name="password" placeholder="Password">
            </div>
             <div class="form-input">
                    <label for="login-type">Login Type</label>
                    <div class="select-wrapper">
                        <select name="login-type" id="login-type" class="styled-select">
                            <option value="student">Student</option>
                            <option value="admin">Admin</option>
                        </select>
                    </div>
                </div>
            <div class="form-input pt-30">
                <asp:Button ID="Button1" runat="server" Text="submit" OnClick="btnSubmit_Click" />
             
            </div>
            <!-- Forget Password -->
            <a href="Reg.aspx" class="registration">Registration</a>
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
