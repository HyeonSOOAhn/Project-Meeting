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
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="">
	    <meta name="author" content="">
	
	    <title>프로젝트4 RoomInfo화면 테스트</title>
	
	    <!-- Custom fonts for this template -->
	    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	    <link
	        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	        rel="stylesheet">
	
	    <!-- Custom styles for this template -->
	    <link href="css/sb-admin-2.min.css" rel="stylesheet">
	
	    <!-- Custom styles for this page -->
	    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	</head>
	
	<body id="page-top">
	
	    <div id="wrapper">
	
	        <!-- Sidebar -->
	        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
	
	            <!-- Sidebar - Brand -->
	            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=cp%>/roomInfoMain.action">
	                <div class="sidebar-brand-icon rotate-n-15">
	                    <i class="fas fa-laugh-wink"></i>
	                </div>
	                <div class="sidebar-brand-text mx-3">프로젝트 <sup>4</sup></div>
	            </a>
	            
	            <hr class="sidebar-divider my-0">
	
	            <!-- 메인화면이랑 연결하는 위치 -->
	            <li class="nav-item">
	                <a class="nav-link" href="<%=cp%>/roomInfoMain.action">
	                    <i class="fas fa-fw fa-tachometer-alt"></i>
	                    <span>메인화면</span></a>
	            </li>
	            
	            <hr class="sidebar-divider">
	
	            <!-- Heading -->
	            <div class="sidebar-heading">
	                방
	            </div>
	
	            <!-- Nav Item - Pages Collapse Menu -->
	            <li class="nav-item">
	                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
	                    aria-expanded="true" aria-controls="collapseTwo">
	                    <i class="fas fa-fw fa-cog"></i>
	                    <span>Components</span>
	                </a>
	                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
	                    <div class="bg-white py-2 collapse-inner rounded">
	                        <h6 class="collapse-header">Custom Components:</h6>
	                        <a class="collapse-item" href="buttons.html">Buttons</a>
	                        <a class="collapse-item" href="cards.html">Cards</a>
	                    </div>
	                </div>
	            </li>
	            
	            <li class="nav-item">
	            	<div class="nav-link collapsed" data-toggle="collapse"
						href="#" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
	            		<i class="fas fa-fw fa-wrench"></i>
	            		<span onclick="javascript:location.href='<%=cp%>/room.action';" style="padding:5% 25%; border:1px solid black;">방 보기</span>
	            	</div>
	                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
	                    data-parent="#accordionSidebar">
	                    <div class="bg-white py-2 collapse-inner rounded">
	                        <h6 class="collapse-header">대분류:</h6>
	                        <a class="collapse-item" href="<%=cp%>/room.action">스터디</a>
	                        <a class="collapse-item" href="<%=cp%>/room.action">맛집</a>
	                        <a class="collapse-item" href="<%=cp%>/room.action">여행</a>
	                        <a class="collapse-item" href="<%=cp%>/room.action">소개팅</a>
	                    </div>
	                </div>
	            </li>
	        </ul>
	
	        <!-- Content Wrapper -->
	        <div id="content-wrapper" class="d-flex flex-column">
	
	            <!-- Main Content -->
	            <div id="content">
	
	                <!-- Topbar -->
	                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
	
	                    <!-- Sidebar Toggle (Topbar) -->
	                    <form class="form-inline">
	                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
	                            <i class="fa fa-bars"></i>
	                        </button>
	                    </form>
	
	                    <!-- Topbar Search -->
	                    <form
	                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
	                        <div class="input-group">
	                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
	                                aria-label="Search" aria-describedby="basic-addon2">
	                            <div class="input-group-append">
	                                <button class="btn btn-primary" type="button">
	                                    <i class="fas fa-search fa-sm"></i>
	                                </button>
	                            </div>
	                        </div>
	                    </form>
	
	                    <!-- Topbar Navbar -->
	                    <ul class="navbar-nav ml-auto">
	
	                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
	                        <li class="nav-item dropdown no-arrow d-sm-none">
	                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
	                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                <i class="fas fa-search fa-fw"></i>
	                            </a>
	                            <!-- Dropdown - Messages -->
	                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
	                                aria-labelledby="searchDropdown">
	                                <form class="form-inline mr-auto w-100 navbar-search">
	                                    <div class="input-group">
	                                        <input type="text" class="form-control bg-light border-0 small"
	                                            placeholder="Search for..." aria-label="Search"
	                                            aria-describedby="basic-addon2">
	                                        <div class="input-group-append">
	                                            <button class="btn btn-primary" type="button">
	                                                <i class="fas fa-search fa-sm"></i>
	                                            </button>
	                                        </div>
	                                    </div>
	                                </form>
	                            </div>
	                        </li>
	                        
	                        <div class="topbar-divider d-none d-sm-block"></div>
	
	                        <!-- 우측상단 유저정보 -->
	                        <li class="nav-item dropdown no-arrow">
	                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
	                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
	                                <img class="img-profile rounded-circle"
	                                    src="img/undraw_profile.svg">
	                            </a>
	                            <!-- Dropdown - User Information -->
	                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
	                                aria-labelledby="userDropdown">
	                                <a class="dropdown-item" href="#">
	                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
	                                    Profile
	                                </a>
	                                <a class="dropdown-item" href="#">
	                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
	                                    Settings
	                                </a>
	                                <a class="dropdown-item" href="#">
	                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
	                                    Activity Log
	                                </a>
	                                <div class="dropdown-divider"></div>
	                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
	                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
	                                    Logout
	                                </a>
	                            </div>
	                        </li>
	                    </ul>
	                </nav>
	                
	                <!-- 내용 -->
	                <div class="container-fluid">
	
	                    <!-- Page Heading -->
	                    <h1 class="h3 mb-2 text-gray-800">방이름</h1>
	                    <p class="mb-4">방 소개글</p>
	
	                    <!-- DataTales Example -->
	                    <div class="card shadow mb-4">
	                        <div class="card-header py-3">
	                            <h6 class="m-0 font-weight-bold text-primary">게시판</h6>
	                        </div>
	                        <div class="card-body">
	                            <div class="table-responsive"><!-- 여기에 Show랑 Search 들어가있음 -->
	                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                                	<!-- 정렬이 적용되고있음. 디폴트 적용을 날짜로 바꾸기 -->
	                                    <thead>
	                                        <tr>
	                                            <th>작성자</th>
	                                            <th>제목</th>
	                                            <th>내용</th>
	                                            <th>등록날짜</th>
	                                            <th>비고1</th>
	                                            <th>비고2</th>
	                                        </tr>
	                                    </thead>
	                                    
	                                    <!-- 이부분은 없어도 될듯 -->
	                                    <tfoot>
	                                        <tr>
	                                            <th>Name</th>
	                                            <th>Position</th>
	                                            <th>Office</th>
	                                            <th>Age</th>
	                                            <th>Start date</th>
	                                            <th>Salary</th>
	                                        </tr>
	                                    </tfoot>
	                                    
	                                    <!-- 데이터 불러와서 for문으로 입력하기 -->
	                                    <tbody>
	                                        <tr>
	                                            <td>Tiger Nixon</td>
	                                            <td>System Architect</td>
	                                            <td>Edinburgh</td>
	                                            <td>61</td>
	                                            <td>2011/04/25</td>
	                                            <td>$320,800</td>
	                                        </tr>
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            
	            <footer class="sticky-footer bg-white">
	                <div class="container my-auto">
	                    <div class="copyright text-center my-auto">
	                        <span>Copyright &copy; Your Website 2020</span>
	                    </div>
	                </div>
	            </footer>
	        </div>
	    </div>
	    
	    <!-- Scroll to Top Button -->
	    <a class="scroll-to-top rounded" href="#page-top">
	        <i class="fas fa-angle-up"></i>
	    </a>
	
	    <!-- Logout Modal -->
	    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	        aria-hidden="true">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
	                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">×</span>
	                    </button>
	                </div>
	                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
	                <div class="modal-footer">
	                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
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
	    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
	    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
	
	    <!-- Page level custom scripts -->
	    <script src="js/demo/datatables-demo.js"></script>
	</body>
</html>