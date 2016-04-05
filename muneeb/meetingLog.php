<?php 

$GLOBALS['title']="FYPMS";
$GLOBALS['subtitle']="Group Meeting Logs";
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
      <h3 class="box-title">Groups</h3>
    </div>

    <!-- /.box-header -->
    <div class="box-body">
      <table id="example1" class="table table-bordered table-striped">
        <thead>
        <tr>
          <th>Group Id</th>
          <th>Group Members</th>
		  <th>Meeting Title</th>
          <th>Meeting Date</th>
          <th>Comments</th>
        </tr>
        </thead>
        <tbody>
		<?php
	if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } else {
		$facId=$_SESSION["facultyId"];
		
        $sqlGetGroups = "SELECT * FROM faculty_student_group WHERE facultyId='$facId'";

        $groups=$conn->query($sqlGetGroups);
		
		if ($groups->num_rows > 0) {
            while ($row = $groups->fetch_assoc()) { ?>
			<tr>
			<td>
			<?php echo $row['groupId']; ?>
			</td>
			<td>
				<?php
				$grp=$row['groupId'];
					$sqlGetStudents = "SELECT * FROM student WHERE groupId='$grp'";

					$students=$conn->query($sqlGetStudents);
					
					if ($students->num_rows > 0) {
						while ($row2 = $students->fetch_assoc()) {
							echo $row2['studentName'].'<br/>';
						}
					}
				?>
				
			</td>
			<form id="JoinGroup" action="superviseGroup.php" method="post">
			<td>
				<div>
				<?php// echo $row['groupId']; ?> 
                    <input id="meetTitle" class="glyphicon glyphicon-flag"></input>
                </div>
				
			</td>
			<td>
				<div>
				<?php// echo $row['groupId']; ?> 
                    <input type="text" id="meetDate" ></input>
                </div>
			</td>
			<td>
				<div>
				
                    <input type="textarea" id="meetDescription"></input>
					<form id="updateMeeting" action="superviseGroup.php" method="post">
						<button id="Formlink" class="glyphicon" href="javascript:;" value="<?php echo $row['groupId']; ?>">UpdateLog</button>
                        <input type="hidden" name="updateMeeting" value="<?php echo $row['groupId']; ?> "/>
                    </form
                </div>
			</td>
			</form>
			</tr>
			<?php }
		}

        $conn->close();
    }
	?>


        </tbody>
        <tfoot>
        <tr>
          <th>Group Id</th>
          <th>Group Members</th>
		  <th>Meeting Title</th>
          <th>Meeting Date</th>
          <th>Comments</th>
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

    </div>
    </section>
    </div>

    <?php
    require_once("includes/main-footer.php");
    require_once("includes/required_js.php");
    ?> 
    
 
</body>
</html>

