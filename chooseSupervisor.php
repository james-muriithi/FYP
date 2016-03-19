<?php 
    
$GLOBALS['title']="FYPMS";
$GLOBALS['subtitle']="Choose Supervisor";
   
require_once("includes/header.php");
require_once("includes/config.php");
$error="";

session_start();
if($_SESSION["isLead"]!="1")
{
    header('Location: '.'index.php');
}

//If form is submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $faculty_id = $_POST['ChooseSupervisor'];
    $group_id = $_SESSION["GroupID"];
    
    $sql = "INSERT INTO faculty_student_request (facultyId, groupId ) VALUES ('$faculty_id','$group_id')";

    $sqlCheck = "SELECT * FROM faculty_student_request WHERE facultyId = '$faculty_id' AND groupId = '$group_id'";

    $results=$conn->query($sqlCheck);
    
    if (!$results->num_rows > 0) {
            if (!$conn->query($sql) === TRUE) {
              $error="Registration Unsuccessfull";
              header("Location: chooseSupervisor.php?status=f");
            }
            else{
              $error="";
              header('Location: chooseSupervisor.php?status=t');
            }
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
			Request Sent to supervisor
			<button type="button" class="close" data-dismiss="alert">x</button>
			</div> 
     <?php   } 
         
     }

      
     ?>
          <div class="box">
            <div class="box-header">
			
              <h3 class="box-title">Request Supervisor</h3>


            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tr>
                  <th>ID</th>
                  <th>Name</th>
                  <th>Designation</th>
                  <th>Total Load</th>
                  <th>Current Load</th>
                  <th>Status</th>
                  <th>Action</th>
                </tr>
                
                    <?php
                            if ($conn->connect_error) {
                                die("Connection failed: " . $conn->connect_error);
                            }
                            else{

                                    $batch=$_SESSION["BatchID"];
                            $sql = "SELECT * FROM faculty INNER JOIN work_load ON work_load.totalLoad > work_load.currentLoad AND work_load.facultyId = faculty.facultyId";
                            $result = $conn->query($sql);
                            //$result2 = $conn->query($sql2);
                            $check=0;
                            if ($result->num_rows > 0) {
                            // output data of each row
                                while($row = $result->fetch_assoc()) {
                                    ?>
                <tr>
                  <td><?php echo $row["facultyId"]; ?></td>
                  <td><?php echo $row["facultyName"]; ?></td>
                  <td><?php echo $row["designation"]; ?></td>
                  <td><?php echo $row["totalLoad"]; ?></td>
                  <td><?php echo $row["currentLoad"]; ?></td>
                  <td><span class="label label-success">Available</span></td>
                <td>
                <div class="tools">
                    <form id="ChooseSupervisor" action="chooseSupervisor.php" method="post">
                        <button id="Formlink" class="btn btn-block btn-primary btn-xs" href="javascript:;" value="<?php echo $row["facultyId"];?>"> Select Supervisor</button>
                        <input type= "hidden" name="ChooseSupervisor" value="<?php echo $row["facultyId"];?>"/>
                    </form>
                  </div>
                </td>
                </tr>
                                <?php }
                            }
                            }?>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

    </div>
    <div class="col-md-2"></div>

    </div>
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
    <?php

    require_once("includes/main-footer.php");
    require_once("includes/required_js.php");
    require_once("includes/swal_js.php");
    ?> 
    
 
</body>
</html>