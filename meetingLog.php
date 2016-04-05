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
                <div class="col-md-12">

                    <?php if (isset ($_GET['status'])){
                        if ($_GET['status'] == 't'){ ?>
                            <div style="text-align:center;" class="alert alert-success" role="alert">
                                <span class="glyphicon glyphicon-exclamation-sign"></span>
                                Changes saved successfully!
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

                        else{ ?>
                            <div style="text-align:center;" class="alert alert-danger" role="alert">
                                <span class="glyphicon glyphicon-exclamation-sign"></span>
                                Error! Something Went Wrong
                                <button type="button" class="close" data-dismiss="alert">x</button>
                            </div>
                        <?php    }
                    }?>


            <?php if ($groupCheck == true){ ?>
                <div class="box no-border">
                    <div class="box-header">
                        <h3 class="box-title">Add New Meeting Log</h3>

                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <form role="form">
                        <div class="box-body">
                            <div class="form-group">
                                <label>Meeting Title</label>
                                <input type="text" class="form-control" id="meetingTitle" name="meetingTitle" placeholder="Enter meeting title">
                            </div>

                            <div class="form-group">
                                <label>Select Group</label>
                                <select name="groupId" class="form-control">
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

                            <div class="input-group date" data-provide="datepicker">
                                <input type="text" name="startingDate"  id="startingDate"  class="form-control">
                                <div class="input-group-addon"><span class="glyphicon glyphicon-th"></span></div>
                            </div>

                        </div>
                        <!-- /.box-body -->

                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary pull-right">Submit</button>
                        </div>
                    </form>

                    <!-- /.box-body -->
                </div>
                <!-- /.box -->

                <div class="box no-border">
                    <div class="box-header">
                        <h3 class="box-title">Meeting Logs</h3>

                    </div>
                    <!-- /.box-header -->
                    <div class="box-body  no-padding">
                        <table id="meetingLogs" class="table table-hover">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Title</th>
                                <th>Meeting Time</th>
                                <th>Comments</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <?php
                            $sql = "SELECT * from meeting_logs WHERE supervisor_id = '13' ";
                            $result = $conn->query($sql);
                            while($row = $result->fetch_assoc()) { ?>
                                <tr>
                                    <td><?php echo $row['id'] ;?></td>
                                    <td><?php echo $row['meeting_title'];?></td>
                                    <td><?php echo $row['meeting_dtm'] ;?></td>
                                    <td><?php echo $row['comments'] ;?></td>
                                    <th><?php echo $row['meeting_status'] ;?></th>
                                    <td>
                                        <a href="<?php echo $_SERVER['PHP_SELF'] . '?edit=' . $row['facultyId']; ?>"  class="btn  btn-primary btn-xs">Edit</a>
                                        <a href="<?php echo $_SERVER['PHP_SELF'] . '?delete=' . $row['facultyId']; ?>" onclick="return confirm('Are you sure?')" class="btn  btn-danger btn-xs">Delete</a>
                                    </td>
                                </tr>
                            <?php }
                            ?>
                        </table>
                        <div class="box-footer  pull-right">
                            <a href="<?php echo $_SERVER['PHP_SELF'] . '?add'; ?>" class="btn  btn-primary btn-sm ">Set New Meeting</a>
                        </div>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->


                <?php
            }else if ($groupCheck == false){ ?>
                <p>No group</p>

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
<script>
    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy',
    });
</script>

</body>