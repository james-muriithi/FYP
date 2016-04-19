<?php
//Query to use SELECT * FROM student JOIN student_group ON student.studentId = student_group.leaderId WHERE inGroup < groupLimit
$title="FYPMS";
$subtitle="Join Group";
require_once("includes/header.php");
require_once("includes/config.php");
session_start();
if(!isset($_SESSION["usrCMS"]))
{
        header('Location:' . 'index.php?status=logged_out');
}

if(isset($_POST['JoinGroup'])) {
        if ($conn->connect_error) {
                trigger_error('Database connection failed:'. $conn->connect_error, E_USER_ERROR);	
                die("Connection failed: " . $conn->connect_error);
        } 
        $studntId=$_SESSION["usrId"];
        $grpId = $_POST['JoinGroup'];
		$sql = "INSERT INTO group_requests (studentId, groupId) VALUES ('$studntId','$grpId')";

        if (!$conn->query($sql) === TRUE) {
                echo "Cant Join Group This Time: " . $conn->error;
        }

        unset($_POST);
        $_POST = array();
        $conn->close();
        header('Location: '.'home.php');
}

?>

</head>



<body class="hold-transition skin-blue sidebar-mini">	
<div class="wrapper">
<?php
//****************************************************************************************************************************************************
//
//													headers and sidebars
//
//****************************************************************************************************************************************************
?>  
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
          <th>SDP Part</th>
		  <th>Group Members</th>
        </tr>
        </thead>
        <tbody>
        <?php
        if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
        }
        else{
		$gendr=$_SESSION["usrGender"];
		$batch=$_SESSION["BatchID"];
		
        $sql = "SELECT * FROM student INNER JOIN student_group ON student.groupId=student_group.groupId AND student_group.groupLimit > student_group.inGroup AND student_group.projectPart='1' AND student.isLeader = '1' AND student.studentGender='$gendr' AND student.batchId = '$batch' ORDER BY student.studentName";
        //"SELECT studentName, studentCMS, groupId FROM student WHERE isLeader = '1'";
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
                  <div class=\"tools\">
                                <form id=\"JoinGroup\" action=\"joinGroup.php\" method=\"post\">
                                        <button id=\"Formlink\" class=\"glyphicon glyphicon-flag\" href=\"javascript:;\" value=\"".$row["groupId"]."\"> JoinGroup:".$row["groupId"]."</button>
                                        <input type=\"hidden\" name=\"JoinGroup\" value=\"".$row["groupId"]."\"/>
                                </form>
                  </div>
                  </td>
                  <td>".$row["studentName"]."</td>
                  <td>".$row["studentCMS"]."</td>
                  <td>".$row["projectPart"]."</td>";
				  
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
		

 
      </table>
	
    </div>
    <!-- /.box-body -->
	<form id="Cancel" action="home.php" method="post">
	<br/>
		<div class="row">
			<div class="col-lg-12">
			  <button type="submit" name="Cancel" class="btn btn-primary btn-block btn-flat">Cancel</button>
			</div>
			<!-- /.col -->
        </div>
	</form>
</div>
<!--joinGroup ends here -->
    </div>
    <div class="col-md-2"></div> 
    </div>
    </section>
    </div>
    
    <?php
    require_once("includes/main-footer.php");
    ?> 

    <?php
    require_once("includes/required_js.php");
    ?>    
</body>
</html>