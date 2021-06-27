
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

<title>여행 방 목록</title>

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/room.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

<script type="text/javascript">

		function sendIt() {
			
			var f = document.searchForm;
			
			f.action = "<%=cp%>/travelList.action";
			f.submit();
			
		}

	</script>

<style>
div.ok {
	width: 100%;
	height: 200px;
}

div.left {
	width: 70%;
	float: left;
	box-sizing: border-box;
}

div.right {
	width: 30%;
	float: right;
	box-sizing: border-box;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>


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

					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<div>
							<h1 class="h3 mb-2 text-gray-800">
								<b>여행 방 목록</b>
							</h1>
							<p class="mb-4">여행 떠나실 준비 되셨나요? 마음이 맞는 사람들과 행복한 동행의 시작.</p>
						</div>
						<c:if test="${!empty sessionScope.userInfo.userId }">
							<a href="<%=cp%>/travelCreated.action"
								class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
								class="fas fa-download fa-sm text-white-50"></i> 여행 방 만들기</a>
						</c:if>
						<c:if test="${empty sessionScope.userInfo.userId }">
							<p
								style="font-style: oblique; font-weight: bold; font-size: 15px; color: #4D71DB;">로그인을
								하셔야 여행 방 만들기가 가능합니다.</p>
						</c:if>
					</div>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">

						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary"
								style="display: inline;">여행 방</h6>

							<br /> <br />

							<div>
								<form action="" name="searchForm" method="post">
									<select name="searchKey"
										class="custom-select custom-select-sm form-control form-control-sm"
										style="width: 10%; display: inline;">
										<option value="title">방 이름</option>
										<option value="keyword">키워드</option>
									</select> <input type="text" name="searchValue"
										class="form-control form-control-sm"
										style="width: 20%; display: inline;" /> <input type="button"
										value=" 검 색 " class="btn btn-primary btn-user btn-block"
										onclick="sendIt()" style="width: 10%; display: inline;" />
								</form>
								<br />
							</div>

							<c:forEach var="dto" items="${lists }">
								<div class="card-header py-3 card shadow mb-4">
									<div class="ok">
										<div class="left">
											<u>${dto.subject }</u><br />
											<h2>
												<a href="${articleUrl }&roomNum=${dto.roomNum}">${dto.title }</a>
											</h2>
											<br /> ${dto.keyword }<br /> 창설일 : ${dto.created }&nbsp;&nbsp;&nbsp;&nbsp;참가자
											: ${dto.currentP } / ${dto.totalP } 명
										</div>
										<div class="right">
											<img
												src='<spring:url value="/upload/${dto.storedFileName }"/>'
												width="200" height="200" />
										</div>
									</div>
								</div>
							</c:forEach>
						</div>

						<div class="dataTables_paginate paging_simple_numbers"
							id="dataTable_paginate" align="center">

							<ul class="pagination">

								<c:if test="${dataCount!=0 }">
									${pageIndexList }
								</c:if>
								<c:if test="${dataCount==0 }">
									등록된 게시물이 없습니다.
								</c:if>

							</ul>

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

	<!-- Page level plugins -->
	<script src="vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/datatables-demo.js"></script>

</body>
</html>