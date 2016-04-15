<?php 
//****************************************************************************************************************************************************
//
//											Setting up global variables for header, breadcrumvbs and title purpose
//
//**************************************************************************************************************************************************** -->
     
$title="FYPMS";
$subtitle="Register External Examiners";
require_once("includes/header.php");
require_once("includes/config.php");
$error="";
session_start();
if(!isset($_SESSION["isAdmin"]))
{
    header('Location: '.'index.php');
}
if((isset($_POST['externalName'])) && (isset($_POST['externalEmail']))) {
    if(($_POST['externalName']!="") && ($_POST['externalEmail']!=""))
    {

    //echo $_POST['facultyName']." ".$_POST['facultyCMS']." ".$_POST['facultyEmail']." ".$_POST['phoneNumber']." ".$_POST['batch']." ".$_POST['facultyPass'];
    $ExternalCompany = $_POST['externalCompany'];
	$ExternalName = $_POST['externalName'];
    $ExternalDesign = $_POST['externalDesign'];
    $ExternalEmail = strtolower($_POST['externalEmail']);
    $ExternalPhone = $_POST['externalNumber'];
    $ExternalPass = $_POST['externalPass'];
	
	

	$sql = "INSERT INTO external_examiner (examinerName, examinerPhone, examinerEmail, examinerPassword, company) 
    VALUES ('$ExternalName','$phoneNumber','$ExternalEmail','$ExternalPass','$ExternalCompany')";

    $sqlCheck = "SELECT * FROM external_examiner WHERE examinerName = '$ExaminerName' OR exminerEmail = '$ExaminerEmail'";
	
	
    $results=$conn->query($sqlCheck);

    if (!$results->num_rows > 0) {
		
            if (!$conn->query($sql) === TRUE) {
              $error="Registration Unsuccessfull";
              header("Location: registerExternal.php?status=f");
            }
            else{
              $error="";
			  //get the id of new faculty member created
			    
				$sqlIdGet="SELECT examinerId FROM external_examiner WHERE examinerName = '$ExaminerName' AND examinerEmail = '$ExaminerEmail'";
				$FacultyId='0';
				
				$idGet=$conn->query($sqlIdGet);
				if ($idGet->num_rows > 0) {
					
						while($rowId = $idGet->fetch_assoc())
						{
							$ExaminerId=$rowId["examinerId"];
						}
				}
				
					$error="Successfully Regstered";
					
					header('Location: registerExternal.php?status=t');
				}
				
					
				
            }
    }
    else{
        $error="Already Registered";
        header('Location: '.'registerExternal.php?status=f');
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
//    header('Location: '.'registerExternal.php');
//    die;
    
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
                  External Examiner Registered
                  <button type="button" class="close" data-dismiss="alert">x</button>
              </div>
          <?php }

      }
      ?>

      <div class="box-header">
          <a href="home.php" ><i class="fa fa-arrow-left"></i></a>
          <h4 class="text-center ">Register an External Examiner</h4>

      </div>

    <form id="AddFaculty" action="registerExternal.php" method="post">
      <div class="form-group has-feedback">
        <input type="text" name="externalCompany" class="form-control" placeholder="Company" required/>
        <span class="glyphicon glyphicon-bookmark form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="text" name="externalName" class="form-control" placeholder="Full name" required/>
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="email" name="externalEmail" class="form-control" placeholder="Email" required/>
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="text" name="phoneNumber" class="form-control bfh-phone" placeholder="Phone Number" required/>
        <span class="glyphicon glyphicon-phone form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" name="externalPass" class="form-control" placeholder="Password" required/>
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      
	 

        <div class="box-footer ">
            <div class="form-group pull-right">
                <a href="<?php echo $_SERVER['PHP_SELF']; ?>"  class="btn btn-danger">Back </a>
                <button type="submit" name="AddExternal" class="btn btn-primary">Register</button>
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
	//****************************************************************************************************************************************************
//
//																Footer includes
//
//**************************************************************************************************************************************************** -->
     
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