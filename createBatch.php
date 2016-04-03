<?php 
$GLOBALS['title']="FYPMS";
$GLOBALS['subtitle']="Create batch";
require_once("includes/header.php");
require_once("includes/config.php");
session_start();
if(!isset($_SESSION["isCord"]))
{
        header('Location: '.'index.php');
}
if((isset($_POST['batch'])) && (isset($_POST['batchYear']))) {
        if(($_POST['batch']!="") && ($_POST['batchYear']!=""))
        {
                if ($conn->connect_error) {
                        trigger_error('Database connection failed:'. $conn->connect_error, E_USER_ERROR);	
                        die("Connection failed: " . $conn->connect_error);
                } 
        //echo $_POST['studentName']." ".$_POST['studentCMS']." ".$_POST['studentEmail']." ".$_POST['phoneNumber']." ".$_POST['batch']." ".$_POST['studentPass'];
                $batch = $_POST['batch'];
                $batchYear = $_POST['batchYear'];
                $config=$_POST['configs'];
                $startingDate = $_POST['startingDate'];
                echo $startingDate;exit;
                $batchName=$batch ." ". $batchYear;
                $sql = "INSERT INTO batch (batchName, startingDate, configurationType, isActive) VALUES ('$batchName', ,'$startingDate' ,'$config', '1')";
                $sqlChek = "SELECT * FROM batch WHERE batchName = '$batchName'";


        $results=$conn->query($sqlChek);

        if (!$results->num_rows > 0) {
                if (!$conn->query($sql) === TRUE) {
                    header('Location:' . $_SERVER['PHP_SELF'] . '?status=f');
                }
                else{
                    header('Location:' . $_SERVER['PHP_SELF'] . '?status=t');
                }
        }
        else{
            header('Location:' . $_SERVER['PHP_SELF'] . '?status=ae');
        }

        $_POST = array();
        $conn->close();
        //header('Location: '.'home.php');
        //die;
        }
}

?>
<!--Date Picker-->
<link rel="stylesheet" href="plugins/datepicker/datepicker3.css"/>
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

<!-- Code for createbatch starts here-->
<div class="register-box-body">
<?php if (isset ($_GET['status'])){
if ($_GET['status'] == 't'){ ?>
<div style="text-align:center;" class="alert alert-success" role="alert">
    <span class="glyphicon glyphicon-exclamation-sign"></span>
    Batch created successfully!
    <button type="button" class="close" data-dismiss="alert">x</button>
</div>
<?php   }
else if ($_GET['status'] = 'f'){ ?>
<div style="text-align:center;" class="alert alert-danger" role="alert">
    <span class="glyphicon glyphicon-exclamation-sign"></span>
    Error! Something Went Wrong
    <button type="button" class="close" data-dismiss="alert">x</button>
</div>
<?php }

else if ($_GET['status'] = 'ae'){ ?>
<div style="text-align:center;" class="alert alert-danger" role="alert">
    <span class="glyphicon glyphicon-exclamation-sign"></span>
    Error! batch Already Exist
    <button type="button" class="close" data-dismiss="alert">x</button>
</div>
<?php    }
}?>


    <div class="box-header">
        <a href="home.php" ><i class="fa fa-arrow-left"></i></a>
        <h4 class="text-center ">Create batch</h4>
    </div>

    <form id="Createbatch" action="createbatch.php" method="post">
		<div class="form-group has-feedback">
		<b>batch</b>
		<select name="batch" class="form-control">
				<option value="Fall">Fall</option>
				<option value="Spring">Spring</option>
				<span class="glyphicon glyphicon-education form-control-feedback"></span>
		</select>
		</div>
        
        	<div class="form-group has-feedback">
		<b>Year</b>
                <select name="batchYear" class="form-control" required>
                    <option value="<?php echo date('Y');?>" selected><?php echo date('Y');?></option>
		</select>
		</div>
        
        
		<div class="form-group has-feedback">
		<b>Starting Date Of semester</b> 
                <div class="input-group date" data-provide="datepicker">
                <input type="text" name="startingDate"  id="startingDate"  class="form-control">
                <div class="input-group-addon">
                    <span class="glyphicon glyphicon-th"></span>
                </div>
                </div>

                
		<b>Configure batch</b>
		
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
                <button type="submit" name="Createbatch" class="btn btn-primary">Create</button>
            </div>
        </div>

	</form>

	
</div>
<!-- Code for createbatch ends here-->
    </div>
       <div class="col-md-2"></div>   
    </div>
    </section>
    </div>

<?php
require_once("includes/main-footer.php");
?>
</div>
<!-- ./wrapper -->
<?php
require_once("includes/required_js.php");
?>
<!--Datepicker-->
<script src="plugins/datepicker/bootstrap-datepicker.js"></script>
<script>
        $('.datepicker').datepicker();
</script>
</body>
</html>