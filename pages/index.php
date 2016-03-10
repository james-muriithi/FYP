<?php
	include("includes/includes.php");
?>
<script>
	$(document).ready(function() {
		$("#errlogin").hide();
		$("#signin").click(function() {
			var pass=document.getElementById("pas").value;
			
			var input=$("#usr");
			var re = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
			var is_email=re.test(input.val());
			if(is_email && pass!=""){
				input.removeClass("invalid").addClass("valid");
				window.location.href = 'includes/student.php';
			}
			else{
				$("#errlogin").fadeIn().slow();
				input.removeClass("valid").addClass("invalid");
			}		
		});
		
	});
	
</script>
</head>
	<body>
		<div id="loginPanel">
			<div class="panel panel-default">
			  <div class="panel-heading">Login</div>
			  <div class="panel-body">
				
				<span id="errlogin" hidden="true" class="label label-danger">Invalid Credentials</span>
				
				<div class="input-group" id="userNameLogin">
				  <span class="input-group-addon" id="basic-addon1">Login</span>
				  <input type="text" id="usr" class="form-control" name="userName" placeholder="Username" aria-describedby="basic-addon1">
				</div>
				
				<div class="input-group" id="userPassword">
				  <span class="input-group-addon" id="basic-addon1">Password</span>
				  <input type="password" id="pas" name="userPass" class="form-control" placeholder="Password" aria-describedby="basic-addon1">
				</div>
				
				<button id="signin" type="button" class="btn btn-default navbar-btn">Sign in</button>
				
			  </div>
			</div>
		</div>
		
	</body>
</html>