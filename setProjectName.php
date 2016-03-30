<?php
$GLOBALS['title'] = "FYPMS";
$GLOBALS['subtitle'] = "Set Project Name";
require_once("includes/header.php");
require_once("includes/config.php");
session_start();
if (!isset($_SESSION["usrCMS"])) {
    header('Location: ' . 'index.php');
}




//Check if form is submitted by POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {


    if (isset($_POST['btnChangeName'])) {
        if ($_POST['projectName'] != "") {
            $groupId = $_SESSION["GroupID"];
            $projectName = filter_input(INPUT_POST, "projectName", FILTER_SANITIZE_SPECIAL_CHARS);
            
                 $sql = "UPDATE student_group SET projectName='$projectName' WHERE groupId='$groupId'  ";

                if ($conn->query($sql) === TRUE) {
                    header('Location:' . $_SERVER['PHP_SELF'] . '?status=t');
                } else {
                     header('Location:' . $_SERVER['PHP_SELF'] . '?status=f');
                }
        }
    }
}
?>

</head>

<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

<?php require_once("includes/main-header.php"); ?>
<?php require_once("includes/main-sidebar.php"); ?>
        <div class="content-wrapper">
<?php require_once("includes/content-header.php"); ?>

            <section class="content" style="min-height: 700px">
                <div class="row">
                    <div class="col-md-2"></div>

                    <div class="col-md-8">
                                                            
                    <?php
                        if (isset($_GET['status'])) {
                            if ($_GET['status'] == 'f') { ?>

                                <div style="text-align:center;" class="alert alert-danger" role="alert">
                                    <span class="glyphicon glyphicon-exclamation-sign"></span>
                                    Something Went Wrong
                                    <button type="button" class="close" data-dismiss="alert">x</button>
                                </div>

                            <?php } else if ($_GET['status'] == 't') { ?>
                                <div style="text-align:center;" class="alert alert-success" role="alert">
                                    <span class="glyphicon glyphicon-exclamation-sign"></span>
                                    Student Registered
                                    <button type="button" class="close" data-dismiss="alert">x</button>
                                </div>
                            <?php }

                        }

                        ?>
                        <div class="box box-solid">
                            <div class="box-header with-border">
                                <i class="fa fa-pencil-square-o"></i>

                                <h3 class="box-title">Set Project Name</h3>
                            </div>
                            <!-- /.box-header -->
                            <form role="form" action="<?php echo $_SERVER['PHP_SELF']; ?>" id="changeProjName" method="POST">
                                <div class="box-body">
                                    
                                    
                                    <h4>Project Name:</h4>
                                    <div class="form-group">
                                        <label for="projectName" class="col-sm-2 control-label">Project Name</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="projectName" id="projectName" placeholder="Project Name" required>
                                        </div>
                                    </div>
                                </div>
                            </form>

                            <!-- /.box-body -->
                            <div class="box-footer">
                                <a href="<?php echo siteroot; ?>" class="btn btn-danger">Back </a>
                                <!--<button type="submit" class="btn btn-danger">Back</button>-->
                                <button type="submit" name="btnChangeName" form="changeProjName" class="btn btn-primary pull-right">Change Name</button>
                            </div>
                            <!-- /.box-footer -->

                        </div>
                        <!-- /.box -->
                    </div>

                    <div class="col-md-2"></div>
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

</body>
</html>