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
<title>Insert title here</title>
</head>
<body>

<!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <form class="form-inline">
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
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


                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter">${msgList.size() }</span>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    Message Center
                                </h6>

							<c:forEach var="msgDTO" items="${msgList}">
								<c:choose>
									<c:when test="${msgDTO.status== 0 }">
										<a class="dropdown-item d-flex align-items-center msg-confirm"
											data-toggle="modal"
											style="background-color: #CCCFD9;" href="#requestMsgModal" 
											data-msg1="${msgDTO.msgNum}" data-msg="${msgDTO.msg}">
											<div class="dropdown-list-image mr-3">
												<img class="rounded-circle" src="img/undraw_profile_1.svg"
													alt="...">
											</div>
											<div class="font-weight-bold">
												<div class="text-truncate">${msgDTO.msg}</div>
												<div class="small text-gray-500">${msgDTO.created}</div>
											</div>
										</a>
										
									</c:when>
									<c:otherwise>
									<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle" src="img/undraw_profile_1.svg"
											alt="...">
									</div>
									<div class="font-weight-bold">
										<div class="text-truncate">${msgDTO.msg}</div>
										<div class="small text-gray-500">${msgDTO.created} <b>완료된 요청</b></div>
									</div>
								</a>
								
								
								
								</c:otherwise>
								
								
								</c:choose>
							</c:forEach>
				
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">[${sessionScope.userInfo.userName}] 님 반갑습니다.</span>
                                <img class="img-profile rounded-circle"
                                    src="img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="myPage.action">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    MyPage
                                </a>
                     
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="logout.action">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->
                
                <!-- request Modal-->
    <div class="modal fade" id="requestMsgModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">요청메세지</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body"><input type="text" class="modalMsg"></div>
                <div class="modal-footer">
                	
	                	<input type="hidden" class="msgNumContainer">
	                    <a class="btn btn-primary" href="#" onclick="requestAccept();">수락</a>
	                
                </div>
            </div>
        </div>
    </div>
                
                <!-- Modal Message -->
    <script type="text/javascript">
    
    	$(document).on("click",".msg-confirm",function(){
    		var msgNum = $(this).data('msg1');
    		var msg = $(this).data('msg'); //지정해준 값 가져오기
    
    		$(".msgNumContainer").val(msgNum);
    		$(".modalMsg").val(msg);
    
    	});
    	
    	function requestAccept() {
    		
    		var msgNum = {"msgNum": $(".msgNumContainer").val()};
    		
    		$.ajax({
    			
    			url:"modalAccept.action",
    	        type:'GET',
    	        data: msgNum,
    	        success:function(data){
    	        	$(".modal").modal("hide");
    	        }
    		});
		}
    	
    
    
    </script>
                

</body>
</html>