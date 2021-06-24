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

<title>마이 페이지</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/room.css" rel="stylesheet">

<script type="text/javascript">
    
	    function removeCheck() {
	
	    	 if (confirm("정말 탈퇴하시겠습니까?") == true){//확인
	
	    	     document.remove.action = "<%=cp%>/userDeleted.action";
	    	     document.remove.submit();
	
	    	 }else{//취소
	
	    	     return false;
	
	    	 }
	
	    }
    
    </script>

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
							<b>마이 페이지</b>
						</h1>
					</div>

					<div class="row">

						<div class="col-lg-6">

							<!-- Basic Card Example -->
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">내 정보</h6>
								</div>
								<div class="card-body">

									<div class="card shadow mb-4" align="center"
										style="display: block; padding-top: 1.5em;">
										<img
											src='<spring:url value="/image/${dto.ustoredFileName }"/>'
											width="300" height="300" /><br /> <br />
									</div>

									<div class="card border-left-primary shadow h-100 py-2">
										<div class="card-body">
											<div class="row no-gutters align-items-center">
												<div class="col mr-2">
													<div
														class="text-xs font-weight-bold text-primary text-uppercase mb-1">
														아이디</div>
													<div class="h5 mb-0 font-weight-bold text-gray-800">
														<h2>${dto.userId }</h2>
													</div>
												</div>
											</div>
										</div>
									</div>

									<br />

									<div class="card border-left-primary shadow h-100 py-2">
										<div class="card-body">
											<div class="row no-gutters align-items-center">
												<div class="col mr-2">
													<div
														class="text-xs font-weight-bold text-primary text-uppercase mb-1">
														이름</div>
													<div class="h5 mb-0 font-weight-bold text-gray-800">
														<h2>${dto.name }</h2>
													</div>
												</div>
											</div>
										</div>
									</div>

									<br />

									<div class="card border-left-primary shadow h-100 py-2">
										<div class="card-body">
											<div class="row no-gutters align-items-center">
												<div class="col mr-2">
													<div
														class="text-xs font-weight-bold text-primary text-uppercase mb-1">
														성별</div>
													<div class="h5 mb-0 font-weight-bold text-gray-800">
														<h2>
															<c:if test="${dto.gender == 1}">
																남
															</c:if>
															<c:if test="${dto.gender == 2}">
																여
															</c:if>
														</h2>
													</div>
												</div>
											</div>
										</div>
									</div>

									<br />

									<div class="card border-left-primary shadow h-100 py-2">
										<div class="card-body">
											<div class="row no-gutters align-items-center">
												<div class="col mr-2">
													<div
														class="text-xs font-weight-bold text-primary text-uppercase mb-1">
														Email 주소</div>
													<div class="h5 mb-0 font-weight-bold text-gray-800">
														<h2>${dto.email }</h2>
													</div>
												</div>
											</div>
										</div>
									</div>

									<br />

									<div class="card border-left-primary shadow h-100 py-2">
										<div class="card-body">
											<div class="row no-gutters align-items-center">
												<div class="col mr-2">
													<div
														class="text-xs font-weight-bold text-primary text-uppercase mb-1">
														휴대전화</div>
													<div class="h5 mb-0 font-weight-bold text-gray-800">
														<h2>${dto.tel }</h2>
													</div>
												</div>
											</div>
										</div>
									</div>

									<br />

									<div>
										<input type="button"
											class="btn btn-primary btn-user btn-block" value=" 회원정보 수정 "
											onclick="javascript:location.href='<%=cp%>/userUpdated.action';" />
									</div>

									<br />

									<div>
										<form action="" name="remove">
											<input type="button"
												class="btn btn-primary btn-user btn-block" value=" 회원 탈퇴하기 "
												onclick="removeCheck();" />
										</form>
									</div>

								</div>
							</div>

						</div>

						<div class="col-lg-6">

							<!-- Collapsable Card Example -->
							<div class="card shadow mb-4">
								<!-- Card Header - Accordion -->
								<a href="#collapseCardExample" class="d-block card-header py-3"
									data-toggle="collapse" role="button" aria-expanded="true"
									aria-controls="collapseCardExample">
									<h6 class="m-0 font-weight-bold text-primary">참여한 방 목록</h6>
								</a>
								<!-- Card Content - Collapse -->
								<div class="collapse show" id="collapseCardExample">
									<div class="card-body">
										This is a collapsable card example using Bootstrap's built in
										collapse functionality. <strong>Click on the card
											header</strong> to see the card body collapse and expand!
									</div>
								</div>
							</div>

							<!-- Collapsable Card Example -->
							<div class="card shadow mb-4">
								<!-- Card Header - Accordion -->
								<a href="#collapseCardExample" class="d-block card-header py-3"
									data-toggle="collapse" role="button" aria-expanded="true"
									aria-controls="collapseCardExample">
									<h6 class="m-0 font-weight-bold text-primary">관리하는 방 목록</h6>
								</a>
								<!-- Card Content - Collapse -->
								<div class="collapse show" id="collapseCardExample">
									<div class="card-body">
										This is a collapsable card example using Bootstrap's built in
										collapse functionality. <strong>Click on the card
											header</strong> to see the card body collapse and expand!
									</div>
								</div>
							</div>

							<!-- Collapsable Card Example -->
							<div class="card shadow mb-4">
								<!-- Card Header - Accordion -->
								<a href="#collapseCardExample" class="d-block card-header py-3"
									data-toggle="collapse" role="button" aria-expanded="true"
									aria-controls="collapseCardExample">
									<h6 class="m-0 font-weight-bold text-primary">방 신청 목록</h6>
								</a>
								<!-- Card Content - Collapse -->
								<div class="collapse show" id="collapseCardExample">
									<div class="card-body">
										This is a collapsable card example using Bootstrap's built in
										collapse functionality. <strong>Click on the card
											header</strong> to see the card body collapse and expand!
									</div>
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
					<span>Copyright &copy; Your Website 2020</span>
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



	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

</body>
</html>