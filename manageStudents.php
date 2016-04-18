<?php
$title="FYPMS";
$subtitle="Manage Students";
require_once("includes/header.php");
require_once("includes/config.php");
require('mysql_table.php');
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

    //Edit Student
    if (isset($_POST['btnEditStudent'])){
        //Validations
        if (($_POST['name']) !="" && $_POST['cms'] !=""  && $_POST['email'] !=""  ){
            //Getting values from POST and sanitizing it
            $cms = filter_input(INPUT_POST,'cms',FILTER_SANITIZE_NUMBER_INT);
            $name = filter_input(INPUT_POST,'name',FILTER_SANITIZE_SPECIAL_CHARS);
            $email = filter_input(INPUT_POST,'email',FILTER_SANITIZE_EMAIL);
            $contact = filter_input(INPUT_POST,'contact',FILTER_SANITIZE_NUMBER_INT);
            $password = filter_input(INPUT_POST,'password',FILTER_SANITIZE_SPECIAL_CHARS);
            $editId = filter_input(INPUT_POST,'editId',FILTER_SANITIZE_NUMBER_INT);
            $batchId = filter_input(INPUT_POST,'batchId',FILTER_SANITIZE_NUMBER_INT);


            // prepare and bind
            $stmt = $conn->prepare("UPDATE  student  SET studentCMS = ?, studentName = ?, studentEmail = ?, studentPhoneNo =?, studentPassword=? WHERE student.studentId = ?");
            $stmt->bind_param("sssssi", $cms, $name,$email, $contact, $password , $editId);


            $stmt->execute();

            if ($stmt->affected_rows > 0) {
                $stmt->close();
                $conn->close();
                header('Location:' . $_SERVER['PHP_SELF'] . '?batchId='.$batchId.'&status=t');die;
            }

        }
        else{
            header('Location:' . $_SERVER['PHP_SELF'] . '?status=e');die;
        }
    }

    //Delete Student
    if (isset($_POST['btnDelete'])){
        echo "HERW ".$_POST['deleteId'];exit;
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


                    <?php if (isset($_GET['edit']) && is_numeric($_GET['edit']) && strlen($_GET['edit'])){
                        /*******
                         * Edit Student
                         */
                        $editId = filter_input(INPUT_GET,'edit',FILTER_SANITIZE_NUMBER_INT);

                        $sql = "SELECT * FROM student WHERE studentId = '$editId' LIMIT 1";
                        $result = $conn->query($sql);

                        if ($result->num_rows > 0) {
                            // output data of each row
                            while($row = $result->fetch_assoc()) {
                                $cms = $row['studentCMS'];
                                $name = $row['studentName'];
                                $email = $row['studentEmail'];
                                $contact = $row['studentPhoneNo'];
                                $gender = $row['studentGender'];
                                $password = $row['studentPassword'];
                                $isActive = $row['isActive'];
                                $batchId = $row['batchId'];
                            }
                        }
                        ?>
                        <!-- general form elements -->
                        <div class="box no-border">
                            <div class="box-header with-border">
                                <h3 class="box-title"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit: <?php echo $name;?> </h3>
                            </div>
                            <!-- /.box-header -->

                            <form class="form-horizontal" name="editStudent" action="<?php echo $_SERVER['PHP_SELF'];?>"  method="post" onsubmit="return confirm('Are you sure you want to submit these changes?');" >
                                <input type="hidden" name="editId" value="<?php echo $editId; ?>">
                                <input type="hidden" name="batchId" value="<?php echo $batchId; ?>">
                                <div class="box-body">

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">CMS</label>

                                        <div class="col-sm-10">
                                            <input type="number" min="0000000" max="99999" class="form-control" id="cms" name="cms" value="<?php echo $cms;?>" required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Name</label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="name" name="name" value="<?php echo $name;?>" required>
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


                                        <label class="col-sm-2 control-label">Password <i class="fa fa-eye text-primary" id="eye" aria-hidden="true"></i> </label>
                                        <div class="col-sm-10 " >

                                            <input type="password"  class="form-control" id="password" name="password" value="<?php echo $password ;?>"  required>
                                        </div>

                                    </div>



                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer">
                                    <a href="<?php echo $_SERVER['PHP_SELF']; ?>" class="btn  btn-default btn-sm  "> Cancel</a>
                                    <button type="submit" name="btnEditStudent" class="btn btn-primary pull-right">Submit</button>
                                </div>
                                <!-- /.box-footer -->
                            </form>

                        </div>
                        <!-- /.box -->

                        <?php
                    }?>


                    <div class="box no-border">
                        <div class="box-header">
                            <h3 class="box-title">List of students</h3>

                            <div class="box-tools">
                                <form name="selectBatch"  id="selectBatch" method="get" name="selectGroup">

                                    <div class="input-group input-group-sm" style="width: 250px;">

                                        <select name="batchId"  id="batchId" class="form-control" required>
                                            <?php
                                            $sql = "SELECT * FROM batch WHERE  batch.isActive = 1";
                                            $result = $conn->query($sql);
                                            if ($result->num_rows > 0) {
                                                while($row = $result->fetch_assoc()) { ?>
                                                    <option value="<?php echo $row['batchId']; ?>" >
                                                        <?php echo $row['batchName'];?>
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

                        <?php if (isset($_GET['batchId']) && is_numeric($_GET['batchId']) && strlen($_GET['batchId'])){
                            $batchId = filter_input(INPUT_GET,'batchId',FILTER_SANITIZE_NUMBER_INT);
                            ?>
                            <!-- /.box-header -->
                            <div class="box-body  no-padding">
                                <table id="manageStudents" class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>CMS</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Group Status</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>
                                    <?php
                                    $sql = "SELECT * FROM student WHERE batchId = '$batchId'  ORDER BY student.createdDtm DESC "; //Chronological order
                                    $result = $conn->query($sql);
                                    while($row = $result->fetch_assoc()) { ?>
                                        <tr>
                                            <td><?php echo $row['studentCMS'] ;?></td>
                                            <td><?php echo $row['studentName'];?></td>
                                            <td><?php echo $row['studentEmail'] ;?></td>
                                            <td>
                                                <?php if ($row['isLeader'] == 1 ){ ?>
                                                    <span class="label label-info">Group Leader</span>
                                                <?php } else if($row['groupId'] != null){ ?>
                                                    <span class="label label-primary">Group Formed</span>
                                                <?php }else if (is_null($row['groupId'])){ ?>
                                                    <span class="label label-warning">Not in Group</span>
                                                    <?php
                                                } ?>
                                            </td>
                                            <td>



                                                <a href="<?php echo $_SERVER['PHP_SELF'] . '?edit=' . $row['studentId'].'&batchId='.$batchId; ?>"  class="btn  btn-primary btn-xs">Edit</a>
<!--                                                <a href="--><?php //echo $_SERVER['PHP_SELF'] . '?delete=' . $row['studentId']; ?><!--" onclick="return confirm('Are you sure?')" class="btn  btn-danger btn-xs">Delete</a>-->

                                                <form  action="<?php echo $_SERVER['PHP_SELF'];?>" method="post" onsubmit="return confirm('Are you sure you want to delete this student?');">
                                                    <input type="hidden" name="deleteId" value="<?php echo $row['studentId'];?>">
                                                    <button type="submit" name="btnDelete" class="btn btn-danger  btn-xs ">Delete</button>
                                                </form>



                                            </td>
                                        </tr>
                                    <?php }
                                    ?>
                                </table>
                            </div>
                            <!-- /.box-body -->

                            <div class="box-footer">
                                <a href="./registerStudents.php" class="btn btn-primary btn-sm pull-right">Add New Student</a>
                                <a href="<?php echo siteroot; ?>" class="btn  btn-default btn-sm  "> Back</a>

                            </div>

                            <?php
                        }else{ ?>
                            <h4 class="text-muted">Select Batch from the list fist</h4>
                            <?php
                        } ?>

                    </div>
                    <!-- /.box -->




                </div>

            </div>
        </section>
    </div>
<?php
require_once("includes/main-footer.php");
?>
</div>

<?php
require_once("includes/required_js.php");
?>
<!-- DataTables -->
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
<script>
    $(document).ready(function() {
        $('#manageStudents').DataTable({
            "columnDefs": [
                { "orderable": false, "targets": -1 }
            ],
            "pageLength": 15,
            "paging": true,
            "lengthChange": false,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": false
        });



        function show() {
            var p = document.getElementById('password');
            p.setAttribute('type', 'text');
        }

        function hide() {
            var p = document.getElementById('password');
            p.setAttribute('type', 'password');
        }

        var pwShown = 0;

        document.getElementById("eye").addEventListener("click", function () {
            if (pwShown == 0) {
                pwShown = 1;
                show();
            } else {
                pwShown = 0;
                hide();
            }
        }, false);
    } );
</script>

</body>