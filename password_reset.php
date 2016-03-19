<?php
    require_once("includes/header.php");
    require_once("includes/config.php");
    if(isset($_POST["email"])){
        echo "success";
    }
?>
<title>Forgot Password | FYP Management System</title>
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href=<?php echo $_SERVER['REQUEST_URI']?>><b>FYP</b> <small>Management System</small></a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Forgot Password</p>

    <form action="password_reset.php" method="POST">
      <div class="form-group has-feedback">
        <input type="email" class="form-control" name="email" placeholder="Enter your email address">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      
      <div class="row">
        <div class="col-xs-8">
          
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Submit</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

    

  </div>
  <!-- /.login-box-body -->
</div>

</body>
</html>
