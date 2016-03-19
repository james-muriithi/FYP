<?php
$GLOBALS['title'] = "FYPMS";
$GLOBALS['subtitle'] = "Password Recovery";
require_once("includes/header.php");
require_once("includes/config.php");


//Check if form is submitted by POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['forgetPassBtn'])) {

        $email = strtolower($_POST['email']);
        //Check if email exist
        $sql = "";

        $result = $conn->query($sql);

        if ($result->num_rows > 0) {


            header('Location:' . $_SERVER['PHP_SELF'] . '?status=t');

        } else {
            header('Location:' . $_SERVER['PHP_SELF'] . '?status=f');
        }

    }
}


?>
<title>Forgot Password | FYP Management System</title>
</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href=<?php echo $_SERVER['REQUEST_URI'] ?>><b>FYP</b>
            <small>Management System</small>
        </a>
    </div>
    <div class="callout callout-info">
        <h4>Sorry! Password Recovery is currently unavailable</h4>

        <p>Kindly contact your Program Coordinator to reset your password</p>
        <p>admin@fypms.com</p>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">Forgot Password</p>



        <form role="form" action="<?php echo $_SERVER['PHP_SELF']; ?>" id="forgetPass" name="forgetPass" method="POST">
            <div class="form-group has-feedback">
                <input type="email" name="email" class="form-control" name="email"
                       placeholder="Enter your email address" required disabled>
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>

            <div class="row">
                <div class="col-xs-8">

                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="submit" name="forgetPassBtn"
                            class="btn btn-primary btn-block btn-flat">Submit
                    </button>
                </div>
                <!-- /.col -->
            </div>
        </form>


    </div>
    <!-- /.login-box-body -->
</div>

</body>
</html>
