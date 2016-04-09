<?php
$GLOBALS['title']="FYPMS";
$GLOBALS['subtitle']="Meeting Logs";
require_once("includes/header.php");
require_once("includes/config.php");
session_start();

//Check if supervisor is logged in
if(!isset($_SESSION["design"]))
{
    header('Location: '.'index.php');
}
$supervisorId = $_SESSION['facultyId'];

//Check if supervisor has groups
$sql = "SELECT * FROM faculty_student_group WHERE facultyId = '$supervisorId' ";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $groupCheck = true;
    $numOfGroups =$result->num_rows;

    while($row = $result->fetch_assoc()) {
        //echo $row['groupId'];echo '<br/>';
    }
}
else{
    //This faculty isnt supervising any group
    $groupCheck = false;
}



//Check if form is submitted by GET
if ($_SERVER['REQUEST_METHOD'] == 'GET') {


}

//Check if form is submitted by POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    /*
     * EDIT MEETING LOG
     */

    if (isset($_POST['btnEditLog'])){
        //EDIT log
        $logId = filter_input(INPUT_POST,'editId',FILTER_SANITIZE_NUMBER_INT);

        //Validations
        if ($_POST['status'] != "" && $_POST['meetingTitle'] != ""){

            $status = filter_input(INPUT_POST,'status',FILTER_SANITIZE_SPECIAL_CHARS);
            $title = filter_input(INPUT_POST,'meetingTitle',FILTER_SANITIZE_SPECIAL_CHARS);
            $comments = $_POST['addComments'];

            $sql = "UPDATE meeting_logs SET meeting_title = '$title' , meeting_status='$status' , comments='$comments' WHERE id='$logId' ";

            if ($conn->query($sql) === TRUE) {
                header('Location:' . $_SERVER['PHP_SELF'] . '?status=t');
            } else {
                header('Location:' . $_SERVER['PHP_SELF'] . '?status=f');
            }
        }
    }



    //ADD NEW LOG
    if (isset($_POST['addNewLogBtn'])){
        //Validations
        if (isset($_POST['meetingTitle']) && isset($_POST['groupId']) ){

            $meetingTitle = filter_input(INPUT_POST,'meetingTitle',FILTER_SANITIZE_SPECIAL_CHARS);
            $groupId = filter_input(INPUT_POST,'groupId',FILTER_SANITIZE_NUMBER_INT);
            $meetingDate = date('Y-m-d', strtotime($_POST['meetingDate']));
            //$meetingTime = $_POST['meetingTime'];

            $sql = "INSERT INTO meeting_logs (supervisor_id, group_id, meeting_title, meeting_dtm, meeting_status)VALUES ('$supervisorId', '$groupId', '$meetingTitle', '$meetingDate','1')";

            if ($conn->query($sql) === TRUE) {
                header('Location:' . $_SERVER['PHP_SELF'] . '?status=t');
            } else {
                header('Location:' . $_SERVER['PHP_SELF'] . '?status=f');
            }


        }

    }

    //ADD COMMENTS
    if(isset($_POST['btnAddComments'])){
        //echo 'HERE';exit
        //Validations
        if (isset($_POST['comments']) && $_POST['comments'] != ""){

            $logId = filter_input(INPUT_POST,'editId',FILTER_SANITIZE_NUMBER_INT);
            $comments = $_POST['comments'];

            $sql = "UPDATE meeting_logs SET comments = '$comments' WHERE id='$logId' ";

            if ($conn->query($sql) === TRUE) {
                header('Location:' . $_SERVER['PHP_SELF'] . '?status=t');
            } else {
                header('Location:' . $_SERVER['PHP_SELF'] . '?status=f');
            }
        }
    }

}



?>

<!--Date Picker-->
<link rel="stylesheet" href="plugins/datepicker/datepicker3.css"/>
<!-- DataTables -->
<link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <?php require_once("includes/main-header.php"); ?>
    <?php require_once("includes/main-sidebar.php"); ?>
    <div class="content-wrapper" >
        <?php require_once("includes/content-header.php"); ?>

        <section class="content" style="min-height: 700px">
            <div class="row">
                <div class="col-md-12">

                    <?php
                    if (isset($_GET['status'])){
                        if ($_GET['status'] == 't'){ ?>
                            <div style="text-align:center;" class="alert alert-success" role="alert">
                                <span class="glyphicon glyphicon-exclamation-sign"></span>
                                Changes saved successfully!
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
                        else if ($_GET['status'] == 's'){ ?>
                            <div style="text-align:center;" class="alert alert-danger" role="alert">
                                <span class="glyphicon glyphicon-exclamation-sign"></span>
                                Error!
                                <button type="button" class="close" data-dismiss="alert">x</button>
                            </div>
                            <?php
                        }
                        else if ($_GET['status'] == 'e'){ ?>
                            <div style="text-align:center;" class="alert alert-danger" role="alert">
                                <span class="glyphicon glyphicon-exclamation-sign"></span>
                                Error!
                                <button type="button" class="close" data-dismiss="alert">x</button>
                            </div>
                            <?php
                        }
                    }

                    ?>


            <?php if ($groupCheck == true){ ?>
                <?php if (isset($_GET['add'])){ ?>
                    <div class="box no-border">
                        <div class="box-header">
                            <h3 class="box-title">Add New Meeting Log</h3>

                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form role="form" id="addNewLog" name="addNewLog" method="post">
                            <div class="box-body">
                                <div class="form-group">
                                    <label>Meeting Title</label>
                                    <input type="text" class="form-control" id="meetingTitle" name="meetingTitle" placeholder="Enter meeting title" required>
                                </div>

                                <div class="form-group">
                                    <label>Select Group</label>
                                    <select name="groupId" class="form-control" required>
                                        <?php
                                        $sql = "SELECT * FROM faculty_student_group JOIN student_group WHERE facultyId = '$supervisorId' AND student_group.groupId = faculty_student_group.groupId ";
                                        $result = $conn->query($sql);
                                        if ($result->num_rows > 0) {
                                            while($row = $result->fetch_assoc()) { ?>
                                                <option value="<?php echo $row['groupId']; ?>"><?php if (isset($row['projectName'])){echo 'Group:'.$row['groupId']. '[ '.$row['projectName'].' ] ';}else{ echo '--';}?>
                                                </option>
                                                <?php
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="row">

                                    <div class="col-md-6">
                                        <label>Select Date:</label>
                                        <div class="input-group date" data-provide="datepicker">
                                            <input type="text" name="meetingDate"  id="meetingDate"  class="form-control" >
                                            <div class="input-group-addon"><span class="glyphicon glyphicon-th"></span></div>
                                        </div>

                                    </div>

                                    <div class="col-md-6">

                                    </div>

                                </div>

                            </div>
                            <!-- /.box-body -->

                            <div class="box-footer">
                                <a href="<?php echo $_SERVER['PHP_SELF'];?>" class="btn btn-default ">Cancel</a>
                                <button type="submit" name="addNewLogBtn" class="btn btn-primary pull-right" onclick="return confirm('Are you sure?')">Submit</button>
                            </div>
                        </form>

                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->


                    <?php
                }?>



                <?php if (isset($_GET['edit']) && is_numeric($_GET['edit']) && strlen($_GET['edit']) > 0 ){
                    /*******************
                     * EDIT MEETING LOGS
                     * ******************/

                    $id = filter_input(INPUT_GET,'edit',FILTER_SANITIZE_NUMBER_INT);

                    $sql = "SELECT * from meeting_logs WHERE supervisor_id='$supervisorId' AND id='$id' LIMIT 1";
                    $result = $conn->query($sql);
                    if ($result->num_rows > 0) {
                        while($row = $result->fetch_assoc()) {
                            $meetingTitle = $row['meeting_title'];
                            $meetingStatus = $row['meeting_status'];
                            $meetingComments = $row['comments'];
                            $meetingDtm = $row['meeting_dtm'];
                        }
                        ?>
                    <div class="box no-border">
                        <div class="box-header">
                            <h3 class="box-title">Edit Meeting Log: <?php echo $meetingTitle?></h3>
                        </div>

                        <div class="box-body">
                            <!-- form start -->
                            <form id="editLogs" name="editLogs" action="<?php echo $_SERVER['PHP_SELF'];?>" method="post">

                                <input type="hidden" name="editId" id="editId" value="<?php echo $id;?>">

                                <div class="box-body">

                                    <div class="form-group">
                                        <label>Meeting Title</label>
                                        <input type="text" name="meetingTitle" id="meetingTitle" class="form-control" value="<?php echo $meetingTitle; ?>">
                                    </div>

                                    <div class="form-group">
                                        <label>Change Status</label>
                                        <select class="form-control" id="status" name="status" required>
                                            <option value="">SELECT STATUS</option>
                                            <option value="Pending">Pending</option>
                                            <option value="Postponed">Postponed</option>
                                            <option value="Done">Done</option>
                                            <option value="Cancelled">Cancelled</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label>Add Comments</label>
                                        <div class="box-body pad">
                                            <form>
                                                <textarea class="textarea" name="addComments"  placeholder="Add Comments..."  style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                                            </form>
                                        </div>
                                    </div>

                                </div>
                                <!-- /.box-body -->

                            </form>
                                <div class="box-footer">
                                    <a href="<?php echo $_SERVER['PHP_SELF'];?>" class="btn btn-default">Back</a>
                                    <button type="submit" form="editLogs" name="btnEditLog"  class="btn btn-primary pull-right">Submit</button>
                                </div>

                        </div>


                        </div>



                    <?php
                    }


                ?>





                <?php
                }else if(isset($_GET['comment']) && is_numeric($_GET['comment']) && strlen($_GET['comment']) > 0){
                    /*******************
                     * EDIT MEETING LOGS
                     * ******************/

                    $id = filter_input(INPUT_GET,'comment',FILTER_SANITIZE_NUMBER_INT);


                    $sql = "SELECT * from meeting_logs WHERE supervisor_id='$supervisorId' AND id='$id' LIMIT 1";
                    $result = $conn->query($sql);
                    if ($result->num_rows > 0) {
                        while($row = $result->fetch_assoc()) {
                            $meetingTitle = $row['meeting_title'];
                        }
                        ?>
                        <div class="box no-border">
                            <div class="box-header">
                                <h3 class="box-title">Edit Meeting Log: <?php echo $meetingTitle?></h3>
                            </div>

                            <div class="box-body">
                                <!-- form start -->
                                <form id="addComments" name="addComments" action="<?php echo $_SERVER['PHP_SELF'];?>" method="post">

                                    <input type="hidden" name="editId" id="editId" value="<?php echo $id;?>">

                                    <div class="box-body">



                                        <div class="form-group">
                                            <label>Add Comments</label>
                                            <div class="box-body pad">
                                                <form>
                                                    <textarea class="textarea" name="comments"  placeholder="Add Comments..."  style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                                                </form>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- /.box-body -->

                                </form>
                                <div class="box-footer">
                                    <a href="<?php echo $_SERVER['PHP_SELF'];?>" class="btn btn-default">Back</a>
                                    <button type="submit" form="addComments" name="btnAddComments"  class="btn btn-primary pull-right">Submit</button>
                                </div>

                            </div>


                        </div>



                        <?php
                    }


                }


                else{ ?>
                    <div class="box no-border">
                        <div class="box-header">
                            <h3 class="box-title">Meeting Logs</h3>

                            <div class="box-tools">
                                <form id="selectGroup"  method="get" name="selectGroup">
                                    <div class="input-group input-group-sm" style="width: 250px;">

                                        <select name="id" class="form-control" required>
                                            <?php
                                            $sql = "SELECT * FROM faculty_student_group JOIN student_group WHERE facultyId = '$supervisorId' AND student_group.groupId = faculty_student_group.groupId ";
                                            $result = $conn->query($sql);
                                            if ($result->num_rows > 0) {
                                                while($row = $result->fetch_assoc()) { ?>
                                                    <option value="<?php echo $row['groupId']; ?>"><?php if (isset($row['projectName'])){echo 'Group:'.$row['groupId']. '[ '.$row['projectName'].' ] ';}else{ echo '--';}?>
                                                    </option>
                                                    <?php
                                                }
                                            }
                                            ?>
                                        </select>

                                        <div class="input-group-btn">
                                            <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>


                        <!-- /.box-header -->
                        <div class="box-body  no-padding">
                            <table id="meetingLogs" class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Group</th>
                                    <th>Title</th>
                                    <th>Meeting Time</th>
                                    <th>Comments</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>

                                <?php
                                if (isset($_GET['id'])){
                                    $groupId = filter_input(INPUT_GET,'id',FILTER_SANITIZE_NUMBER_INT);
                                    //Check if this supervisor has this group
                                    $sql = "SELECT id from meeting_logs WHERE supervisor_id='$supervisorId' AND group_id='$groupId' LIMIT 1";
                                    $result = $conn->query($sql);
                                    if ($result->num_rows > 0) {
                                        $sql = "SELECT * from meeting_logs WHERE supervisor_id = '$supervisorId' AND group_id = '$groupId' ORDER BY created_dtm DESC";
                                        $result = $conn->query($sql);
                                        while($row = $result->fetch_assoc()) { ?>
                                            <tr>
                                                <td><?php echo $row['group_id'] ;?></td>
                                                <td><?php echo $row['meeting_title'];?></td>
                                                <td><?php echo $row['meeting_dtm'] ;?></td>
                                                <td><?php
                                                    if (is_null($row['comments'])){ ?>
                                                        <a href="<?php echo $_SERVER['PHP_SELF'] . '?comment=' . $row['id']; ?>"  class="btn  btn-default btn-flat btn-xs">Add Comments</a>
                                                    <?php
                                                    }else{
                                                        echo $row['comments'];
                                                    }
                                                        ;?></td>

                                                <form id="logActions" name="logActions" method="post">
                                                    <th><?php
                                                        $status =$row['meeting_status'];
                                                        if ($status == 'Pending'){ ?>
                                                            <span class="label label-warning"><?php echo $status?></span>

                                                            <?php
                                                        }
                                                        else if ($status == 'Done'){ ?>
                                                            <span class="label label-success"><?php echo $status?></span>
                                                            <?php
                                                        }
                                                        else if ($status == 'Cancelled'){ ?>
                                                            <span class="label label-danger"><?php echo $status?></span>

                                                            <?php
                                                        }
                                                        else if ($status == 'Postponed'){ ?>
                                                            <span class="label label-primary"><?php echo $status?></span>

                                                            <?php
                                                        }else{ ?>
                                                            <span class="label label-default"><?php echo $status?></span>

                                                            <?php
                                                        }
                                                        ;?></th>
                                                </form>
                                                <td>
                                                    <input type="hidden" name="logId" value="<?php echo $row['id'];?>">
                                                    <a href="<?php echo $_SERVER['PHP_SELF'] . '?edit=' . $row['id']; ?>"  class="btn  btn-primary btn-xs">Edit</a>
                                                    <a href="<?php echo $_SERVER['PHP_SELF'] . '?delete=' . $row['id']; ?>" onclick="return confirm('Are you sure?')" class="btn  btn-danger btn-xs">Delete</a>
                                                </td>
                                            </tr>
                                        <?php }
                                    }
                                }
                                ?>
                            </table>
                            <div class="box-footer  pull-right">
                                <a href="<?php echo $_SERVER['PHP_SELF'] . '?add'; ?>" class="btn  btn-primary  ">Add New Log</a>
                            </div>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->

                <?php
                }?>

                <?php
            }else if ($groupCheck == false){ ?>
                <div class="box no-border">
                    <div class="box-header">
                        <h3 class="box-title">Add New Meeting Log</h3>

                    </div>
                    <!-- /.box-header -->
                        <div class="box-body">
                            <p>You are not supervising any group</p>
                        </div>
                        <!-- /.box-body -->
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            <?php
            } ?>
                </div>

            </div>
        </section>
    </div><!-- ./content-wrapper -->
    <!--</div>-->
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
<!--TimePicker-->
<script src="plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script>
    $( document ).ready(function() {

        $('.datepicker').datepicker({
            format: 'dd/mm/yyyy',
        });
    });
</script>
<!-- Bootstrap WYSIHTML5 -->
<script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- DataTables -->
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
<script>
    $(document).ready(function() {

        $('.textarea').wysihtml5();

        $('#meetingLogs').DataTable({
            "paging": false,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": false,
            "autoWidth": false
        });
    } );
</script>


</body>