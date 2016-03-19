<?php

	require_once("includes/config.php");
	session_start();
	if(!isset($_SESSION["usrnm"]))
	{
		header('Location: '.'index.php');
	}
	
	if(isset($_POST["Accept"]))
	{
		if ($conn->connect_error) {
			die("Connection failed: " . $conn->connect_error);
		}
		else{
			$usr=$_POST["Accept"];
			$sqlget="SELECT groupId FROM group_requests WHERE studentId = '$usr'";
			$groupsID='0';
			$results = $conn->query($sqlget);
			if ($results->num_rows > 0) {
				// output data of each row
				$rows = $results->fetch_assoc();
				$groupsID=$rows["groupId"];
			}
			
			$sqlUpd="UPDATE student SET groupId = '$groupsID' WHERE studentId = '$usr'";
			$sqlUpdGrp="UPDATE student_group SET inGroup = inGroup+1 WHERE groupId = '$groupsID'";
			$sqlDel="Delete FROM group_requests WHERE studentId = '$usr'";
			$conn->query($sqlUpd);
			$conn->query($sqlUpdGrp);
			$conn->query($sqlDel);
			//echo $groupsID;
			//echo $usr;
			$conn->close();
			header('Location: '.'home.php');
		}
		

		//header('Location: '.'home.php');
	}else if(isset($_POST["Reject"]))
	{
		if ($conn->connect_error) {
			die("Connection failed: " . $conn->connect_error);
		}
		else{
			$usrR=$_POST["Reject"];
			$sqlDel="Delete FROM group_requests WHERE studentId = '$usrR'";
			$conn->query($sqlDel);
			$conn->close();
			header('Location: '.'home.php');
		}
		
		echo "Delete user request id= ".$_POST["Reject"];
	}
	
	
	

	
	if(isset($_POST["AcceptGroup"]))
	{
		if ($conn->connect_error) {
			die("Connection failed: " . $conn->connect_error);
		}
		else{
			$usr=$_POST["AcceptGroup"];
			//$sqlget="SELECT groupId FROM group_requests WHERE studentId = '$usr'";
			//$groupsID='0';
			//$results = $conn->query($sqlget);
			//if ($results->num_rows > 0) {
				// output data of each row
			//	$rows = $results->fetch_assoc();
			//	$groupsID=$rows["groupId"];
			//}
			$faculty=$_SESSION["facultyId"];
			$sqlUpd="INSERT INTO faculty_student_group (facultyId, groupId ) VALUES ('$faculty','$usr')";
			$sqlUpdGrp="UPDATE work_load SET currentLoad = currentLoad+1 WHERE facultyId='$faculty'";
			$sqlDel="Delete FROM faculty_student_request WHERE groupId = '$usr' AND facultyId='$faculty'";
			$conn->query($sqlUpd);
			$conn->query($sqlUpdGrp);
			$conn->query($sqlDel);
			//echo $groupsID;
			//echo $usr;
			$conn->close();
			header('Location: '.'index.php');
		}
		

		//header('Location: '.'home.php');
	}else if(isset($_POST["RejectGroup"]))
	{
		if ($conn->connect_error) {
			die("Connection failed: " . $conn->connect_error);
		}
		else{
			$faculty=$_SESSION["facultyId"];
			$usrR=$_POST["RejectGroup"];
			$sqlDel="Delete FROM faculty_student_request WHERE groupId = '$usrR' AND facultyId='$faculty'";
			$conn->query($sqlDel);
			$conn->close();
			header('Location: '.'index.php');
		}
		
		echo "Delete user request id= ".$_POST["Reject"];
	}

?>			
			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-user"></i>
              
			<?php
//****************************************************************************************************************************************************
//
//						Displaying group join requests along with student names and options to accept and reject group request
//
//**************************************************************************************************************************************************** -->
     
			if($_SESSION["type"]=="Student")
			{
				$groupid=0;
				$uID=$_SESSION["usrId"];
				if ($conn->connect_error) {
					die("Connection failed: " . $conn->connect_error);
				}
				else{
					$sql1="SELECT groupId FROM student WHERE studentId = '$uID'";
					$result1 = $conn->query($sql1);
					if ($result1->num_rows > 0) {
						// output data of each row
						$row1 = $result1->fetch_assoc();
						$groupid=$row1["groupId"];
						
					}
					
					$sql = "SELECT student.studentName, student.studentId, student.studentCMS, group_requests.groupId, group_requests.groupId FROM student INNER JOIN group_requests ON student.studentId=group_requests.studentId WHERE group_requests.groupId = '$groupid' ORDER BY student.studentName"; 
					//"SELECT studentName, studentCMS, groupId FROM student WHERE isLeader = '1'";
					
					//$sql2 = "SELECT facultyId, designation, facultyName, facultyPhoneNo, facultyEmail, facultyPassword, currentLoad, isAdmin, isCoordinator FROM faculty";
					
					
					$result = $conn->query($sql);
					if($result->num_rows >= 0) {
						
						if($result->num_rows>0)
						{
							echo "<span class=\"label label-danger\">".$result->num_rows."</span>";
						}	
					
					}
					echo "</a>";
					echo "<ul class=\"dropdown-menu\"><li class=\"header\"> You have ".$result->num_rows." Requests </li>
						<li>";
						
					echo "<!-- inner menu: contains the actual data -->
						<ul class=\"menu\">";
				    
					if ($result->num_rows > 0) {
						// output data of each row
						while($row = $result->fetch_assoc()) {
	//****************************************************************************************************************************************************
//
//													Accept and reject buttons for group join request
//
//**************************************************************************************************************************************************** -->
     					
						  echo "<li><!-- Task item -->
		
								
								".$row["studentName"]."
								(".$row["studentCMS"].")
								<div class=\"btn-group btn-group-justified\" role=\"group\">
									<form class=\"btn-group btn-group-justified\" id=\"Accept\" action=\"requestsMenu.php\" method=\"post\">
										<button class=\"btn btn-default btn-xs\" href=\"javascript:;\" ><div class=\"glyphicon glyphicon-ok\" >Accept</div></button>
										<input type=\"hidden\" name=\"Accept\" value=\"".$row["studentId"]."\"/>
									</form>
									<form class=\"btn-group btn-group-justified\" id=\"Reject\" action=\"requestsMenu.php\" method=\"post\">
										<button class=\"btn btn-default btn-xs\" href=\"javascript:;\" ><div class=\"glyphicon glyphicon-remove\" >Reject</div></button>
										<input type=\"hidden\" name=\"Reject\" value=\"".$row["studentId"]."\"/>
									</form>
								</div>
						  </li>";
						
						}
						
					}
					$conn->close();
				}
			}
			else{
                    if ($conn->connect_error) {
					die("Connection failed: " . $conn->connect_error);
					}
					else{
                                $facId=$_SESSION['facultyId'];
                                $supervisorId=0;
                                $GroupId=0;
                                $sql3= "SELECT * FROM faculty_student_request WHERE facultyId = '$facId'";
                                
                                $result=$conn->query($sql3);
                                            if($result->num_rows >= 0) {
												
													
													if($result->num_rows>0)
													{
														echo "<span class=\"label label-danger\">".$result->num_rows."</span>";
													}	
												
												
                                                echo "</a>
                                                    <ul class=\"dropdown-menu\"><li class=\"header\"> You have ".$result->num_rows." Request/s </li>
                                                    <li>
                                                    <!-- inner menu: contains the actual data -->
                                                    <ul class=\"menu\">";
                                                while($rows = $result->fetch_assoc()) {
                                                        $supervisorId=$rows["facultyId"];
                                                        $GroupId=$rows["groupId"];
                                                        $name="";
                                                        $sql4= "SELECT * FROM student WHERE groupId = '$GroupId' AND isLeader=1";
                                                        $result3=$conn->query($sql4);
                                                        if($result3->num_rows > 0) {
                                                           while($rowStu = $result3->fetch_assoc()) {
                                                               $name=$rowStu["studentName"];
                                                           } 
                                                        }
                                                        echo    "<li class=\"btn btn-app\"><!-- Task item -->
                                                            
                                                                 Group Id: <b>".$GroupId."</b><br/>
                                                                 Group Leader: <b>".$name."</b>
                                                                <div class=\"pull-right\">
                                                                <form class=\"\" id=\"AcceptGroup\" action=\"requestsMenu.php\" method=\"post\">
                                                                    <button class=\"btn btn-default btn-xs\" href=\"javascript:;\" ><div class=\"\" >Accept</div></button>
                                                                    <input type=\"hidden\" name=\"AcceptGroup\" value=\"".$GroupId."\"/>
                                                                </form>
                                                                </div>
                                                                <div class=\"pull-left\">
                                                                <form class=\"\" id=\"RejectGroup\" action=\"requestsMenu.php\" method=\"post\">
                                                                        <button class=\"btn btn-danger btn-xs\" href=\"javascript:;\" ><div class=\"\" >Reject</div></button>
                                                                        <input type=\"hidden\" name=\"RejectGroup\" value=\"".$GroupId."\"/>
                                                                </form>
                                                                </div>
                                                                </li>";
                                                    }?>
                                                    </ul>
                                                    </li>
                                                    
                                                  </ul><?php
                                                }
                                            }

                        }
                        

                                            
			
//****************************************************************************************************************************************************
//
//													End of group join requests
//
//**************************************************************************************************************************************************** -->
     
            ?>
                
