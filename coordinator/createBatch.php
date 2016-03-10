<?php 
$GLOBALS['title']="FYPMS";
$GLOBALS['subtitle']="Join Group";
require_once("../includes/header.php");
require_once("../includes/connection.php");
session_start();
if(!isset($_SESSION["isCord"]))
{
        header('Location: '.'index.php');
}
if((isset($_POST['Batch'])) && (isset($_POST['batchYear']))) {
        if(($_POST['Batch']!="") && ($_POST['batchYear']!=""))
        {
                if ($conn->connect_error) {
                        trigger_error('Database connection failed:'. $conn->connect_error, E_USER_ERROR);	
                        die("Connection failed: " . $conn->connect_error);
                } 
        //echo $_POST['studentName']." ".$_POST['studentCMS']." ".$_POST['studentEmail']." ".$_POST['phoneNumber']." ".$_POST['batch']." ".$_POST['studentPass'];
                $Batch = $_POST['Batch'];
                $BatchYear = $_POST['batchYear'];
                $BatchName=$Batch ." ". $BatchYear;
                $sql = "INSERT INTO batch (batchName) VALUES ('$BatchName')";

                $sqlChek = "SELECT * FROM batch WHERE batchName = '$BatchName'";


        $results=$conn->query($sqlChek);

        if (!$results->num_rows > 0) {
                if (!$conn->query($sql) === TRUE) {
                        echo "<div id=\"alerts\" style=\"text-align:center; margin-bottom:0px;\" class=\"alert alert-danger\" role=\"alert\">Something Went Wrong <br/> Error: " . $sql . "<br/>" . $conn->error . "</div>";
                }
                else{
                        echo "<div style=\"text-align:center; margin-bottom:0px;\" class=\"alert alert-success\" role=\"alert\">Student Successfully Registered</div>";
                        $error ="<div id=\"alerts\" style=\"text-align:center; margin-bottom:0px;\" class=\"alert alert-success\" role=\"alert\">Student Successfully Registered</div>";
                }
        }
        else{
                echo "<div id=\"alerts\" style=\"text-align:center; margin-bottom:0px;\" class=\"alert alert-success\" role=\"alert\">Student Already Registered</div>";
                $error="Already Registered";
        }

        $_POST = array();
        $conn->close();
        header('Location: '.'home.php');
        die;
        }
}
?>
<body class="hold-transition skin-blue sidebar-mini">	
<div class="wrapper">
  
    <?php require_once("../includes/main-header.php"); ?>
    <?php require_once("../includes/main-sidebar.php"); ?>
    <div class="content-wrapper" >
    <?php require_once("../includes/content-header.php"); ?>
        
    <section class="content" style="min-height: 700px">
    <div class="row">
    <div class="col-md-2"></div>    
    <div class="col-md-8"> 

<!-- Code for createBatch starts here-->
<div class="register-box-body">
	<p class="register-box-msg"><b>Create Batch</b></p>

    <form id="CreateBatch" action="createBatch.php" method="post">
		<div class="form-group has-feedback">
		<b>Batch</b>
		<select name="Batch" class="form-control">
				<option value="Fall">Fall</option>
				<option value="Spring">Spring</option>
				<span class="glyphicon glyphicon-education form-control-feedback"></span>
		</select>
		</div>
		<div class="form-group has-feedback">
			<b>Year</b> 
			<input type="text" name="batchYear" class="form-control bfh-year" placeholder="<?php echo date("Y"); ?>" required />
		</div>
		
		<div class="form-group has-feedback">
		<b>Starting Date Of semester</b>  
			<input type="date" name="Starting" class="form-control bfh-Date" required/>
		</div>
		
		<b>Configure Batch</b>
		
		<div class="form-group has-feedback">
			<input type="radio" name="configs" value="defaults"/> Load Default Conigurations <button id="btn_to_check" type="button" onclick="alert('Hello world!')">Change Default Configurations</button>
		</div>
		
		<div class="form-group has-feedback">
			<input type="radio" name="configs" value="customs"/> Custom Configurations
			
			
		</div>
		<div class="row">
			<div class="col-lg-12">
			  <button type="submit" name="CreateBatch" class="btn btn-primary btn-block btn-flat">Create</button>
			</div>
			<!-- /.col -->
        </div>
	</form>
	
	
</div>
<!-- Code for createBatch ends here-->
    </div>
       <div class="col-md-2"></div>   
    </div>
    </section>
    </div>
    
    <?php
    require_once("../includes/main-footer.php");
    ?> 
    <?php
    require_once("../includes/required_js.php");
    ?>
</body>