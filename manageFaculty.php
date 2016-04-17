<?php
$title="FYPMS";
$subtitle="Manage Faculty";
require_once("includes/header.php");
require_once("includes/config.php");
session_start();
if(!isset($_SESSION["isCord"]))
{
    header('Location: '.'index.php');
}



//Check if form is submitted by GET
if ($_SERVER['REQUEST_METHOD'] == 'GET') {


}

//Check if form is submitted by POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    if (isset($_POST['btnDelete'])){

        //Getting value from POST and sanitizing
        $deleteId = filter_input(INPUT_POST,'deleteId',FILTER_SANITIZE_NUMBER_INT);


        //Check if faculty is supervising any group
        $sql = "SELECT facultyId FROM faculty_student_group WHERE facultyId= '$deleteId' LIMIT 1";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            //Faculty is supervising a group
            header('Location:' . 'manageFaculty.php?status=n');
        } else {
            //Delete faculty
            // sql to delete a record
            $sql = "DELETE FROM faculty WHERE facultyId= '$deleteId' LIMIT 1";

            if ($conn->query($sql) === TRUE) {
              //Also delete record from work_load
                $sql = "DELETE FROM work_load WHERE facultyId='$deleteId' ";

                if ($conn->query($sql) === TRUE) {
                    header('Location:' . 'manageFaculty.php?status=t');
                }
            }
        }

    }

    if (isset($_POST['btnEditFaculty'])){
        //Validations
        if ($_POST['name']!="" && $_POST['designation']!="" && $_POST['email']!="" && $_POST['contact']!="" && $_POST['quota'] !="" ){
            //Getting values from POST and sanitizing
            $editId = filter_input(INPUT_POST,'editId',FILTER_SANITIZE_NUMBER_INT);
            $name = filter_input(INPUT_POST,'name',FILTER_SANITIZE_SPECIAL_CHARS);
            $designation = filter_input(INPUT_POST,'designation',FILTER_SANITIZE_SPECIAL_CHARS);
            $email = filter_input(INPUT_POST,'email',FILTER_SANITIZE_EMAIL);
            $contact = filter_input(INPUT_POST,'contact',FILTER_SANITIZE_NUMBER_INT);
            $quota = filter_input(INPUT_POST,'quota',FILTER_SANITIZE_NUMBER_INT);

            // prepare and bind
            $stmt = $conn->prepare("UPDATE  faculty JOIN work_load ON faculty.facultyId= work_load.facultyId SET facultyName = ?, designation = ?, facultyPhoneNo = ?, facultyEmail = ?, totalLoad =? WHERE faculty.facultyId = ?");
            $stmt->bind_param("ssssii", $name, $designation,$contact, $email,$quota,$editId);


            $stmt->execute();

            if ($stmt->affected_rows > 0) {
                $stmt->close();
                $conn->close();
                header('Location:' . 'manageFaculty.php?status=t');die;
            }

        }
        else{
            header('Location:' . 'manageFaculty.php?status=e');
        }



    }


}



?>
<!-- DataTables -->
<link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
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
                        else if ($_GET['status'] == 'n'){ ?>
                            <div style="text-align:center;" class="alert alert-danger" role="alert">
                                <span class="glyphicon glyphicon-exclamation-sign"></span>
                                Error! This faculty is supervising a group. Can not delete this
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

                    <?php if (isset ($_GET['edit']) && is_numeric($_GET['edit']) && strlen($_GET['edit'])>0 )  {
                        $editId = filter_input(INPUT_GET,'edit',FILTER_SANITIZE_NUMBER_INT);

                        $sql = "SELECT * FROM faculty JOIN work_load WHERE faculty.facultyId = work_load.facultyId AND faculty.facultyId = '$editId' LIMIT 1 ";
                        $result = $conn->query($sql);

                        if ($result->num_rows > 0) {
                            // output data of each row
                            while($row = $result->fetch_assoc()) {
                                $facultyName = $row['facultyName'];
                                $designation = $row['designation'];
                                $email = $row['facultyEmail'];
                                $contact = $row['facultyPhoneNo'];
                                $quota = $row['totalLoad'];
                            }
                        }
                        ?>
                        <!-- general form elements -->
                        <div class="box no-border">
                            <div class="box-header with-border">
                                <h3 class="box-title"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit: <?php echo $facultyName;?> </h3>
                            </div>

                            <form class="form-horizontal" name="editFaculty" action="<?php echo $_SERVER['PHP_SELF'];?>"  method="post" onsubmit="return confirm('Are you sure you want to submit these changes?');" >
                                <input type="hidden" name="editId" value="<?php echo $editId; ?>">
                                <div class="box-body">

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Name</label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="name" name="name" value="<?php echo $facultyName;?>" required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Designation</label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="designation" name="designation" value="<?php echo $designation;?>" required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Email</label>

                                        <div class="col-sm-10">
                                            <input type="email" class="form-control" id="email" name="email" value="<?php echo $email;?>" required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Contact</label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="contact" name="contact" value="<?php echo $contact;?>" required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Supervising Quota</label>

                                        <div class="col-sm-10">
                                            <input type="number" min="0" max="5" class="form-control" id="quota" name="quota" value="<?php echo $quota ;?>" required>
                                        </div>
                                    </div>


                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer">
                                    <a href="<?php echo $_SERVER['PHP_SELF']; ?>" class="btn  btn-default btn-sm  "> Cancel</a>
                                    <button type="submit" name="btnEditFaculty" class="btn btn-primary pull-right">Submit</button>
                                </div>
                                <!-- /.box-footer -->
                            </form>

                        </div>
                        <!-- /.box -->
                    <?php
                    }?>

                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">Faculty List</h3>

                        </div>
                        <!-- /.box-header -->
                        <div class="box-body  no-padding">
                            <table id="manageFaculty" class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Designation</th>
                                    <th>Email</th>
                                    <th>Roles</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <?php
                                $sql = "SELECT * from faculty WHERE isAdmin != 1 "; //Exclude SuperAdmin from the list
                                $result = $conn->query($sql);
                                while($row = $result->fetch_assoc()) { ?>
                                    <tr>
                                        <td><?php echo $row['facultyName'] ;?></td>
                                        <td><?php echo $row['designation'];?></td>
                                        <td><?php echo $row['facultyEmail'] ;?></td>
                                        <td>
                                            <?php
                                                if ($row["isAdmin"] == 1){echo '<p class="text-green">Administrator</p>';}
                                                if ($row["isCoordinator"] == 1){echo '<p class="text-green">Coordinator</p>';}
                                            ?></td>
                                        <td>
                                            <a href="<?php echo $_SERVER['PHP_SELF'] . '?edit=' . $row['facultyId']; ?>"  class="btn  btn-primary btn-xs">Edit</a>
                                            <form  action="<?php echo $_SERVER['PHP_SELF'];?>" method="post" onsubmit="return confirm('Are you sure you want to delete this faculty?');">
                                                <input type="hidden" name="deleteId" value="<?php echo $row['facultyId'];?>">
                                               <button type="submit" name="btnDelete" class="btn btn-danger btn-xs">Delete</button>
                                            </form>

                                        </td>
                                    </tr>
                                <?php }
                                ?>
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->

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
<!-- DataTables -->
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
<script>
    $(document).ready(function() {
        $('#manageFaculty').DataTable({
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