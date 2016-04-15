<?php 
$title="FYPMS";
$subtitle="Register Faculty Members";
require_once("includes/header.php");
require_once("includes/config.php");
require("libs/sendgrid-php/sendgrid-php.php");
require_once("includes/mail-tempelates.php");
require_once("includes/functions.php");
session_start();
if(!isset($_SESSION["isAdmin"]))
{
    header('Location: '.'index.php');
}
if((isset($_POST['facultyName'])) && (isset($_POST['facultyDesign'])) && (isset($_POST['facultyEmail']))) {
    if(($_POST['facultyName']!="") && ($_POST['facultyDesign']!="") && ($_POST['facultyEmail']!=""))
    {

    //echo $_POST['facultyName']." ".$_POST['facultyCMS']." ".$_POST['facultyEmail']." ".$_POST['phoneNumber']." ".$_POST['batch']." ".$_POST['facultyPass'];
    $facultyName = $_POST['facultyName'];
    $facultyDesign = $_POST['facultyDesign'];
    $facultyEmail = strtolower($_POST['facultyEmail']);
    $facultyPhone = $_POST['phoneNumber'];

      if (isset($_POST['facultyPass'])){
          $facultyPass = $_POST['facultyPass'];
      }
        else{
            $facultyPass =  random_password();
        }



	if(isset($_POST['isAdmin'])){
		$facultyIsAdmin = $_POST['isAdmin'];
	}
	else{
		$facultyIsAdmin = '0';
	}
	if(isset($_POST['isCord']))
	{
		$facultyIsCord = $_POST['isCord'];
	}
	else
	{
		$facultyIsCord = '0';
	}
	
	$facultyQuota = $_POST['Quota'];

	$sql = "INSERT INTO faculty (designation, facultyName, facultyPhoneNo, facultyEmail, facultyPassword, isAdmin, isCoordinator) 
    VALUES ('$facultyDesign','$facultyName','$facultyPhone','$facultyEmail','$facultyPass','$facultyIsAdmin','$facultyIsCord')";

    $sqlCheck = "SELECT facultyName, facultyEmail FROM faculty WHERE facultyName = '$facultyName' OR facultyEmail = '$facultyEmail'";
	
	
    $results=$conn->query($sqlCheck);

    if (!$results->num_rows > 0) {
		
            if (!$conn->query($sql) === TRUE) {
              $error="Registration Unsuccessfull";
              header("Location: registerfaculty.php?status=f");
            }
            else{
              $error="";
			  //get the id of new faculty member created
			    
				$sqlIdGet="SELECT facultyId FROM faculty WHERE facultyName = '$facultyName' AND facultyEmail = '$facultyEmail'";
				$FacultyId='0';
				
				$idGet=$conn->query($sqlIdGet);
				if ($idGet->num_rows > 0) {
					
						while($rowId = $idGet->fetch_assoc())
						{
							$FacultyId=$rowId["facultyId"];
						}
				}
				//setting up the work load of added Faculty Member
				$sqlFacultyLoad="INSERT INTO work_load ( facultyid, designation, totalLoad ) VALUES ('$FacultyId','$facultyDesign','$facultyQuota')";
				if ($conn->query($sqlFacultyLoad) === TRUE) {
					//User Registered Successfully

                    //Check for checkbox
                    if ($_POST['emailSend'] != 'false'){
                        mail_user_registration($facultyEmail,$facultyName,$facultyPass);
                    }

					
					header('Location: registerFaculty.php?status=t');
				}
				else{
					$error="Registration Unsuccessfull";
				}
            }
    }
    else{
        $error="Already Registered";
        header('Location: '.'registerfaculty.php?status=f');
    }
//    unset($facultyName);
//    unset($facultyCMS);
//    unset($facultyEmail);
//    unset($facultyPhone);
//    unset($facultyBatch);
//    unset($facultyPass);
//    unset($_POST['facultyName']);
//    unset($_POST['facultyCMS']);
//    unset($_POST['facultyEmail']);
//    unset($_POST['phoneNumber']);
//    unset($_POST['Batch']);
//    unset($_POST['facultyPass']);
//    unset($_POST);
//    $_POST = array();
//    $conn->close();
//    header('Location: '.'registerfaculty.php');
//    die;
    }
}
?>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  
    <?php require_once("includes/main-header.php"); ?>
    <?php require_once("includes/main-sidebar.php"); ?>
    <div class="content-wrapper" >
    <?php require_once("includes/content-header.php"); ?>
        
    <section class="content" style="min-height: 700px">
    <div class="row">
	
    <div class="col-md-2"></div>        
    <div class="col-md-8">   

<!--Code for register faculty starts here-->
  <div class="register-box-body">
      <?php
      if (isset($_GET['status'])){
          if ($_GET['status']=='f'){ ?>
              <div style="text-align:center;" class="alert alert-danger" role="alert">
                  <span class="glyphicon glyphicon-exclamation-sign"></span>
                  Something Went Wrong
                  <button type="button" class="close" data-dismiss="alert">x</button>
              </div>

          <?php  }
          else if ($_GET['status']=='t'){ ?>
              <div style="text-align:center;" class="alert alert-success" role="alert">
                  <span class="glyphicon glyphicon-exclamation-sign"></span>
                  Faculty Registered
                  <button type="button" class="close" data-dismiss="alert">x</button>
              </div>
          <?php }

      }
      ?>

      <div class="box-header">
          <a href="home.php" ><i class="fa fa-arrow-left"></i></a>
          <h4 class="text-center ">Register a Faculty</h4>

      </div>

    <form id="AddFaculty" action="registerFaculty.php" method="post">
      <div class="form-group has-feedback">
        <input type="text" name="facultyDesign" class="form-control" placeholder="Designation" required/>
        <span class="glyphicon glyphicon-bookmark form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="text" name="facultyName" class="form-control" placeholder="Full name" required/>
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="email" name="facultyEmail" class="form-control" placeholder="Email" required/>
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="text" name="phoneNumber" class="form-control bfh-phone" placeholder="Phone Number" required/>
        <span class="glyphicon glyphicon-phone form-control-feedback"></span>
      </div>
	  <div class="form-group has-feedback">
		<input type="number" name="Quota" class="form-control bfh-phone" placeholder="Supervising Quota" required/>
        <span class="glyphicon glyphicon-shopping-cart form-control-feedback"></span>
	  </div>
      <div class="form-group has-feedback">
        <input type="text" name="facultyPass" class="form-control" placeholder="Password" />
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
        <p class="help-block">Leave password field empty for random password</p>


      <div class="form-group has-feedback">
          <p class="help-block">Set Role (if any)</p>
         <input type="checkbox" name="isAdmin" value="1"> System Administrator &nbsp;
          <input type="checkbox" name="isCord" value="1"> Coordinator<br>
      </div>









        <div class="box-footer ">
            <div class="checkbox pull-left">
                <label>
                    <input type="checkbox" name="emailSend" value="false" checked> Do not send email to user
                </label>
            </div>

            <div class="form-group pull-right">
                <a href="<?php echo siteroot ?>"  class="btn btn-danger">Back </a>
                <button type="submit" name="AddFaculty" class="btn btn-primary">Register</button>
            </div>
        </div>


    </form>

  </div>
<!--Code for register faculty ends here-->

    </div>
    <div class="col-md-2"></div>

    </div>
    </section>
    </div>
    
    <?php

    require_once("includes/main-footer.php");
    require_once("includes/required_js.php");
    ?>
    <script>
        function goBack() {
            window.history.back();
        }
    </script>
 
</body>
</html>