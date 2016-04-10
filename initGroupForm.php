<?php
//TODO Delete this page later
//****************************************************************************************************************************************************
//
//													Setting up global Variables
//
//****************************************************************************************************************************************************
$GLOBALS['title']="FYPMS";
$GLOBALS['subtitle']="Initiate Group";
require_once("includes/config.php");
require_once("includes/header.php");

session_start();
if(!isset($_SESSION["usrCMS"]))
{
        header('Location: '.'index.php');
}

if((isset($_POST['projectPart'])))
{
        if(($_POST['projectPart']!=""))
        {
                if ($conn->connect_error) {
                        trigger_error('Database connection failed:'. $conn->connect_error, E_USER_ERROR);	
                        die("Connection failed: " . $conn->connect_error);
                }
                $CurrentBatch=$_POST['Currentbatch'];
                $ProjectPart=$_POST['projectPart'];
                $stuId=$_SESSION["usrId"];
                $sql = "INSERT INTO student_group (projectPart, leaderId) VALUES ('$ProjectPart','$stuId')";


                        if (!$conn->query($sql) === TRUE) {
                            $error=$conn->error;
                            ?>
                            <div id="alerts" style="text-align:center; margin-bottom:0px;" class="alert alert-danger" role="alert">
                                    Something Went Wrong
                                    <br/>
                                    Error: <?php echo $sql?>
                                    <br/>
                                    <?php echo $conn->error?>
                                    </div>	
                            <?php	
	
                        }
                        else{
                            $error="Successfully Initiated";
                            ?>
                            <div id="alerts" style="text-align:center; margin-bottom:0px;" class="alert alert-success" role="alert">
                                    Successfully Initiated
                                    </div>	
                            <?php	
                        }
                $chkLeader = "SELECT groupId FROM student_group WHERE leaderId='$stuId'";
                $grpId=$conn->query($chkLeader);
                $row = $grpId->fetch_assoc();
                $stuGroup=$row["groupId"];
                $updStudent = "UPDATE student SET groupId = '$stuGroup', isLeader = '1'  WHERE studentId = '$stuId'";

                $results=$conn->query($updStudent);
                $_SESSION["isLead"]="1";
                $_POST['Currentbatch']=null;
                $_POST['projectPart']=null;
                unset($_POST['Currentbatch']);
                unset($_POST['projectPart']);
                unset($CurrentBatch);
                unset($projectPart);
                $_POST = array();
                $conn->close();
                
                header('Location: '.'index.php');
                die;
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
        <div class="col-md-3"></div>
    <div class="col-md-6">
     <div class="register-box-body">
	 
        <p class="login-box-msg">Initiate Group</p>
            <form id="initGroup" action="initGroupForm.php" method="post">
					<div class="alert alert-danger">
                    <p>You Must be the Group Leader to Initiate a Group, You Can't Join Another Group When You are a Group Leader</p>
					</div>
                    <div class="form-group has-feedback">
                    <p>Project Part</p>
                      <select name="projectPart" class="form-control">

                            <option value="1">Senior Design Project Part - 1</option>
                            
                      </select>
                    </div>
                    <div class="row">
                            <div class="col-lg-12">
                              <button type="submit" name="initGroup" class="btn btn-primary btn-block btn-flat">Create Group</button>
                            </div>
					</div>
            </form>
    </div>	
        
    </div>
        <div class="col-md-3"></div>
    </div>
	<form id="Cancel" action="home.php" method="post">
	<br/>

	</form>
    </section>
    </div>
    
    <?php
	//****************************************************************************************************************************************************
//
//													Page Footer
//
//****************************************************************************************************************************************************
    require_once("includes/main-footer.php");
    ?>
    <?php
    require_once("includes/required_js.php");
    ?>

</body>
</html>