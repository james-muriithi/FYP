<?php 
$title="FYPMS";
$subtitle="Choose Supervisor";
require_once("includes/header.php");
require_once("includes/config.php");
session_start();
//Query to use SELECT * FROM faculty JOIN work_load ON faculty.facultyId = work_load.facultyId WHERE totalLoad > 0 AND totalLoad > currentLoad
if($_SESSION["isLead"]!="1")
{
    header('Location: '.'index.php');
}
//Check if request is sent to a supervisor already

$group_id = $_SESSION["GroupID"];

$sql_check = "SELECT requestId FROM faculty_student_request WHERE groupId = '$group_id ' LIMIT 1";
$result = $conn->query($sql_check);
 if ($result->num_rows > 0) {
     $request_sent = true; //User has already sent request to a supervisor
     
 }
 else{
    //Check if group has a supervisor already
    $sql_check = "SELECT facultyStudentId FROM faculty_student_group WHERE groupId = '$group_id ' LIMIT 1 ";
    $result = $conn->query($sql_check);
     if ($result->num_rows > 0) {
         $request_sent = true; //User has already a supervisor

     }else{
        $request_sent = false;
     }
 }

//If form is submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $faculty_id = $_POST['ChooseSupervisor'];
    
    
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


if (isset($_GET['group_id'])){
        //$group_id = $_GET['group_id'];
        
        //Check if group with id exist
        $sql_check = "SELECT student_group_id from student_groups WHERE student_group_id = '$group_id'";
        $result = $conn->query($sql_check);
        if ($result->num_rows > 0) {
            $sql_request = "INSERT INTO student_group_requests (student_id,group_id) VALUES ('$user_id' , '$group_id')";
            if ($conn->query($sql_request) === TRUE) {
                header('Location:' . 'join_group.php?status=t');
            }
        
        }else{
            header('Location:' . 'join_group.php?status=f');
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
    <div class="col-md-1"></div>
    <div class="col-md-10">

        <?php
        if (isset($_GET['status'])){
            if ($_GET['status'] == 't'){ ?>
                <div style="text-align:center;" class="alert alert-success" role="alert">
                    <span class="glyphicon glyphicon-exclamation-sign"></span>
                    Request sent to supervisor successfully!
                    <button type="button" class="close" data-dismiss="alert">x</button>
                </div>
                <?php
            }
            else  if ($_GET['status'] == 'f'){ ?>
                <div style="text-align:center;" class="alert alert-danger" role="alert">
                    <span class="glyphicon glyphicon-exclamation-sign"></span>
                    Error! Something Went Wrong
                    <button type="button" class="close" data-dismiss="alert">x</button>
                </div>
                <?php
            }
            else if ($_GET['status'] == 'a'){ ?>
                <div style="text-align:center;" class="alert alert-danger" role="alert">
                    <span class="glyphicon glyphicon-exclamation-sign"></span>
                    Error!
                    <button type="button" class="close" data-dismiss="alert">x</button>
                </div>
                <?php
            }
            else if ($_GET['add'] == 'e'){ ?>
                <div style="text-align:center;" class="alert alert-danger" role="alert">
                    <span class="glyphicon glyphicon-exclamation-sign"></span>
                    Error!
                    <button type="button" class="close" data-dismiss="alert">x</button>
                </div>
                <?php
            }

        }
        ?>

        <div class="box no-border">
            <div class="box-header">
              <h3 class="box-title">List of Available Supervisors</h3>
            </div>
              <?php 
              //If request is sent to supervisor or group already has a supervisor
              if ($request_sent == true){ ?>
              <h4>You can not sent request to supervisor</h4>
                <p>This may be due to reasons</p>
                <ul>
                    <li>You already have a group supervisor</li>
                    <!--<li>You have sent request to a supervisor</li>-->
                    <form action="<?php echo $_SERVER['PHP_SELF'];?>" id="cancel_request" method="POST">
                      <li >You have sent request to a supervisor already</li>
                    </form>
                </ul>
                  
            <?php  }
            //If request is not sent
              else{ ?>
              
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
                                            <button id="Formlink" class="btn btn-block btn-primary btn-xs" href="javascript:;" value="<?php echo $row["facultyId"];?>"> Send Request</button>
                                            <input type= "hidden" name="ChooseSupervisor" value="<?php echo $row["facultyId"];?>"/>
                                        </form>
                                      </div>
                                    </td>
                                    </tr>
                                <?php }
                            }
                            }?>
              </table>
                <div class="box-footer  pull-right">
                </div>
            </div>
            <!-- /.box-body -->
                  
            <?php  } ?>
              
           
          </div>
          <!-- /.box -->

    </div>
    <div class="col-md-1"></div>

    </div>

    </section>
    </div>
<!--    </div>-->
<?php require_once("includes/main-footer.php");?>
</div>
<?php require_once("includes/required_js.php");?>
    
 
</body>
</html>