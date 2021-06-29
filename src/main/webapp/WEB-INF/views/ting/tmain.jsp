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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>${title }</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/room.css" rel="stylesheet">
    
    <!-- jQuery 1.12.4 -->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    
    <script type="text/javascript">

	    function sendIt() {
			
			var f = document.searchForm;
			
			f.action = "<%=cp%>/tmain.action?roomNum=" + ${roomNum};
			f.submit();
			
		}
		
		$(function() {
			
			listPage(1);
			
		});
		
		$(function() {
			
			$("#sendButton").click(function() {
				
				var params = "comments=" + $("#comments").val() + "&tingNum=" + $("#tingNum").val()
				+ "&tcuserId=" + $("#tcuserId").val() + "&tcname=" + $("#tcname").val();
				
				$.ajax({
					
					type:"POST",
					url:"<%=cp%>/comment.action?tingNum=" + ${tingNum},
					data:params,
					success:function(args) {
						
						$("#listData").html(args); //넘어온 데이터
						
						//출력 후 내용 비워주기
						$("#comments").val("");
						
					},
					beforeSend:showRequest,
					error:function(e) {
						alert(e.responseText);
					}
					
				});
				
			});
			
		});
		
		function showRequest() {
			
			//trim : 공백제거
			var comments = $.trim($("#comments").val());
			
			if(!comments) {
				alert("\n내용을 입력하세요!");
				$("#comments").focus();
				return false;
			}
			
			if(comments.length>500) {
				alert("\n내용은 500자까지만 가능합니다!");
				$("#comments").focus();
				return false;
			}
			
			return true; //중요
			
		}
		
		function listPage(page) {
			
			var url = "<%=cp%>/tclist.action?tingNum=" + ${tingNum};
			
			//전형적인 비동기방식
			//결과처리와 그에대한 함수도 같이 가지고 있다.
			$.post(url,{pageNum:page},function(args) {
				$("#listData").html(args);
			});
			
			$("#listData").show();
			
		}
		
		function deletePage(commentNum,page) {
			
			var url = "<%=cp%>/tcdeleted.action?tingNum=" + ${tingNum};
			
			$.post(url,{commentNum:commentNum,pageNum:page},function(args) {
				$("#listData").html(args);
			});
			
		}
		
	</script>
	
	<script type="text/javascript">
	
		
	
	</script>
    
    <style type="text/css">

		h2 {
			font: italic bold 1em/1em Georgia, serif;
			color: #4D71DB;
			display: inline;
		}
		
		h1 {
			font: italic bold 3em/1em Georgia, serif;
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

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <!-- <sup>너와 나의 은밀한 만남</sup> -->
                <div class="sidebar-brand-text mx-3">방 Ting</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0"><br/>
            
            <!-- Heading -->
            <div class="sidebar-heading">
                MyPage
            </div>
            
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link" href="<%=cp%>/myPage.action">
                    <i class="fas fa-fw fa-table"></i>
                    <span>마이 페이지</span>
                </a>
            </li>
            
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Room
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>방</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header"><a class="small" href="<%=cp%>/index.action">방 카테고리</a></h6>
                        <a class="collapse-item" href="<%=cp%>/list.action">전체</a>
                        <a class="collapse-item" href="<%=cp%>/travelList.action">여행</a>
                        <a class="collapse-item" href="<%=cp%>/foodList.action">맛집</a>
                        <a class="collapse-item" href="<%=cp%>/sportsList.action">운동</a>
                        <a class="collapse-item" href="<%=cp%>/studyList.action">공부</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

           	<!-- 사이드바 공간1 -->

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">
            
            <!-- 사이드바 공간2 -->

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

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

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter">3+</span>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Alerts Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 7, 2019</div>
                                        $290.29 has been deposited into your account!
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 2, 2019</div>
                                        Spending Alert: We've noticed unusually high spending for your account.
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </div>
                        </li>

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter">7</span>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    Message Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_1.svg"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                            problem I've been having.</div>
                                        <div class="small text-gray-500">Emily Fowler · 58m</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_2.svg"
                                            alt="...">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">I have the photos that you ordered last month, how
                                            would you like them sent to you?</div>
                                        <div class="small text-gray-500">Jae Chun · 1d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_3.svg"
                                            alt="...">
                                        <div class="status-indicator bg-warning"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Last month's report looks great, I am very happy with
                                            the progress so far, keep up the good work!</div>
                                        <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                                            told me that people say this to all dogs, even if they aren't good...</div>
                                        <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
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
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    
                    <div class="row p-5">
                        
                        <div class="col-lg-6">
	                        <h2>${subject }</h2><br/><br/>
							<h1><b>${title }</b></h1><br/><br/>
						</div>
						
						<div class="col-lg-6">
							<p>${introduce }</p><br/><br/>
							<p>방 마스터 : ${manager }</p>
						</div>
						
                    </div>

                    <div class="row">

                        <div class="col-lg-6">

                            <!-- Basic Card Example -->
                            <div class="card shadow mb-4">
                            
                                <div class="card-header py-3 d-sm-flex justify-content-between">
                                	<div>
                                    	<h6 class="m-0 font-weight-bold text-primary" style="font-size: 25px;"><b>Ting</b></h6>
                                    </div>
                                    <div>
	                                    <a href="<%=cp%>/tcreated.action?roomNum=${roomNum }"
											class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
											class="fas fa-download fa-sm text-white-50"></i> Ting 만들기</a>
									</div>
                                </div>
                                
                                <div class="card-header py-3">
									<form action="" name="searchForm" method="post">
									
										<select name="searchKey"
											class="custom-select custom-select-sm form-control form-control-sm"
											style="width: 18%; display: inline;">
											<option value="userId">작성자 아이디</option>
											<option value="name">작성자 이름</option>
											<option value="title">Ting 이름</option>
										</select>
										<input type="text" name="searchValue"
											class="form-control form-control-sm"
											style="width: 30%; display: inline;"/>
										<input type="button"
											value=" 검 색 " class="btn btn-primary btn-user btn-block"
											onclick="sendIt();" style="width: 10%; display: inline;"/>
											
									</form>
									<br/>
								</div>
                                
                                <div class="card-body">
                                
                                	<c:forEach var="dto" items="${lists }">
                            			<div class="card-header py-3 card shadow mb-4">
                            				
                            				<div>
												<div>
												
													<img src='<spring:url value="/image/${dto.ustoredFileName }"/>' width="50" height="50" style="border-radius: 50%;"/>
													&nbsp;&nbsp;<u>${dto.userId }</u>&nbsp;&nbsp;/&nbsp;&nbsp;<u>${dto.name }</u><br/><br/>
													
													<h2>${dto.title }</h2><br/><br/>
													<p style="background-color: #FFFFFF;">${dto.content }</p><br/><br/>
													
													작성일 : ${dto.created }<br/>
													
													<div align="center">
														<c:if test="${dto.userId == sessionScope.userInfo.userId}">
															<input type="button" class="btn btn-primary btn-user btn-block"
																value="수정" style="width: 10%; display: inline;"
																onclick="javascript:location.href='<%=cp%>/tupdated.action?roomNum=${roomNum }&tingNum=${dto.tingNum }&${params }';"/>
															<input type="button" class="btn btn-primary btn-user btn-block"
																value="삭제" style="width: 10%; display: inline;"
																onclick="javascript:location.href='<%=cp%>/deleted.action?roomNum=${roomNum }&tingNum=${dto.tingNum }&${params }';"/>
														</c:if>
													</div>
													
												</div>
											</div>
											
											<hr>
												
												<span id="listData" style="display: none"></span>
												
											<hr>
											
											<div>
												<div class="form-group">
													<input name="comments" type="text"
														class="form-control form-control-user" id="comments" style="width: 73%; display: inline;"
														placeholder="Ting 참여여부 입력 (참여합니다,참여,조인!,나도!,...)"/>
													<input type="hidden" name="tingNum" id="tingNum" value="${dto.tingNum}"/>
													<input type="hidden" name="tcuserId" id="tcuserId" value="${userId}"/>
													<input type="hidden" name="tcname" id="tcname" value="${name}"/>
													
													<input type="button" class="btn btn-primary btn-user btn-block"
														value="Ting 참여하기" id="sendButton" style="width: 25%; display: inline;"/>
												</div>
											</div>
                            				
                            			</div>
                            		</c:forEach>
                            		
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

                        </div>

                        <div class="col-lg-6">

                            <!-- Collapsable Card Example -->
                            <div class="card shadow mb-4">
                                <!-- Card Header - Accordion -->
                                <a href="#collapseCardExample" class="d-block card-header py-3" data-toggle="collapse"
                                    role="button" aria-expanded="true" aria-controls="collapseCardExample">
                                    <h6 class="m-0 font-weight-bold text-primary">참여한 방 목록</h6>
                                </a>
                                <!-- Card Content - Collapse -->
                                <div class="collapse show" id="collapseCardExample">
                                    <div class="card-body">
                                        This is a collapsable card example using Bootstrap's built in collapse
                                        functionality. <strong>Click on the card header</strong> to see the card body
                                        collapse and expand!
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Collapsable Card Example -->
                            <div class="card shadow mb-4">
                                <!-- Card Header - Accordion -->
                                <a href="#collapseCardExample" class="d-block card-header py-3" data-toggle="collapse"
                                    role="button" aria-expanded="true" aria-controls="collapseCardExample">
                                    <h6 class="m-0 font-weight-bold text-primary">관리하는 방 목록</h6>
                                </a>
                                <!-- Card Content - Collapse -->
                                <div class="collapse show" id="collapseCardExample">
                                    <div class="card-body">
                                        This is a collapsable card example using Bootstrap's built in collapse
                                        functionality. <strong>Click on the card header</strong> to see the card body
                                        collapse and expand!
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Collapsable Card Example -->
                            <div class="card shadow mb-4">
                                <!-- Card Header - Accordion -->
                                <a href="#collapseCardExample" class="d-block card-header py-3" data-toggle="collapse"
                                    role="button" aria-expanded="true" aria-controls="collapseCardExample">
                                    <h6 class="m-0 font-weight-bold text-primary">방 신청 목록</h6>
                                </a>
                                <!-- Card Content - Collapse -->
                                <div class="collapse show" id="collapseCardExample">
                                    <div class="card-body">
                                        This is a collapsable card example using Bootstrap's built in collapse
                                        functionality. <strong>Click on the card header</strong> to see the card body
                                        collapse and expand!
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
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
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

</body>
</html>