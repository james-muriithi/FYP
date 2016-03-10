<?php 
//****************************************************************************************************************************************************
//
//													Setting up global Variables gor header, title and breadcrmb purpose
//
//**************************************************************************************************************************************************** -->
     
$GLOBALS['title']="FYPMS";
$GLOBALS['subtitle']="Delete Batch";
require_once("includes/header.php");
require_once("includes/connection.php");

//****************************************************************************************************************************************************
//
//													Starting session and checking session variables
//
//**************************************************************************************************************************************************** -->
     

session_start();
if(!isset($_SESSION["isCord"]))
{
        header('Location: '.'index.php');
}
if((isset($_POST['Batch']))) {
        
                if ($conn->connect_error) {
                        trigger_error('Database connection failed:'. $conn->connect_error, E_USER_ERROR);	
                        die("Connection failed: " . $conn->connect_error);
                }else{ 
        //echo $_POST['studentName']." ".$_POST['studentCMS']." ".$_POST['studentEmail']." ".$_POST['phoneNumber']." ".$_POST['batch']." ".$_POST['studentPass'];
                $Batch = $_POST['Batch'];
               
                $sql = "DELETE FROM batch WHERE batchId = '$Batch'";

                

       

        
                if (!$conn->query($sql) === TRUE) {
                        echo "<div id=\"alerts\" style=\"text-align:center; margin-bottom:0px;\" class=\"alert alert-danger\" role=\"alert\">Something Went Wrong <br/> Error: " . $sql . "<br/>" . $conn->error . "</div>";
                }
                else{
                        echo "<div style=\"text-align:center; margin-bottom:0px;\" class=\"alert alert-success\" role=\"alert\">Student Successfully Registered</div>";
                        $error ="<div id=\"alerts\" style=\"text-align:center; margin-bottom:0px;\" class=\"alert alert-success\" role=\"alert\">Student Successfully Registered</div>";
                }
       

				$_POST = array();
				$conn->close();
				header('Location: '.'home.php');
				die;
				}
}
//****************************************************************************************************************************************************
//
//															Start of page body
//
//**************************************************************************************************************************************************** -->
     
?>


<body class="hold-transition skin-blue sidebar-mini">	
<div class="wrapper">
<!--//****************************************************************************************************************************************************
//
//													header includes sidebar and mainbar
//
//**************************************************************************************************************************************************** -->
     
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
	<p class="register-box-msg"><b>Delete Batch</b></p>
	<div class="register-box-body">
        <?php
     if (isset($_GET['status'])){
                 if ($_GET['status']=='f'){ ?>
       
			<div style="text-align:center;" class="alert alert-danger" role="alert">
			<span class="glyphicon glyphicon-exclamation-sign"></span>
			Something Went Wrong
			<button type="button" class="close" data-dismiss="alert">x</button>
			</div> 
                    
       <?php }
        else if ($_GET['status']=='t'){ ?>
           	<div style="text-align:center;" class="alert alert-success" role="alert">
			<span class="glyphicon glyphicon-exclamation-sign"></span>
			Batch Deleted
			<button type="button" class="close" data-dismiss="alert">x</button>
			</div> 
     <?php   } 
         
     }

      
     ?>
<!--//****************************************************************************************************************************************************
//
//													Form to delete batch year and time
//
//**************************************************************************************************************************************************** -->
		<form id="DeleteBatch" action="deleteBatch.php" method="post">
		<div class="form-group has-feedback">
	    <select name="Batch" class="form-control">
		<?php
//****************************************************************************************************************************************************
//
//													Displaying registered batches
//
//**************************************************************************************************************************************************** -->
     
                $sqlGet= "SELECT * FROM batch";
                $result = $conn->query($sqlGet);
                if($result->num_rows > 0) {
                    while($row = $result->fetch_assoc())
                    {
                            echo "<option value=\"".$row["batchId"]."\">".$row["batchName"]."</option>";
                    }
                }
                $conn->close();

		?>
		
		<span class="glyphicon glyphicon-education form-control-feedback"></span>
	  </select>
	  </div>
		<div class="row">
			<div class="col-lg-12">
			  <button type="submit" name="DeleteBatch" class="btn btn-primary btn-block btn-flat">Delete</button>
			</div>
			<!-- /.col -->
        </div>
	</form>
	
	<form id="Cancel" action="home.php" method="post">
	<br/>
		<div class="row">
			<div class="col-lg-12">
			  <button type="submit" name="Cancel" class="btn btn-primary btn-block btn-flat">Cancel</button>
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