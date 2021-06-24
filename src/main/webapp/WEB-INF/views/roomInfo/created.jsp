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
		<title>게시물 생성</title>
		
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
	        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
	            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=cp%>/room.action">
	                <div class="sidebar-brand-icon rotate-n-15">
	                    <i class="fas fa-laugh-wink"></i>
	                </div>
	                
	                <div class="sidebar-brand-text mx-3">방이름</div>
	            </a>
	            
	            <hr class="sidebar-divider my-0">
	
	            <!-- 메인화면이랑 연결하는 위치 -->
	            <li class="nav-item">
	                <a class="nav-link" href="<%=cp%>/roomInfoMain.action">
	                    <i class="fas fa-fw fa-tachometer-alt"></i>
	                    <span>메인화면</span></a>
	            </li>
	            
	            <hr class="sidebar-divider">
	            
	            <div class="sidebar-heading">
	                게시물
	            </div>
	            
	            <li class="nav-item">
	            	<div class="nav-link collapsed" data-toggle="collapse" href="#" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
	            		<i class="fas fa-fw fa-wrench"></i>
	            		<span>게시물 보기</span>
	            	</div>
	                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
	                	data-parent="#accordionSidebar">
	                    <div class="bg-white py-2 collapse-inner rounded">
	                        <h6 class="collapse-header" id="test">종류:</h6>
	                        <a class="collapse-item" href="<%=cp%>/rroom.action">전체보기</a>
	                        <a class="collapse-item" href="<%=cp%>/rnotice.action">공지</a>
	                        <a class="collapse-item" href="<%=cp%>/rschedule.action">일정</a>
	                        <a class="collapse-item" href="<%=cp%>/rvote.action">투표</a>
	                    </div>
	                </div>
	            </li>
	        </ul>
	        
	        <!-- 상단 var -->
	        <div id="content-wrapper" class="d-flex flex-column">
	            <div id="content">
	                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
	                    <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
	                        <div class="input-group">
	                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
	                            <div class="input-group-append">
	                                <button class="btn btn-primary" type="button">
	                                    <i class="fas fa-search fa-sm"></i>
	                                </button>
	                            </div>
	                        </div>
	                    </form>
	                    
	                    <ul class="navbar-nav ml-auto">
	                    	<!-- 우측상단 유저정보 -->
	                        <li class="nav-item dropdown no-arrow">
	                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">사용자 명</span>
	                                <img class="img-profile rounded-circle" src="img/undraw_profile.svg">
	                            </a>
	                            <!-- Dropdown - User Information -->
	                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
	                                aria-labelledby="userDropdown">
	                                <a class="dropdown-item" href="#">
	                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
	                                    내정보
	                                </a>
	                                <a class="dropdown-item" href="#">
	                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
	                                    설정
	                                </a>
	                                <a class="dropdown-item" href="#">
	                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
	                                    활동내역
	                                </a>
	                                <div class="dropdown-divider"></div>
	                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
	                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
	                                    로그아웃
	                                </a>
	                            </div>
	                        </li>
	                    </ul>
	                </nav>
	                
	                <!-- 내용 -->
	                <div class="container-fluid">
	                    <div>
							<div>
								구분 : 
								<input type="radio" name="sortBoard" value="notice" checked="checked"/>공지
								<input type="radio" name="sortBoard" value="schedule"/>일정
								<input type="radio" name="sortBoard" value="vote"/>투표
							</div>
							
							<form action="<%=cp%>/rcreated_ok.action" method="post">
								<div id="loadHtml"></div>
								
								<div id="footer">
									<%-- <input type="hidden" value="${roomNum}" name="roomNum"/> --%>
									<input type="submit" value=" 등록 " class="btn2"/>
									<input type="button" value=" 취소 " class="btn2" onclick="location.href='<%=cp%>/room.action';"/>
								</div>
							</form>
						</div>
	                </div>
	            </div>
	            
	            <footer class="sticky-footer bg-white">
	                <div class="container my-auto">
	                    <div class="copyright text-center my-auto">
	                        <span>Copyright &copy; Final Web Project</span>
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
	                <div class="modal-body">로그아웃을 하시겠습니까?</div>
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
	    
	    <script type="text/javascript">
		    $(function() {
				
		    	loadHtml = document.querySelector("#loadHtml");
		    	$("#loadHtml").load("rnotice.action");
		    	
		    	$(':radio[name=sortBoard]').change(function() {
		    		
		    		var check = $(':radio[name=sortBoard]:checked').val();
		    		
		    		if(check == "notice") {
		    			
		    			$("#loadHtml").load("rnotice.action");
		    		} else if(check == "schedule") {
		    			
		    			$("#loadHtml").load("rschedule.action");
		    		} else if(check == "vote") {
		    			
		    			$("#loadHtml").load("rvote.action");
		    		}
		    	});
		    });
	    </script>
	</body>
</html>