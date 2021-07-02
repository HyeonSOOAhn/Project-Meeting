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
<title>Insert title here</title>

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/room.css" rel="stylesheet">
<link href="css/requestMsgModal.css" rel="stylesheet">


<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">


<style type="text/css">

@font-face {
    font-family: 'Y_Spotlight';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/Y_Spotlight.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

.main-first input[id*="slide"] {
	display: none;
}

.main-first .slidewrap {
	max-width: 1440px;
	margin: 0; auto;
	overflow: hidden;
}

.main-first .slidelist {
	white-space: nowrap;
	font-size: 0;
}

.main-first .slidelist>li {
	display: inline-block;
	vertical-align: middle;
	width: 100%;
	transition: all .5s;
}

.main-first .slidelist>li>a {
	display: block;
	position: relative;
}

.main-first .slidelist>li>a img {
	width: 100%;
}

.hwasal {
	max-width: 45px;
	max-height: 45px;
	border-radius: 4px;
}

.main-first .slidelist label {
	position: absolute;
	z-index: 10;
	top: 50%;
	transform: translateY(-50%);
	padding: 50px;
	cursor: pointer;
}

.main-first .slidelist .left {
	left: 30px;
	background: url('/study/myProtein/image/slide-left.png') center center/100%
		no-repeat
}

.main-first .slidelist .right {
	right: 30px;
	background: url('/study/myProtein/image/slide-right.png') center center/100%
		no-repeat
}

.main-first input[id="slide01"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(0%);
}

.main-first input[id="slide02"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(-100%);
}

.main-first input[id="slide03"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(-200%);
}

.carouselImg {
	width: 100%;
	height: 80%;
}

.img1 {
	position: relative;
	background-image: url(img/study.jpg);
	height: 100vh;
	background-size: cover;
}
.img1:hover .img-cover1{
	position: absolute;
	height: 100%;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.7);
	z-index: 1;
}
.img1:hover .content1{
	display: block;
}

.img1 .content1 {
	display:none;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 5rem;
	color: white;
	z-index: 2;
	text-align: center;
}
.img2 {
	position: relative;
	background-image: url(img/restaurant.jpg);
	height: 100vh;
	background-size: cover;
}

.img2:hover .img-cover2{
	position: absolute;
	height: 100%;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.7);
	z-index: 1;
}
.img2:hover .content2{
	display: block;
}

.img2 .content2 {
	display:none;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 5rem;
	color: white;
	z-index: 2;
	text-align: center;
}
.img3 {
	position: relative;
	background-image: url(img/travel.jpg);
	height: 100vh;
	background-size: cover;
}

.img3:hover .img-cover3{
	position: absolute;
	height: 100%;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.7);
	z-index: 1;
}
.img3:hover .content3{
	display: block;
}

.img3 .content3 {
	display:none;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 5rem;
	color: white;
	z-index: 2;
	text-align: center;
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
                	<div class="main-first" style="width: 100% ; height: 70%">
	                	<input type="radio" name="slide" id="slide01" checked>
						<input type="radio" name="slide" id="slide02">
						<input type="radio" name="slide" id="slide03">
						<div class="slidewrap">
							<ul class="slidelist">
								<li>
									<label for="slide03" class="left">
										<img class="hwasal" src="img/slide-left.png">
									</label> 
									<div class="img1">
										<div class="content1">
											<h3 style="font-family: 'Y_Spotlight';" >혼자하는 공부가 지겹다면..</h3>
											<h1 style="font-family: 'Y_Spotlight';">방팅에서 만나봐!</h1>
										</div>
										<div class="img-cover1"></div>
									</div> 
									<label for="slide02" class="right">
										<img class="hwasal"src="img/slide-right.png">
									</label>
								</li>
								<li>
									<label for="slide01" class="left">
										<img class="hwasal" src="img/slide-left.png">
									</label> 
									<div class="img2">
										<div class="content2">
											<h3 style="font-family: 'Y_Spotlight';">혼자 먹는 밥 지겹다면..</h3>
											<h1 style="font-family: 'Y_Spotlight';">방팅에서 만나봐!</h1>
										</div>
										<div class="img-cover2"></div>
									</div> 
									<label for="slide03" class="right">
										<img class="hwasal" src="img/slide-right.png">
									</label>
								</li>
								<li>
									<label for="slide02" class="left">
										<img class="hwasal"src="img/slide-left.png">
									</label>
									<div class="img3">
										<div class="content3">
											<h3 style="font-family: 'Y_Spotlight';">여기는 혼자가기 좀..</h3>
											<h3 style="font-family: 'Y_Spotlight';">동행이 필요하다면</h3>
											<h1 style="font-family: 'Y_Spotlight';">방팅에서 만나봐!</h1>
										</div>
										<div class="img-cover3"></div>
									</div> 
									<label for="slide01" class="right">
										<img class="hwasal" src="img/slide-right.png">
									</label>
								</li>
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
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>


    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	
    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>


</body>
</html>