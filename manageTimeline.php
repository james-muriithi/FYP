<?php
$title = "FYPMS";
$subtitle = "Manage Timeline";
require_once("includes/header.php");
require_once("includes/config.php");
require_once("includes/functions.php");
session_start();
if (!isset($_SESSION["isCord"])) {
    header('Location: ' . 'index.php');
}

//Check if for is submitted by GET
if ($_SERVER['REQUEST_METHOD'] == 'GET') {

    //Provide values for Placeholder in editConfigs
    if (isset($_GET['edit'])) {
        if (is_numeric($_GET['edit'])) {
            $itemId = $_GET['edit'];
            //Check if config id exists
            $sql_check = "SELECT item_id from timeline WHERE item_id = '$itemId' ";
            $result = $conn->query($sql_check);
            if ($result->num_rows > 0) {

                //Get Values from Database
                $sql = "SELECT * FROM timeline WHERE item_id = '$itemId' LIMIT 1 ";

                $result = $conn->query($sql);
                while ($row = $result->fetch_assoc()) {
                    $title = $row['title'];
                    $details = $row['details'];
                    $type = $row['type'];
                    $visibility = $row['visibility'];
                }
            } else {
                $_GET['edit'] = '';
            }
        }

    }



    //Function for delete configuration
    if (isset($_GET["delete"]) and is_numeric($_GET["delete"]) ){

        $id = $_GET["delete"];

        //Check if there is a student
        $sql = "SELECT item_id FROM timeline WHERE item_id = $id";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            //Check for attachment

            $sql = "DELETE FROM timeline WHERE item_id='$id' ";

            if ($conn->query($sql) === TRUE) {
                header('Location:' . $_SERVER['PHP_SELF'] . '?status=t');
            } else {
                header('Location:' . $_SERVER['PHP_SELF'] . '?status=f');
            }
        }else{
            header('Location:' . $_SERVER['PHP_SELF'] . '?status=f');
        }
    }


}


//Check if form is submitted by POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {


    //Function for add
    if (isset($_POST["btnAdd"])) {
        //Validations
        if ((isset($_POST['sdpPart'])) and (isset($_POST['title'])) and (isset($_POST['type']))   and (isset($_POST['visibility']))  ){

            //Get Values from POST
            $title = $_POST['title'];
            $details = $_POST['details'];
            $sdpPart = $_POST['sdpPart'];
            $type = $_POST['type'];
            $visibility = $_POST['visibility'];
            $created_by = $_SESSION["usrnm"];

            $sql = "INSERT INTO timeline (title, details, type, sdp_part, created_by, visibility)
                VALUES ('$title', '$details', '$type', '$sdpPart', '$created_by', '$visibility')";
            if ($conn->query($sql) === TRUE) {
                header('Location:' . $_SERVER['PHP_SELF'] . '?status=t');
            } else {
                header('Location:' . $_SERVER['PHP_SELF'] . '?status=f');
            }

        }
        else{
            header('Location:' . $_SERVER['PHP_SELF'] . '?status=f');
        }
    }

    //Function for edit
    if (isset($_POST["btnEdit"])) {
        //Validations
        $configId = $_GET['edit'];
        echo $configId;exit;
    }

}


?>
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">


</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <?php require_once("includes/main-header.php"); ?>
    <?php require_once("includes/main-sidebar.php"); ?>
    <div class="content-wrapper">
        <?php require_once("includes/content-header.php"); ?>
        <section class="content" style="min-height: 700px">
            <div class="row">


                <?php
                if (isset($_GET['edit']) && is_numeric($_GET['edit'])){ ?>

                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <!--Code for edit a Configuration starts here-->
                    <!-- general form elements -->
                    <div class="box box-primary no-border">
                        <div class="box-header with-border">
                            <h3 class="box-title">Add new Timeline item</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form role="form" action="<?php echo $_SERVER['PHP_SELF'];?>" id="editItem" method="POST" ">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="sdpPart">SDP Part</label>
                                    <select name="sdpPart" class="form-control">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="title">Title</label>
                                    <input type="text" class="form-control" name="title" value="<?php echo $title;?>" required>
                                </div>
                                <div class="form-group">
                                    <label for="details">Details</label>
                                    <div class="box-body pad">
                                        <form>
                                            <textarea class="textarea" name="details" placeholder="Details.."  style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                                        </form>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="type">Notification Type</label>
                                    <select name="type" class="form-control">
                                        <option value="info">Info</option>
                                        <option value="task">Task</option>
                                        <option value="email">Email</option>
                                        <option value="other">Other</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="visibility">Visibility</label>
                                    <select name="visibility" class="form-control">
                                        <option value="PUBLIC">PUBLIC</option>
                                        <option value="FACULTY">FACULTY ONLY</option>
                                        <option value="SUPERVISORS">SUPERVISORS ONLY</option>
                                        <option value="COORDINATORS">COORDINATORS ONLY</option>
                                        <option value="EXTERNAL EXAMINERS">EXTERNAL EXAMINERS ONLY</option>
                                    </select>
                                </div>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer">
                                <a href="<?php echo $_SERVER['PHP_SELF']; ?>" class="btn btn-danger">Back </a>
                                <button type="submit" name="btnEdit" form="editItem" class="btn btn-primary">Submit</button>
                            </div>
                        </form>
                    </div>
                    <!-- /.box -->
                    <div class="col-md-2"></div>

                    <!-- If add button is pressed -->
                    <?php } else if (isset($_GET['add'])) { ?>


                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <!--Code for edit a Configuration starts here-->
                        <!-- general form elements -->
                        <div class="box box-primary no-border">
                            <div class="box-header with-border">
                                <h3 class="box-title">Add new Timeline item</h3>
                            </div>
                            <!-- /.box-header -->
                            <!-- form start -->
                            <form role="form" action="<?php echo $_SERVER['PHP_SELF'];?>" id="addNew" method="POST" enctype="multipart/form-data">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="sdpPart">SDP Part</label>
                                        <select name="sdpPart" class="form-control">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="title">Title</label>
                                        <input type="text" class="form-control" name="title" placeholder="Title" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="details">Details</label>
                                        <div class="box-body pad">
                                            <form>
                                                <textarea class="textarea" name="details" placeholder="Place some text here"  style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="type">Notification Type</label>
                                        <select name="type" class="form-control">
                                            <option value="info">Info</option>
                                            <option value="email">Email</option>
                                            <option value="other">Other</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="visibility">Visibility</label>
                                        <select name="visibility" class="form-control">
                                            <option value="PUBLIC">PUBLIC</option>
                                            <option value="FACULTY">FACULTY ONLY</option>
                                            <option value="SUPERVISORS">SUPERVISORS ONLY</option>
                                            <option value="COORDINATORS">COORDINATORS ONLY</option>
                                            <option value="EXTERNAL EXAMINERS">EXTERNAL EXAMINERS ONLY</option>
                                        </select>
                                    </div>
                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer">
                                    <a href="<?php echo $_SERVER['PHP_SELF']; ?>" class="btn btn-danger">Back </a>
                                    <button type="submit" name="btnAdd" form="addNew" onclick="return confirm('Are you sure?')"  class="btn btn-primary">Submit</button>
                                </div>
                            </form>
                        </div>
                        <!-- /.box -->
                        <div class="col-md-2"></div>




                            <?php } else { ?>
                                <div class="col-md-12 ">

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



                                    <div class="box">
                                        <div class="box-header">
                                            <a href="home.php"><i class="fa fa-arrow-left"></i></a>
                                            <h4 class="text-center ">Timeline Entries</h4>
                                        </div>
                                        <div class="box-header">
                                            <h3 class="box-title">SDP - Part I</h3>
                                        </div>
                                        <!-- /.box-header -->
                                        <div class="box-body  no-padding">
                                            <table id="sdppart1" class="table  table-striped table-responsive table-condensed ">
                                                <thead>
                                                <tr>
                                                    <th>Title</th>
                                                    <th>Details</th>
                                                    <th>Type</th>
                                                    <th>Created</th>
                                                    <th>Visibility</th>
                                                    <th>Actions</th>
                                                </tr>
                                                </thead>
                                                <?php
                                                $sql = "SELECT * FROM timeline_student WHERE  sdpPart='1' ORDER BY createdDtm DESC";
                                                $result = $conn->query($sql);
                                                if ($result->num_rows > 0) {
                                                    while ($row = $result->fetch_assoc()) {
                                                        ?>
                                                        <tr>
                                                            <td><?php echo $row["title"]; ?></td>
                                                            <td><?php echo getExcerpt($row["details"],0,80); ?></td>
                                                            <td><?php echo $row["type"]; ?></td>
                                                            <td><?php echo time2str($row["created_dtm"]); ?></td>
                                                            <td><?php echo $row["visibility"]; ?></td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <a href="<?php echo $_SERVER['PHP_SELF'] . '?edit=' . $row['item_id']; ?>" class="btn  btn-primary btn-xs ">Edit</a>
                                                                    <a href="<?php echo $_SERVER['PHP_SELF'] . '?delete=' . $row['item_id']; ?>" onclick="return confirm('Are you sure?')"  class="btn  btn-danger btn-xs ">Delete</a>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    <?php }
                                                } ?>
                                            </table>
                                            <div class="box-header">
                                                <h3 class="box-title">SDP - Part II</h3>
                                            </div>
                                            <table id="sdppart2" class="table  table-striped table-responsive table-condensed">
                                                <thead>
                                                <tr>
                                                    <th>Title</th>
                                                    <th>Details</th>
                                                    <th>Type</th>
                                                    <th>Created</th>
                                                    <th>Visibility</th>
                                                    <th>Actions</th>
                                                </tr>
                                                </thead>
                                                <?php
                                                $sql = "SELECT * FROM timeline_student WHERE  sdpPart='2' ORDER BY createdDtm DESC";
                                                $result = $conn->query($sql);
                                                if ($result->num_rows > 0) {
                                                    while ($row = $result->fetch_assoc()) {
                                                        ?>
                                                        <tr>
                                                            <td><?php echo $row["title"]; ?></td>
                                                            <td><?php echo getExcerpt($row["details"],0,80); ?></td>
                                                            <td><?php echo $row["type"]; ?></td>
                                                            <td><?php echo time2str($row["created_dtm"]); ?></td>
                                                            <td><?php echo $row["visibility"]; ?></td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <a href="<?php echo $_SERVER['PHP_SELF'] . '?edit=' . $row['item_id']; ?>" class="btn  btn-primary btn-xs ">Edit</a>
                                                                    <a href="<?php echo $_SERVER['PHP_SELF'] . '?delete=' . $row['item_id']; ?>" onclick="return confirm('Are you sure?')"  class="btn  btn-danger btn-xs ">Delete</a>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    <?php }
                                                } ?>
                                            </table>
                                            <div class="box-footer  pull-right">
                                                <a href="<?php echo $_SERVER['PHP_SELF'] . '?add'; ?>"
                                                   class="btn  btn-primary btn-sm ">Add New</a>

                                            </div>
                                        </div>
                                        <!-- /.box-body -->
                                    </div>
                                    <!-- /.box -->
                                </div>
                            <?php } ?>


        </section>
    </div>
<?php

require_once("includes/main-footer.php");
?>
</div>
<?php
require_once("includes/required_js.php");
?>
<!-- Select2 -->
<script src="plugins/select2/select2.full.min.js"></script>
<!-- InputMask -->
<script src="plugins/input-mask/jquery.inputmask.js"></script>
<script src="plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Sweet-Alert -->
<script src="plugins/sweet-alert/sweetalert.min.js"></script>
<!-- Page script -->
<script>
    $(function () {
        //Initialize Select2 Elements
        $(".select2").select2();
        //Datemask dd/mm/yyyy
        $("#datemask").inputmask("yyyy/mm/dd", {"placeholder": "yyyy/mm/dd"});
        $("[data-mask]").inputmask();

        $('.textarea').wysihtml5();

    });
</script>
<script>
    function goBack() {
        window.history.back();
    }
</script>

</body>