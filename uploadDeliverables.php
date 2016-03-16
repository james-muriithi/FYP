<?php 
//****************************************************************************************************************************************************
//
//													Setting up global variables for header and page title use
//
//**************************************************************************************************************************************************** -->
     
$GLOBALS['title']="FYPMS";
$GLOBALS['subtitle']="Upload Deliverables";
require_once("includes/header.php");
require_once("includes/connection.php");
$error="";

//****************************************************************************************************************************************************
//
//													Starting session and checking session variables
//
//**************************************************************************************************************************************************** -->
     
session_start();
if(!isset($_SESSION["usrCMS"]))
{
        header('Location: '.'index.php');
}

if(isset(S_POST[""]))
?>
<?php
require_once 'includes/swal_css.php';
?>
</head>

<body class="hold-transition skin-blue sidebar-mini">	
<div class="wrapper">
<!--//****************************************************************************************************************************************************
//
//													Including main bar and sidebar for the page
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
	
	
	
	
	 <section class="content" style="min-height: 700px">
                <div class="row">

                    <!--	<div class="col-md-1"></div>        -->
                    <div class="col-md-12"> 

                        <div class="box">

                            <p class="register-box-msg"><b>Part 1</b></p>
                            <?php
                             if (isset($success_msg)){
                                 echo "<p class='text-green'>$success_msg</p>";
                             }else if (isset($error_msg)){
                                 echo "<p class='text-green'>$error_msg</p>";
                             }
                            ?>    
                            <!-- /.box-header -->
                            <div class="box-body table-responsive no-padding">
                                <table class="table table-hover">
                                    <tr>
                                        <th>Week</th>
                                        <th>Task</th>
                                        <th>Deadline</th>
                                        <th>Action</th>
                                        
                                    </tr>
<?php
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} else {

    $sql = "SELECT * FROM configurations WHERE configurationType='default' AND projectPart='1' ORDER BY week";
    $result = $conn->query($sql);
    //$result2 = $conn->query($sql2);
    $check = 0;
    if ($result->num_rows > 0) {
        // output data of each row
        while ($row = $result->fetch_assoc()) {
            ?>
                                                <tr>
                                                    <td><?php echo $row["week"]; ?></td>
                                                    <td><?php echo $row["taskName"]; ?></td>
                                                    <td><?php echo $row["deadline"]; ?></td>
													
													<form id="UpdateConfig1" action="viewDefaultConfig.php" method="post">
														
														<td>
															<input type= "hidden" name="configId" value="<?php echo $row["configurationId"]; ?>"/>
															<input name="UpdateConfig1" class="btn btn-sm"type="submit" value="Open"/>
														</td>
													
													</form>
                                               
                                                </td>
                                               

                                                </tr>
                                                
                                                <?php
                                            }
                                        }
                                    }
                                    ?>
                                    
                                </table>
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->

                        <div class="box">

                            <p class="register-box-msg"><b>Part 2</b></p>

                            <!-- /.box-header -->
                            <div class="box-body table-responsive no-padding">
                                <table class="table table-hover">
                                    <tr>
                                        <th>Week</th>
                                        <th>Task</th>
                                        <th>Deadline</th>
                                        <th>Action</th>
                                    </tr>
                                    <?php
                                    if ($conn->connect_error) {
                                        die("Connection failed: " . $conn->connect_error);
                                    } else {

                                        $sql = "SELECT * FROM configurations WHERE configurationType='default' AND projectPart='2' ORDER BY week";
                                        $result = $conn->query($sql);
                                        //$result2 = $conn->query($sql2);
                                        $check = 0;
                                        if ($result->num_rows > 0) {
                                            // output data of each row
                                            while ($row = $result->fetch_assoc()) {
                                                ?>
                                                <tr>
                                                    <td><?php echo $row["week"]; ?></td>
                                                    <td><?php echo $row["taskName"]; ?></td>
                                                    <td><?php echo $row["deadline"]; ?></td>
                                               
													<form id="UpdateConfig1" action="viewDefaultConfig.php" method="post">
														
														<td>
															<input type= "hidden" name="configId" value="<?php echo $row["configurationId"]; ?>"/>
															<input name="UpdateConfig1" class="btn btn-sm"type="submit" value="Open"/>
														</td>
													
													</form>
                                                </tr>
                                                <?php
                                            }
                                        }
                                    }
                                    ?>
                                    
                                </table>
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
                    </div>
                </div>
				<form id="Save" action="CreateBatch.php" method="post">
				<br/>
					<div class="row">
						<div class="col-lg-12">
						  <button type="submit" name="save" class="btn btn-primary btn-block btn-flat">Save</button>
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
            </section>
        </div>
    </div>
	
	</div>
	
	
	
	</div>
	
	
	
	
	
	    <?php

    require_once("includes/main-footer.php");
    require_once("includes/required_js.php");
    require_once("includes/swal_js.php");
    ?> 
    
 
</body>
</html>