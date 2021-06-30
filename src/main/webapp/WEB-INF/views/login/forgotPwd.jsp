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

<title>SB Admin 2 - Forgot Password</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<style type="text/css">
/*ERROR MESSAGE*/
.errorMessage {
	color: #D63727;
	font-weight: 700;
}

.hide {
	display: none;
}

.show {
	display: block;
}
</style>

</head>

<body class="bg-gradient-primary">
	<c:choose>
		<c:when test="${!empty requestScope.sendedEmail}">
			<div class="container">

				<!-- Outer Row -->
				<div class="row justify-content-center">

					<div class="col-xl-10 col-lg-12 col-md-9">

						<div class="card o-hidden border-0 shadow-lg my-5">
							<div class="card-body p-0">
								<!-- Nested Row within Card Body -->
								<div class="row">
									<div class="p-5">${sendedEmail}</div>
								</div>
							</div>
						</div>

					</div>

				</div>

			</div>

		</c:when>
		<c:when test="${!empty requestScope.resetPwd}">
			<div class="container">

				<!-- Outer Row -->
				<div class="row justify-content-center">

					<div class="col-xl-10 col-lg-12 col-md-9">

						<div class="card o-hidden border-0 shadow-lg my-5">
							<div class="card-body p-0">
								<!-- Nested Row within Card Body -->
								<div class="row">
									<div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
									<div class="col-lg-6">
										<div class="p-5">

											<form name="myForm" action="resetPwd_ok.action" method="post"
												class="user">

												<div class="form-group">
													<span class="errorMessage passwordCon hide"></span>
												</div>


												<div class="form-group">

													<input type="password" name="userPwd"
														class="form-control form-control-user btn-active"
														id="InputPassword" placeholder="비밀번호">

												</div>
												<div class="form-group">

													<input type="password" name="userPwdCon"
														class="form-control form-control-user btn-active"
														id="RepeatPassword" placeholder="비밀번호 확인">

												</div>
												<input type="hidden" name="email" value="${email}">
												<input type="submit" value="비밀번호 변경" disabled="disabled"
													class="resetBtn btn btn-primary btn-user btn-block" />


											</form>
											<!-- checkPwd -->
											<script src="js/forgotPwd.js"></script>

										</div>
									</div>
								</div>
							</div>
						</div>

					</div>

				</div>

			</div>

		</c:when>

		<c:otherwise>

			<div class="container">

				<!-- Outer Row -->
				<div class="row justify-content-center">

					<div class="col-xl-10 col-lg-12 col-md-9">

						<div class="card o-hidden border-0 shadow-lg my-5">
							<div class="card-body p-0">
								<!-- Nested Row within Card Body -->
								<div class="row">
									<div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
									<div class="col-lg-6">
										<div class="p-5">
											<div class="text-center">
												<h1 class="h4 text-gray-900 mb-2">비밀번호가 기억나지 않으세요?</h1>
												<p class="mb-4">본인의 이메일을 적으시면 도와드릴게요!</p>
											</div>
											<form name="myForm" method="post"
												action="forgotPwd_ok.action" class="user">

												<c:choose>
													<c:when test="${!empty requestScope.noExistEmail}">
														<div class="form-group">
															<p class="mb-4" style="color: #D63727;">${noExistEmail}</p>
														</div>
													</c:when>
												</c:choose>

												<div class="form-group">
													<input type="text" name="email"
														class="form-control form-control-user" id="InputEmail"
														aria-describedby="emailHelp"
														placeholder="Enter Email Address...">
												</div>
												<input type="submit" value="입력"
													class="btn btn-primary btn-user btn-block" />


											</form>
											<hr>
											<div class="text-center">
												<a class="small" href="register.action">Create an
													Account!</a>
											</div>
											<div class="text-center">
												<a class="small" href="login.action">Already have an
													account? Login!</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>

				</div>

			</div>
		</c:otherwise>

	</c:choose>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>




</body>

</html>