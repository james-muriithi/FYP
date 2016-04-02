<?php
$GLOBALS['title']="FYPMS";
$GLOBALS['subtitle']="Login";
require_once("includes/header.php");
require_once("includes/config.php");
session_start();
$error="";
if(isset($_SESSION["usrnm"]))
{
	header('Location: '.'home.php');
}
if(isset($_POST["email"]) && isset($_POST["pasword"]))
{
$userEmail =  filter_input(INPUT_POST, "email",FILTER_SANITIZE_SPECIAL_CHARS);
$userPass = filter_input(INPUT_POST, "pasword",FILTER_SANITIZE_SPECIAL_CHARS);
$sql = "SELECT studentId, studentName, studentCMS, studentPhoneNo, studentEmail, studentGender, studentPassword,student_image, groupId, isLeader, batchId FROM student";
$sql2 = "SELECT facultyId, designation, facultyName, facultyPhoneNo, facultyEmail, facultyPassword, isAdmin, isCoordinator FROM faculty";
$sql3 ="SELECT * FROM external_examiner";

$result = $conn->query($sql);
$result2 = $conn->query($sql2);
$result3 = $conn->query($sql3);

$check=0;
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            if($row["studentEmail"]==$userEmail && $row["studentPassword"]==$userPass)
            {
//****************************************************************************************************************************************************
//
//													Setting up seeion variables
//
//**************************************************************************************************************************************************** -->
     
                    $_SESSION["usrId"]=$row["studentId"];
                    $_SESSION["usrnm"]=$row["studentName"];
                    $_SESSION["usrCMS"]=$row["studentCMS"];
					$_SESSION["usrEmail"]=$row["studentEmail"];
					$_SESSION["usrGender"]=$row["studentGender"];
                    $_SESSION["type"]="Student";
                    $_SESSION["usrId"]=$row["studentId"];
                    $_SESSION["isLead"]=$row["isLeader"];
                    $_SESSION["GroupID"]=$row["groupId"];
					$_SESSION["BatchID"]=$row["batchId"];
//					echo $row["batchId"];
//                    $_SESSION["image"]=$row["profileImage"];
                    $_SESSION["usrEmail"]=$row["studentEmail"];
                    $_SESSION["image"]=$row["student_image"];
                    $_SESSION["contact"]=$row["studentPhoneNo"];
//                    $variabl = $row["studentName"];
                    //echo $variabl;
                    $check=1;
//                    $_POST[$variabl];
                    //echo "id: " . $row["studentId"]. " - Name: " . $row["studentName"]. " " . $row["studentPassword"]. "<br>";
                    
					
					
					
					header('Location: '.'home.php');
            }
        }
//****************************************************************************************************************************************************
//
//													Verifying user credentials as faculty member or admin and coordinator
//
//**************************************************************************************************************************************************** -->
     
    }
    if ($result2->num_rows > 0) {
        while($row2 = $result2->fetch_assoc()) {
            if($row2["facultyEmail"]==$userEmail && $row2["facultyPassword"]==$userPass)
            {
//****************************************************************************************************************************************************
//
//													setting up session variables
//
//**************************************************************************************************************************************************** -->
     
                session_start();
                $_SESSION["facultyId"]=$row2["facultyId"];
                $_SESSION["usrnm"]=$row2["facultyName"];
                $_SESSION["design"]=$row2["designation"];
                $_SESSION["isCord"]=$row2["isCoordinator"];
                $_SESSION["isAdmin"]=$row2["isAdmin"];
                $_SESSION["type"]="Faculty";
                $_SESSION["image"]=$row2["profileImage"];
                    
                //$variabl = $row["studentName"];
                //echo $variabl;
                $check=1;
                //$_POST[$variabl];
                echo "id: " . $row["studentId"]. " - Name: " . $row["studentName"]. " " . $row["studentPassword"]. "<br>";
                header('Location: '.'home.php');
            }
        }
    }
	if ($result3->num_rows > 0) {
        while($row3 = $result3->fetch_assoc()) {
            if($row3["examinerEmail"]==$userEmail && $row3["examinerPassword"]==$userPass)
            {
//****************************************************************************************************************************************************
//
//													setting up session variables
//
//**************************************************************************************************************************************************** -->
     
                session_start();
                $_SESSION["examinerId"]=$row3["examinerId"];
                $_SESSION["usrnm"]=$row3["examinerName"];
				$examiner=$row3["examinerId"];
                $_SESSION["design"]="External Examiner";
                $_SESSION["type"]="Examiner";
                $_SESSION["image"]=$row2["profileImage"];
                    
                //$variabl = $row["studentName"];
                //echo $variabl;
                $check=1;
				//echo $row3["examinerName"];
                //$_POST[$variabl];
                //echo "id: " . $row["studentId"]. " - Name: " . $row["studentName"]. " " . $row["studentPassword"]. "<br>";
                header('Location: '.'home.php');
            }
        }
    }

    if($check==0)
    {
        $error="Email or Password is invalid";?>
        <div style="text-align:center;" class="alert alert-danger" role="alert">
        <span class="glyphicon glyphicon-exclamation-sign"></span>
        <?php echo $error?>
        <button type="button" class="close" data-dismiss="alert">x</button>
        </div>        
      <?php
    }
    $conn->close();
    }

?>

<title>Login | FYP Management System</title>
</head>

<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="<?php echo $_SERVER['REQUEST_URI']?>"><b>FYP</b> <small>Management System</small></a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Sign in to start your session</p>

    <form action="index.php" method="POST">
      <div class="form-group has-feedback">
          <input type="email" class="form-control" name="email" placeholder="Email" required>
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
          <input type="password" class="form-control" name="pasword" placeholder="Password" required>
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          
        </div>
        <!-- /.col -->
        <div class="col-lg-12">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
        </div>
        <!-- /.col -->
      </div>
    </form>
    <br />
    <a href="password_reset.php">I forgot my password</a><br>

  </div>
  <!-- /.login-box-body -->
</div>
<?php require_once("includes/required_js.php");?>
</body>
</html>
