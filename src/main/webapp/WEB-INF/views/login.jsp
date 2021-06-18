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

<title>Login</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link href="css/login.css" rel="stylesheet">

<script type="text/javascript">

	
	function sendIt() {
		
		var f = document.myForm;
		
		f.action = "<%=cp%>/login_ok.action";
		f.submit();
		
	}




</script>

</head>

<body class="bg-gradient-primary">

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
									</div>
									<form name="myForm" method="post" class="user">

										<c:choose>
											<c:when test="${!empty requestScope.noExistInfo}">
												<div class="form-group">
													<span class="errorMessage">${noExistInfo}</span>
												</div>
											</c:when>
										</c:choose>

										<div class="form-group">
											<input type="text" class="form-control form-control-user"
												id="InputEmail" name="userId" aria-describedby="emailHelp"
												placeholder="이메일 or 아이디">
										</div>
										
										<div class="form-group">
											<input type="password" name="userPwd" class="form-control form-control-user"
												id="InputPassword" placeholder="비밀번호">
										</div>
										<div class="form-group">
											<div class="custom-control custom-checkbox small">
												<input type="checkbox" class="custom-control-input"
													id="customCheck" name="rememberBtn"> <label
													class="custom-control-label" for="customCheck">자동로그인</label>
											</div>
										</div>
										
										<input type="button" value="로그인" class="btn btn-primary btn-user btn-block" \
											onclick="sendIt();"/>
										<hr>
										
									</form>
									<hr>
									<div class="text-center">
										<a class="small" href="forgotPwd.action">비밀번호가 기억나지 않으세요?</a>
									</div>
									<div class="text-center">
										<a class="small" href="register.action">회원가입</a>
									</div>
								</div>
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

</body>

</html>