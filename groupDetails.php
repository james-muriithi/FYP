<?php
$GLOBALS['title'] = "FYPMS";
$GLOBALS['subtitle'] = "Group Details";
require_once("includes/header.php");
require_once("includes/config.php");
session_start();
if (!isset($_SESSION["usrCMS"])) {
    header('Location: ' . 'index.php');
}


//Check if form is submitted by GET
if ($_SERVER['REQUEST_METHOD'] == 'GET') {


}

//Check if form is submitted by POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {

}


?>
<!-- DataTables -->
<link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
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

                if (isset($_SESSION["GroupID"])   ) { ?>

                    <div class="col-md-12">
                        <div class="box box-solid">
                            <div class="box-header with-border">
                                <i class="fa fa-info-circle"></i>

                                <h3 class="box-title">Group Detail</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <h3>Project Name:</h3>
                                <h4>Supervisor:</h4>
                                <p>Group Members:</p>
                            </div>
                            <!-- /.box-body -->

                            <!--GROUP MEMBERS-->
                            <div class="box-header">
                                <h3 class="box-title">Group Members</h3>

                            </div>
                            <!-- /.box-header -->
                            <div class="box-body  no-padding">
                                <table id="groupMembers" class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>CMS</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>
                                    <?php
                                    $groupID = $_SESSION['GroupID'];
                                    $sql = "SELECT * from student WHERE student.groupId = '$groupID' ";
                                    $result = $conn->query($sql);
                                    while ($row = $result->fetch_assoc()) { ?>
                                        <tr>
                                            <td><?php echo $row['studentCMS']; ?></td>
                                            <td><?php echo $row['studentName']; ?></td>
                                            <td><?php echo $row['studentEmail']; ?></td>
                                            <td>
                                                <a href="<?php echo $_SERVER['PHP_SELF'] . '?edit=' . $row['studentId']; ?>"
                                                   class="btn  btn-primary btn-xs">Details</a>
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


                <?php } else if (is_null($_SESSION["GroupID"])) { ?>

                    <div class="col-md-12">
                        <div class="callout callout-info">
                            <h4>Can not show details</h4>

                            <p>You are not part of any group.Please form a group and try again</p>
                        </div>
                    </div>

                <?php
                }

                ?>


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