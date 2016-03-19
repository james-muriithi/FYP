<?php 
//****************************************************************************************************************************************************
//
//													Setting up global Variables gor header, title and breadcrmb purpose
//
//**************************************************************************************************************************************************** -->
     
$GLOBALS['title']="FYPMS";
$GLOBALS['subtitle']="Create Batch";
require_once("includes/header.php");
require_once("includes/config.php");
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
				$config=$_POST['configs'];
                $BatchName=$Batch ." ". $BatchYear;
                $sql = "INSERT INTO batch (batchName, configurationType) VALUES ('$BatchName', '$config')";

                $sqlChek = "SELECT * FROM batch WHERE batchName = '$BatchName'";


        $results=$conn->query($sqlChek);

        if (!$results->num_rows > 0) {
                if (!$conn->query($sql) === TRUE) {
                    header('Location:' . $_SERVER['PHP_SELF'] . '?status=t');
                        echo "<div id=\"alerts\" style=\"text-align:center; margin-bottom:0px;\" class=\"alert alert-danger\" role=\"alert\">Something Went Wrong <br/> Error: " . $sql . "<br/>" . $conn->error . "</div>";
                }
                else{
                    header('Location:' . $_SERVER['PHP_SELF'] . '?status=t');
                        echo "<div style=\"text-align:center; margin-bottom:0px;\" class=\"alert alert-success\" role=\"alert\">Student Successfully Registered</div>";
                        $error ="<div id=\"alerts\" style=\"text-align:center; margin-bottom:0px;\" class=\"alert alert-success\" role=\"alert\">Student Successfully Registered</div>";
                }
        }
        else{
            header('Location:' . $_SERVER['PHP_SELF'] . '?status=f');
                echo "<div id=\"alerts\" style=\"text-align:center; margin-bottom:0px;\" class=\"alert alert-success\" role=\"alert\">Student Already Registered</div>";
                $error="Already Registered";
        }

        $_POST = array();
        $conn->close();
        //header('Location: '.'home.php');
        //die;
        }
}

?>


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

<!-- Code for createBatch starts here-->
<div class="register-box-body">
    <?php
    if (isset($_GET['status'])) {
        if ($_GET['status'] == 'f') { ?>

            <div style="text-align:center;" class="alert alert-danger" role="alert">
                <span class="glyphicon glyphicon-exclamation-sign"></span>
                Something Went Wrong
                <button type="button" class="close" data-dismiss="alert">x</button>
            </div>

        <?php } else if ($_GET['status'] == 't') { ?>
            <div style="text-align:center;" class="alert alert-success" role="alert">
                <span class="glyphicon glyphicon-exclamation-sign"></span>
                Batch Created
                <button type="button" class="close" data-dismiss="alert">x</button>
            </div>
        <?php }

    }

    ?>
    <div class="box-header">
        <a href="home.php" ><i class="fa fa-arrow-left"></i></a>
        <h4 class="text-center ">Create Batch</h4>
    </div>

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
			<input type="radio" name="configs" value="default" required="required"/> Load Default Configurations


            <!-- Button trigger modal -->
            <button type="button" class="btn btn-flat btn-xs" data-toggle="modal" data-target="#defaultConfigs">
                Show Default Configurations
            </button>
            <!-- Modal -->
            <div class="modal fade" id="defaultConfigs" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Default Configurations</h4>
                        </div>
                        <div class="modal-body">
                        <?php require_once ('defaultConfigsModal.php') ;?>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                        </div>
                    </div>
                </div>
            </div>




		</div>


        <div class="form-group has-feedback">
            <input type="radio" name="configs" value="custom" required="required"/> Custom Configurations
            <a href="createCustomConfigs.php" class="btn btn-default btn-xs">Create Custom Configurations</a>
        </div>

        <div class="box-footer ">
            <div class="form-group pull-right">
                <button type="submit" name="CreateBatch" class="btn btn-primary">Create</button>
            </div>
        </div>

	</form>

	
</div>
<!-- Code for createBatch ends here-->
    </div>
       <div class="col-md-2"></div>   
    </div>
    </section>
    </div>
    </div>
    <?php
//****************************************************************************************************************************************************
//
//																	Page Footer
//
//**************************************************************************************************************************************************** -->
     
    require_once("includes/main-footer.php");
    ?> 
    <?php
    require_once("includes/required_js.php");
    ?>
	
</body>