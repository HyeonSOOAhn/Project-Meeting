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

<title>방 정보</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/room.css" rel="stylesheet">

<style type="text/css">
h2 {
	font: italic bold 3em/1em Georgia, serif;
	color: #4D71DB;
	display: inline;
}

h1 {
	font: italic bold 3em/1em Georgia, serif;
	background-color: #C0C0C0;
	color: #000000;
	display: inline;
}

p {
	font: italic bold 1em/1em Georgia, serif;
	background-color: #C0C0C0;
	color: #000000;
	display: inline;
}
</style>

</head>

<body class="bg-gradient-primary">

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">

					<!-- url('${pageContext.request.contextPath}/resources/upload/${dto.storedFileName }'); -->
					<div class="card-body p-0" align="left"
						style="background-size: 920px 900px;background-image: url('<spring:url value="/upload/${dto.storedFileName }"/>');">

						<br /><br /><br /><br /><br />
						<br /><br /><br /><br /><br />
						<br /><br /><br /><br /><br />
						

						<div class="p-5">
							<div>
								<h2>${dto.subject}</h2>
								<br />
								<br />
								<h1>${dto.title }</h1>
								<br />
								<br />
							</div>

							<div class="form-group">
								<p>${dto.keyword }</p>
								<br />
							</div>

							<div class="form-group">
								<p>${dto.introduce }</p>
								<br />
							</div>

							<div class="form-group">
								<p>창설일 : ${dto.created }&nbsp;&nbsp;&nbsp;&nbsp;참가자 :
									${dto.currentP } / ${dto.totalP } 명</p>
								<br />
							</div>

							<div class="form-group">

								<p>방장 : ${dto.manager }</p>
								<br />
							</div>

							<div class="form-group">
								<!-- 마이룸 테이블의 member 가져오기 : dto.manager || dto.member -->
								<c:if test="${sessionScope.userInfo.userId != dto.manager}">
									<a href="requestMsg.action?roomNum=${dto.roomNum}"
										class="btn btn-primary btn-user btn-block"> 방 참여 신청하기 </a>

								</c:if>
								<!-- 마이룸 테이블의 member 가져오기 : dto.manager && dto.member -->

								<c:if test="${sessionScope.userInfo.userId == dto.manager}">
									<a href="#" class="btn btn-primary btn-user btn-block"> 방
										참가하기 </a>
								</c:if>
							</div>


							<hr>
							<div class="text-center">
								<a class="small" href="<%=cp%>/list.action?${params }">전체 방
									목록으로 돌아가기</a>
							</div>
							<div>
								<input type="button" value=" 수정 " class="btn2"
									onclick="javascript:location.href='<%=cp%>/updated.action?roomNum=${dto.roomNum }&${params }';" />
								<input type="button" value=" 삭제 " class="btn2"
									onclick="javascript:location.href='<%=cp%>/deleted.action?roomNum=${dto.roomNum }&${params }';" />
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