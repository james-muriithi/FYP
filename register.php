<?php 
//****************************************************************************************************************************************************
//
//													includes connection
//
//**************************************************************************************************************************************************** -->
     
	require_once("includes/connection.php");
	$error="";
	
//****************************************************************************************************************************************************
//
//													Starting session and checking session variables
//
//**************************************************************************************************************************************************** -->
     
	session_start();
	if(!isset($_SESSION["isCord"]))
	{
		header('Location: '.'index.php');
		
//****************************************************************************************************************************************************
//
//													Registering Student updating database valus of new student (Registering Student)
//
//**************************************************************************************************************************************************** -->
     
	}
	if((isset($_POST['studentName'])) && (isset($_POST['studentCMS'])) && (isset($_POST['studentEmail']))) {
		if(($_POST['studentName']!="") && ($_POST['studentCMS']!="") && ($_POST['studentEmail']!=""))
		{
		if ($conn->connect_error) {
			trigger_error('Database connection failed:'. $conn->connect_error, E_USER_ERROR);	
			die("Connection failed: " . $conn->connect_error);
		} 
		//echo $_POST['studentName']." ".$_POST['studentCMS']." ".$_POST['studentEmail']." ".$_POST['phoneNumber']." ".$_POST['batch']." ".$_POST['studentPass'];
		$StudentName = $_POST['studentName'];
		$StudentCMS = $_POST['studentCMS'];
		$StudentEmail = $_POST['studentEmail'];
		$StudentPhone = $_POST['phoneNumber'];
		$StudentBatch = $_POST['Batch'];
		$StudentPass = $_POST['studentPass'];
		$sql = "INSERT INTO student (studentName, studentCMS, studentPhoneNo, studentEmail, studentPassword, groupId, batchId) 
		VALUES ('$StudentName','$StudentCMS','$StudentPhone','$StudentEmail','$StudentPass','0','$StudentBatch')";
//****************************************************************************************************************************************************
//
//													Checking if the student already exist in the database
//
//**************************************************************************************************************************************************** -->
     
		$sqlCheck = "SELECT studentCMS, studentEmail FROM student WHERE studentCMS = '$StudentCMS' OR studentEmail = '$StudentEmail'";
		
		$results=$conn->query($sqlCheck);
		
		if (!$results->num_rows > 0) {
			if (!$conn->query($sql) === TRUE) {
				$_POST['Status']="<div id=\"alerts\" style=\"text-align:center; margin-bottom:0px;\" class=\"alert alert-danger\" role=\"alert\">Something Went Wrong <br/> Error: " . $sql . "<br/>" . $conn->error . "</div>";
				echo "<div id=\"alerts\" style=\"text-align:center; margin-bottom:0px;\" class=\"alert alert-danger\" role=\"alert\">Something Went Wrong <br/> Error: " . $sql . "<br/>" . $conn->error . "</div>";
			}
			else{
				echo "<div style=\"text-align:center; margin-bottom:0px;\" class=\"alert alert-success\" role=\"alert\">Student Successfully Registered</div>";
				$_POST['Status']="<div id=\"alerts\" style=\"text-align:center; margin-bottom:0px;\" class=\"alert alert-success\" role=\"alert\">Student Successfully Registered</div>";
				$error ="<div id=\"alerts\" style=\"text-align:center; margin-bottom:0px;\" class=\"alert alert-success\" role=\"alert\">Student Successfully Registered</div>";
			}
		}
		else{
			echo "<div id=\"alerts\" style=\"text-align:center; margin-bottom:0px;\" class=\"alert alert-success\" role=\"alert\">Student Already Registered</div>";
			$error="Already Registered";
		}
		unset($StudentName);
		unset($StudentCMS);
		unset($StudentEmail);
		unset($StudentPhone);
		unset($StudentBatch);
		unset($StudentPass);
		unset($_POST['studentName']);
		unset($_POST['studentCMS']);
		unset($_POST['studentEmail']);
		unset($_POST['phoneNumber']);
		unset($_POST['Batch']);
		unset($_POST['studentPass']);
		unset($_POST);
		$_POST = array();
		$conn->close();
		//header('Location: '.'home.php');
		die;
		}
	}
?>

<!--//****************************************************************************************************************************************************
//
//													Form to register a student
//
//**************************************************************************************************************************************************** -->
     
  <div class="register-box-body">
    <p class="login-box-msg">Register a Student</p>

    <form id="AddStudent" action="register.php" method="post">
      <div class="form-group has-feedback">
        <input type="text" name="studentCMS" class="form-control" placeholder="CMS" required/>
        <span class="glyphicon glyphicon-asterisk form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="text" name="studentName" class="form-control" placeholder="Full name" required/>
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="email" name="studentEmail" class="form-control" placeholder="Email" required/>
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="number" name="phoneNumber" class="form-control bfh-phone" placeholder="Phone Number" min="03000000000" max="03999999999" required/>
        <span class="glyphicon glyphicon-phone form-control-feedback"></span>
      </div>
	  <div class="form-group has-feedback">
	  <select name="Batch" class="form-control">
		<?php
//****************************************************************************************************************************************************
//
//														Displaying available registerd batches
//
//**************************************************************************************************************************************************** -->
     
			if ($conn->connect_error) {
				die("Connection failed: " . $conn->connect_error);
			}
			else{
				$sqlGet= "SELECT * FROM batch";
				$result = $conn->query($sqlGet);
				if($result->num_rows > 0) {
						
					while($row = $result->fetch_assoc())
					{
						echo "<option value=\"".$row["batchId"]."\">".$row["batchName"]."</option>";
					}
				}
				$conn->close();
			}
		?>
		
		<span class="glyphicon glyphicon-education form-control-feedback"></span>
	  </select>
	  </div>
      <div class="form-group has-feedback">
        <input type="password" name="studentPass" class="form-control" placeholder="Password" required/>
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
	  
	  <div class="error"><?php echo $error;?></div>
    
      <div class="row">
        <div class="col-lg-12">
          <button type="submit" name="AddStudent" class="btn btn-primary btn-block btn-flat">Register</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

  </div>



