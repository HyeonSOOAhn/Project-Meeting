<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Ting 만들기</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/room.css" rel="stylesheet">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript" src="/meeting/resources/js/util.js"></script>
<script type="text/javascript">
    
	function sendIt() {
		
		f = document.myForm;
		
		
		str = f.title.value;
		str = str.trim();
		if(!str) {
			alert("\nTing 제목을 입력하세요!");
			f.title.focus();
			return;
		}
		f.title.value = str;
		
		
		str = f.content.value;
		str = str.trim();
		if(!str) {
			alert("\nTing 소개를 입력하세요!");
			f.content.focus();
			return;
		}
		f.content.value = str;
		
		
		//가상경로
		f.action = "<%=cp%>/tcreated_ok.action?roomNum=" + ${roomNum};
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
					<div class="col-lg-5 d-none d-lg-block bg-teeing-image"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">
									<b>Ting 만들기</b>
								</h1>
							</div>
							<form action="" name="myForm" class="user" method="post">
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
									<%-- 
										작성자 정보<br/>
										ID : ${userId}<br/>
										이름 : ${name}<br/>
										E-Mail : ${email}<br/>
										<img src='<spring:url value="/image/${ustoredFileName }"/>' width="300" height="300"/>
									 --%>
									</div>
									
								</div>
								<div class="form-group">
									<input name="title" type="text"
										class="form-control form-control-user" id="exampleInputEmail"
										placeholder="Ting 제목"/>
								</div>

								<div>
									<textarea name="content" rows="12" cols="63"
										placeholder="Ting을 소개해주세요."
										class="form-control"></textarea>
								</div>
								
								<br/>
								
								<div class="form-group">
									<input name="when" type="text"
										class="form-control form-control-user" id="exampleInputEmail"
										placeholder="일시 (0000-00-00)"/>
								</div>
								
								<div class="form-group">
									<input name="place" type="text"
										class="form-control form-control-user" id="exampleInputEmail"
										placeholder="장소"/>
								</div>
								
								<div class="form-group">
									<input name="inwon" type="text"
										class="form-control form-control-user" id="exampleInputEmail"
										placeholder="추천 인원 (5인 이상은 좀..)"/>
								</div>
								
								<input type="hidden" name="roomNum" value="${roomNum}"/>
								<input type="hidden" name="userId" value="${userId}"/>
								<input type="hidden" name="name" value="${name}"/>
								<input type="hidden" name="email" value="${email}"/>
								<input type="hidden" name="ustoredFileName" value="${ustoredFileName}"/>

								<input type="button" class="btn btn-primary btn-user btn-block" value="생 성 하 기" onclick="sendIt();"/>

							</form>
							<hr>
							<!-- <div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div> -->
							<div class="text-center">
								<a class="small" href="<%=cp%>/tmain.action?roomNum=${roomNum}">Ting 목록으로 돌아가기</a>
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