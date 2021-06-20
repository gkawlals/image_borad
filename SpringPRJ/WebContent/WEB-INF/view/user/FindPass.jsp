<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="poly.util.CmmUtil"%>
<html lang="en">
<head>
	<title>Login V1</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="../resourceLogin/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resourceLogin/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resourceLogin/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resourceLogin/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../resourceLogin/vendor/css-hamburgers/hamburgers.min.css">
<!--============================================== ===============================================-->
	<link rel="stylesheet" type="text/css" href="../resourceLogin/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resourceLogin/css/util.css">
	<link rel="stylesheet" type="text/css" href="../resourceLogin/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="../resourceLogin/images/img-01.png" alt="IMG" onclick="location.href='loginPage.do'">
				</div>

					<span class="login100-form-title">
						Circle Find Page
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="user_name" id="user_name" placeholder="user_name">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="user_mail" id="user_mail" placeholder="Email">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="container-login100-form-btn">
						<button class="login100-form-btn" onclick="Find()" >
							OK
						</button>
					</div>
					<div class="text-center p-t-136">
						<a class="txt2" href="/user/SignUp.do">
							Create your Account
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
						
						<script>
							
							function Find(){
								
								var user_name = document.getElementById('user_name').value;
								var user_mail = document.getElementById('user_mail').value;
								
								console.log(user_name);
								console.log(user_mail);
								
							$.ajax({
									url : "/user/getFindID.do",
									type : "post",
									data : {
										"user_name" : user_name,
										"user_mail" : user_mail
									},
									success : function(data){
										if(data == 1){
											
										}else{
											alert("가입된 정보가 없거나 입력하신 정보가 틀렸습니다.");
										}
									}
								}); 
								
							}
						</script>
					</div>
			</div>
		</div>
	</div>

<!--===============================================================================================-->	
	<script src="../resourceLogin/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../resourceLogin/vendor/bootstrap/js/popper.js"></script>
	<script src="../resourceLogin/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../resourceLogin/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="../resourceLogin/vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<!--===============================================================================================-->
	<script src="../resourceLogin/js/main.js"></script>
</body>
</html>