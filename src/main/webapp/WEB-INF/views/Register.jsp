<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Register</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link href="css/register.css" rel="stylesheet">


<script type="text/javascript">

function sendIt() {
	
	var f = document.myForm;
	
	//값들이 형식에 맞는지 구현 (이거 spring에 있나?)
	
	
	
	f.action = "<%=cp%>/register_ok.action";
	f.submit();
	
}




</script>

</head>

<body class="bg-gradient-primary">

	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
							</div>
							<form name="myForm" class="user" method="post">
							
								<div class="form-group">
									<span class="errorMessage nameCon hide"></span>
								</div>
								
								<div class="form-group row">
									<div class="col-sm-8">
										<input type="text" name="userName" class="form-control form-control-user"
											id="userName" placeholder="이름">
									</div>
									
										<div class="col-sm-4 " style="vertical-align: middle; text-align: left;">
											<input type="radio" id="man" value=1 name=gender style="display:none ;">
											<label for="man" class="genderLabel"><span>남</span></label>
											<input type="radio" id="woman" value=0 name="gender" style="display:none";>
											<label for="woman" class="genderLabel"><span>여</span></label>
										</div>
									
								</div>
								
								<c:choose>
									<c:when test="${!empty requestScope.existId}">
										<div class="form-group">
											<span class="errorMessage">${existId}</span>
										</div>
									</c:when>
								</c:choose>
								
								<div class="form-group">
									<span class="errorMessage idCon hide"></span>
								</div>
								
								<div class="form-group row">
									<div class="col-sm-8">
										<input type="text" name="userId" class="form-control form-control-user"
											id="userId" placeholder="아이디">
									</div>
								</div>
								
								<c:choose>
									<c:when test="${!empty requestScope.existEmail}">
										<div class="form-group">
											<span class="errorMessage">${existEmail}</span>
										</div>
									</c:when>
								</c:choose>
								
								<div class="form-group">
									<span class="errorMessage emailCon hide">이메일 형식에 맞게 입력해주세요.</span>
								</div>
								
								<div class="form-group">
									<input type="email" name="email" class="form-control form-control-user"
										id="InputEmail" placeholder="이메일">
								</div>
								
								
								<div class="form-group">
									<span class="errorMessage passwordCon hide"></span>
								</div>
								
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="password" name="userPwd" class="form-control form-control-user"
											id="InputPassword" placeholder="비밀번호">
									</div>
									<div class="col-sm-6">
										<input type="password" name="userPwdCon" class="form-control form-control-user"
											id="RepeatPassword" placeholder="비밀번호 확인">
									</div>
								</div>
								
								<div class="form-group">
									<span class="errorMessage telCon hide">["-","."]등 이 없이 입력해주세요.</span>
								</div>
								
								<div class="form-group">
									<input type="text" name="tel" class="form-control form-control-user"
										id="tel" placeholder="전화번호">
								</div>
								
								
								<input type="button" value="Register Account" disabled="disabled" class="btn btn-primary btn-user btn-block" \
									onclick="sendIt();"/>
								<hr>
								
							</form>
							<hr>
							<div class="text-center">
								<a class="small" href="forgot-password.html">Forgot
									Password?</a>
							</div>
							<div class="text-center">
								<a class="small" href="login.html">Already have an account?
									Login!</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>
	
	<!-- confirm -->
	<script src="js/register.js"></script>

</body>

</html>