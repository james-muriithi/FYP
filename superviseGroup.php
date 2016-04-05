<?php 

$GLOBALS['title']="FYPMS";
$GLOBALS['subtitle']="Supervise Group";
require_once("includes/header.php");
require_once("includes/config.php");
$error="";


session_start();
if(!isset($_SESSION["design"]))
{
        header('Location: '.'index.php');
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
    <div class="col-md-2"></div>        
    <div class="col-md-8">   

<!--Actual Code for joinGroup starts from here    -->
<div class="box">
    <div class="box-header">
      <h3 class="box-title">Registered Groups</h3>
    </div>

    <!-- /.box-header -->
    <div class="box-body">
      <table id="example1" class="table table-bordered table-striped">
        <thead>
        <tr>
          <th>Group Id</th>
          <th>Group Leader</th>
          <th>CMS</th>
          <th>Group Members</th>
        </tr>
        </thead>
        <tbody>
        <?php
        if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
        }
        else{

        $sql = "SELECT student.studentName, student.studentCMS, student.groupId, student.isLeader, student.isCompleted, student_group.projectPart FROM student INNER JOIN student_group ON student.groupId=student_group.groupId AND student_group.projectPart='1' AND student.isLeader = '1' AND student.isCompleted = '0' ORDER BY student.studentName"; 
        
        //$sql2 = "SELECT facultyId, designation, facultyName, facultyPhoneNo, facultyEmail, facultyPassword, currentLoad, isAdmin, isCoordinator FROM faculty";
        $result = $conn->query($sql);
        //$result2 = $conn->query($sql2);
        $check=0;
        if ($result->num_rows > 0) {
        // output data of each row
            while($row = $result->fetch_assoc()) {
               echo "</th>
                <thead>
                <tr>
                  <td>
                  <div class=\"tools\">".$row["groupId"]."
                                <!-- <form id=\"JoinGroup\" action=\"superviseGroup.php\" method=\"post\">
                                        <button id=\"Formlink\" class=\"glyphicon glyphicon-flag\" href=\"javascript:;\" value=\"".$row["groupId"]."\"> Supervise Group: ".$row["groupId"]."</button>
                                        <input type=\"hidden\" name=\"JoinGroup\" value=\"".$row["groupId"]."\"/>
                                </form>-->
                  </div>
                  </td>
                  <td>".$row["studentName"]."</td>
                  <td>".$row["studentCMS"]."</td>";
				  $grpId=$row["groupId"];
				  $sqlMembers="SELECT studentName, studentCMS FROM student WHERE groupId = '$grpId'";
				  $resultm = $conn->query($sqlMembers);
				  if ($resultm->num_rows > 0) {
					  echo  "<td>";
					   while($rows = $resultm->fetch_assoc()) {
							echo $rows["studentName"]." ".$rows["studentCMS"]."<br/>";
					   }
					   echo "</td>";
				  }


                echo "</tr>
                </thead>";
                }
        }
        $conn->close();
        }
?>

        </tbody>
        <tfoot>
        <tr>
          <th>Group Id</th>
          <th>Group Leader</th>
          <th>CMS</th>
          <th>Group Members</th>
        </tr>
        </tfoot>
      </table>
    </div>
	<form id="Cancel" action="home.php" method="post">
	<br/>
		<div class="row">
			<div class="col-lg-12">
			  <button type="submit" name="Cancel" class="btn btn-primary btn-block btn-flat">Cancel</button>
			</div>
			<!-- /.col -->
        </div>
	</form>
    <!-- /.box-body -->
</div>
<!--joinGroup ends here -->


	
	
	
	<div class="col-md-2"></div>

    <!--</div>-->
    </section>
</div>
    <?php
    require_once("includes/main-footer.php");?>
            </div>

        
        <?php
        
        
    require_once("includes/required_js.php");
    ?> 
    
 
</body>
</html>