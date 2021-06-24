<<<<<<< HEAD
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>방 카테고리</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/room.css" rel="stylesheet">

<style type="text/css">
button {
	padding: 10px;
	width: 100%;
	height: 100%;
}

font {
	font-family: Times New Roman;
	font-weight: bold;
	font-size: 20px;
	color: #4D71DB;
}

p {
	font-style: oblique;
	font-weight: bold;
	font-size: 15px;
	color: #4D71DB;
}
</style>

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- SIDE BAR -->
		<jsp:include page="/WEB-INF/views/sidebar.jsp"></jsp:include>



		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- TOP BAR -->
				<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">
							<b>방 카테고리</b>
						</h1>
						<c:if test="${!empty sessionScope.userInfo.userId }">
							<a href="<%=cp%>/created.action"
								class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
								class="fas fa-download fa-sm text-white-50"></i> 방 만들기</a>
						</c:if>
						<c:if test="${empty sessionScope.userInfo.userId }">
							<p>로그인을 하셔야 방 만들기가 가능합니다.</p>
						</c:if>
					</div>

					<!-- Content Row class="row" -->
					<div class="">

						<!-- Content Column - class="col-lg-6 mb-4" -->
						<div class="">

							<!-- Color System -->
							<div class="row">
								<div class="col-lg-6 mb-4">
									<button class="card bg-primary text-white shadow"
										" onclick="javascript:location.href='<%=cp%>/travelList.action'">
										<div class="card-body" align="left">
											여 행
											<div class="text-white-50 small">여행 떠나실 준비 되셨나요? 마음이 맞는
												사람들과 행복한 동행의 시작.</div>
										</div>
									</button>
								</div>
								<div class="col-lg-6 mb-4">
									<button class="card bg-success text-white shadow"
										" onclick="javascript:location.href='<%=cp%>/travelList.action'">
										<div class="card-body" align="left">
											맛 집
											<div class="text-white-50 small">이제 혼밥은 그만. 음식 취향이 같은
												친구들과 함께 즐겨요!</div>
										</div>
									</button>
								</div>
								<div class="col-lg-6 mb-4">
									<button class="card bg-info text-white shadow"
										" onclick="javascript:location.href='<%=cp%>/travelList.action'">
										<div class="card-body" align="left">
											운 동
											<div class="text-white-50 small">여러가지 운동을 다양한 사람들과 함께
												즐겨봐요!</div>
										</div>
									</button>
								</div>
								<div class="col-lg-6 mb-4">
									<button class="card bg-info text-white shadow"
										" onclick="javascript:location.href='<%=cp%>/travelList.action'">
										<div class="card-body" align="left">
											공 부
											<div class="text-white-50 small">공부도 하고 지식도 나누고 미래도 함께
												준비해요!</div>
										</div>
									</button>
								</div>
								<div class="col-lg-6 mb-4">
									<button class="card bg-danger text-white shadow">
										<div class="card-body" align="left">
											Danger
											<div class="text-white-50 small">#e74a3b</div>
										</div>
									</button>
								</div>
								<div class="col-lg-6 mb-4">
									<button class="card bg-secondary text-white shadow">
										<div class="card-body">
											Secondary
											<div class="text-white-50 small">#858796</div>
										</div>
									</button>
								</div>
								<div class="col-lg-6 mb-4">
									<button class="card bg-light text-black shadow">
										<div class="card-body">
											Light
											<div class="text-black-50 small">#f8f9fc</div>
										</div>
									</button>
								</div>
								<div class="col-lg-6 mb-4">
									<button class="card bg-dark text-white shadow">
										<div class="card-body">
											Dark
											<div class="text-white-50 small">#5a5c69</div>
										</div>
									</button>
								</div>
							</div>

						</div>

					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
			<div class="container my-auto">
				<div class="copyright text-center my-auto">
					<span>Copyright &copy; Your Website 2021</span>
				</div>
			</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
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

	<!-- Page level plugins -->
	<script src="vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/chart-area-demo.js"></script>
	<script src="js/demo/chart-pie-demo.js"></script>

</body>
</html>
