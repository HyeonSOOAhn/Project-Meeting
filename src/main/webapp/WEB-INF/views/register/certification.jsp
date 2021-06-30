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
												<h1 class="h4 text-gray-900 mb-2">메일을 보냈습니다!!</h1>
												<p class="mb-4">적혀있는 문자를 정확히 입력해주세요</p>
											</div>
											

												<div class="form-group">
													<form name="ohMyGod" method="POST">
														<input type="text" name="randomText"
															class="form-control form-control-user" id="randomText">
														<input type="hidden" class="checkEmailText" value="${randomStr}">
													</form>
												</div>
												<div class="row">
													<div class="col-sm-8" style="padding: 0; padding-right: 5px;">
														<input type="button" value="입력" onclick="checkEmail();"
														class="btn btn-primary btn-user btn-block" />
													</div>
													<div class="col-sm-4" style="padding: 0;">
														<a class="btn btn-danger btn-user btn-block" onclick="certification.action">다시보내기</a>
													</div>
												</div>

											
											
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>

				</div>

			</div>
			
	<script type="text/javascript">
		function checkEmail() {
			const f = document.ohMyGod,
				text = f.querySelector("#randomText"),
				checkText = f.querySelector(".checkEmailText");

			if(text.value !== checkText.value){
				alert("문자가 다릅니다!!");
				return;
			}
			
			$.ajax({
				url: "certification_ok.action",
				type:"POST",
				data:"",
				success:function(){
					alert("인증이 완료되었습니다!");
					window.location.href = "<%=cp%>/myPage.action";
				}
			});
		}
	
	
	</script>


	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>




</body>

</html>