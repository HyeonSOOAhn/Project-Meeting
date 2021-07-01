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
		
	</script>

<style type="text/css">
@font-face {
	font-family: 'Y_Spotlight';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/Y_Spotlight.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.tmainTop {
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 1px solid #e3e6f0;
	border-radius: 0.35rem;
	margin-bottom: 50px;
}

.tmainTopTitle {
	font-family: 'Y_Spotlight';
	font-size: 1.6rem;
	padding: 10px;
	color: #011c45;
}

.tmainTopManager {
	font-size: 1.rem;
	font-family: 'Y_Spotlight';
	padding-left: 10px;
	color: #011c45;
}

.tmainTomExplain {
	margin: 28px;
	padding: 10px;
	background-color: #e6e8eb;
	height: 75%;
	border-radius: 10px;
}

.tmainTomExplain textarea {
	border: 0;
	resize: none;
	width: 100%;
	height: 100%;
	background-color: #e6e8eb;
}
.tingLink{
	color: #000;
}
.tingLink:hover {
	text-decoration: none;
	color: #000;
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
                    
                    <div class="row tmainTop shadow">
                    	<div class="col-sm-6 ">
                    		<div class="row" style="padding: 10px; margin: 10px;">
	                    		<div class="col-sm-4">
									<img src='<spring:url value="/upload/${storedFileName}"/>' style="border-radius: 100%; width: 180px; height: 180px" />
	                    		</div>
	                    		<div class="col-sm-8">
	                    			<h1 class="tmainTopTitle">${title }</h1>
	                    			<p class="tmainTopManager">방장: ${manager}</p>
									<c:if test="${manager == sessionScope.userInfo.userId}">
										<div class="row" align="center">
											<div class="col-sm-2" style="padding: 0; margin-left: 10px;">
												<a class="btn btn-primary btn-block"
													onclick="javascript:location.href='<%=cp%>/updated.action?roomNum=${roomNum }';"
													style="width: 100%; display: inline; background-color: #1e509c;">수정</a>
											</div>
											<div class="col-sm-2" style="padding: 0">
												<a class="btn btn-danger btn-block"
													onclick="javascript:location.href='<%=cp%>/deleted.action?roomNum=${roomNum }';"
													style="width: 100%; display: inline;">삭제</a>
					
											</div>
										</div>
									</c:if>
								</div>
							</div>
                    	</div>
                    	<div class="col-sm-6">
                    		<div class="tmainTomExplain">
                    			<textarea readonly="readonly" >${introduce }</textarea>
                    		</div>
                    	</div>
                    	
                    </div>
                    
                

                    <div class="row">

                        <div class="col-lg-7">

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
											style="width: 130px; display: inline;">
											<option value="userId">작성자 아이디</option>
											<option value="name">작성자 이름</option>
											<option value="title">Ting 이름</option>
										</select>
										<input type="text" name="searchValue"
											class="form-control form-control-sm"
											style="width: 250px; display: inline;"/>
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
                            					<a class="tingLink" href="${tarticleUrl }&roomNum=${dto.roomNum }&tingNum=${dto.tingNum}">
                            					
													<div>
														<img src='<spring:url value="/image/${dto.ustoredFileName }"/>'  width="50" height="50" 
														style=" margin-right:10px; border-radius: 50%; display: inline-block;"/>
														<h3 style="margin-top:8px; display: inline-block; font-family: 'Y_Spotlight'">${dto.title }</h3>
														<sup>${dto.name}(${dto.userId})</sup>
														<div style="padding: 10px; margin:20px 10px; background-color: #edf1f7; border-radius: 10px;">
															<p>${dto.content }</p>
														</div>
														${dto.created }
													</div>
												</a>
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

                        <div class="col-lg-5">

                            <div class="col-lg-10 mb-4">
									<button class="card bg-primary text-white shadow"
										onclick="javascript:location.href='<%=cp%>/rroom.action?roomNum=${roomNum}&mode1=notice'" style="border-color: #4D71DB;">
										<div class="card-body" align="left">
											공 지 사 항
											<div class="text-white-50 small">방장님이 올려주시는 공지사항을 잘 확인하여
											더 원활한 만남을 만들어 나가요!</div>
										</div>
									</button>
							</div>
                            
                            <div class="col-lg-10 mb-4">
									<button class="card bg-primary text-white shadow"
										onclick="javascript:location.href='<%=cp%>/rroom.action?roomNum=${roomNum}&mode1=vote'" style="border-color: #4D71DB;">
										<div class="card-body" align="left">
											투 표 하 기
											<div class="text-white-50 small">두구두구 어떤 투표가 올라왔는지 확인해볼까요?
											확인하면서 함께 참여해봐요!</div>
										</div>
									</button>
							</div>
                            
                            <div class="col-lg-10 mb-4">
									<button class="card bg-primary text-white shadow"
										onclick="javascript:location.href='<%=cp%>/rroom.action?roomNum=${roomNum}&mode1=schedule'" style="border-color: #4D71DB;">
										<div class="card-body" align="left">
											달 력 보 기
											<div class="text-white-50 small">가장 중요한 일정을 정하기 위해 달력을 보면서
											차근차근 휴가계획을 잡아봐요!</div>
										</div>
									</button>
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