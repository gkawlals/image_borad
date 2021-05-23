<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

				<form class="login100-form validate-form" action="/user/InsertUserInfo.do" method="post">
					<span class="login100-form-title">
						Circle SignUp
					</span>
															<!-- data-validate = 공백일때 경고문구를 보여주기  -->
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="user_id" placeholder="ID">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="user_pwd" placeholder="password">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					<!-- 비밀번호 확인 위의 text와 같지않다면 바로 경고문구 보여주기 -->
					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="user_pwd2" placeholder="password">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<script>
					
						$function(){
							$('#user_pwd').keyup(function(){
								$('font[name=check]').text('');
							});  // user_pwd.keyup
							
							$('#user_pwd2').keyup(function(){
								if($('#user_pwd').val() != $('$user_pwd2').val()){
									$('font[name=check]').text('');
									$('font[name=check]').html("암호 틀림");
								}else {
									$('font[name=check]').text('');
									$('font[name=check]').html("암호 맞음");
								}
							})
						}
					
					</script>
					
					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="text" name="user_name" placeholder="name">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="email" name="user_email" placeholder="email">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="container-login100-form-btn validate-input">
						<input type="submit" value="SignUp" class="login100-form-btn" />
				
					</div>

					<div class="text-center p-t-12" >
						<span class="txt1">
							Forgot
						</span>
						<button class="txt2" onclick="location.href='/user/FindPass.do'">
							Username / Password?
						</button>
					</div>

				</form>
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