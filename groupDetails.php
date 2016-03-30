<?php
$GLOBALS['title'] = "FYPMS";
$GLOBALS['subtitle'] = "Group Details";
require_once("includes/header.php");
require_once("includes/config.php");
session_start();
if (!isset($_SESSION["usrCMS"])) {
    header('Location: ' . 'index.php');
}
$groupId = $_SESSION["GroupID"];


//Check if form is submitted by GET
if ($_SERVER['REQUEST_METHOD'] == 'GET') {


}

//Check if form is submitted by POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {

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
                <?php
                if (isset($_SESSION["GroupID"])   ) { ?>

                    <div class="col-md-12">
                        <div class="box box-solid">
                            <!-- /.box-header -->
                            <div class="box-body">
                                <h3>Project Name:<?php

                                    $name = $conn->query("SELECT projectName FROM student_group WHERE groupId = '$groupId' ")->fetch_object()->projectName;
                                    if ($name){echo $name; }else{echo " --- ";}


                                    ?></h3>
                                <h4>Supervisor:</h4>
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
                                        <th>Contact</th>
                                    </tr>
                                    </thead>
                                    <?php
                                    $groupID = $_SESSION['GroupID'];
                                    $sql = "SELECT * from student WHERE student.groupId = '$groupID' ";
                                    $result = $conn->query($sql);
                                    while ($row = $result->fetch_assoc()) { ?>
                                        <tr>
                                            <td><?php echo $row['studentCMS']; ?></td>
                                            <td><?php echo $row['studentName'];
                                            if ($row['isLeader'] == 1){
                                               echo '  <span class="label label-primary">Leader</span>'; 
                                            }
                                            ?></td>
                                            <td><?php echo $row['studentEmail']; ?></td>
                                            <td><?php echo $row['studentPhoneNo']; ?></td>
                                        </tr>
                                    <?php }
                                    ?>
                                </table>
                                
                                
                            </div>
                            <!-- /.box-body -->


                        </div>
                        <!-- /.box -->
                    </div>


                <?php } else if ($_SESSION["GroupID"] == 0) { ?>

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