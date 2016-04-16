<?php
$title="FYPMS";
$subtitle="Home";
require_once("includes/header.php");
require_once("includes/config.php");
session_start();
$_GLOBALS["usr_image"]= $_SESSION["image"];
if(isset($_POST['Status']))
{
        echo $_POST['Status'];
}
if(!isset($_SESSION["usrnm"]))
{
        header('Location: '.'index.php');
}



     
if(isset($_POST['signout'])) { // logout button
        // Clear and destroy sessions and redirect user to home page url.
        $_SESSION = array();
        session_destroy();
        // Redirect to where the site home page is located -- Eg: localhost
        header('Location: '.'index.php');
        die;
}
?>
<script src="plugins/jQuery/jQuery-2.2.0.min.js"></script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

    <!-- Main head tag contains all header elements -->
    <?php require_once("includes/main-header.php"); ?>
        
    <!-- Left side column. contains the logo and sidebar -->
    <?php require_once("includes/main-sidebar.php"); ?>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper" >
    <!-- Content Header (Page header) -->
    <?php require_once("includes/content-header.php"); ?>

    <!-- Main content -->
    <section class="content">
    <!-- row -->
      <div class="row">
        <div class="col-md-12">
            <?php
            if (isset($_SESSION['usrCMS'])){
                require_once ("studentTimeline.php");
            }
            if (isset($_SESSION['facultyId'])){
                require_once("facultyTimeline.php");
            }
           

            ?>

<!--            <div id="ajax-timeline">-->
<!--            <script type="text/javascript">-->
<!--                $(document).ready(function() {-->
<!---->
<!--                    $('#ajax-timeline').load('timeline.php')-->
<!---->
<!--                    function getTimelineData(){-->
<!--                        setInterval(function () {-->
<!--                            $('#ajax-timeline').load('timeline.php')-->
<!--                        }, 3000);-->
<!--                    }-->
<!--                    getTimelineData();-->
<!--                });-->
<!--            </script>-->
<!--            </div>-->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
 <!--  Main Footer contains copyright and credits-->

<?php
require_once("includes/main-footer.php");
?>
</div>
<!-- ./wrapper -->
<?php
require_once("includes/required_js.php");
?>
</body>
</html>
