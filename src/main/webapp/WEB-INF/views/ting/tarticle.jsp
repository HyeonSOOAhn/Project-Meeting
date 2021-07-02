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

    <title>${dto.title }</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/room.css" rel="stylesheet">
    
    <!-- jQuery 1.12.4 -->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    
    <script type="text/javascript">
		
		$(function() {
			
			var tingNum = $("#tingNum").val();
			
			listPage(tingNum,1);
			
		});
		 
		$(function() {
			
			$("#sendButton").click(function() {
				
				var params = "comments=" + $("#comments").val() + "&tingNum=" + $("#tingNum").val()
				+ "&tcuserId=" + $("#tcuserId").val() + "&tcname=" + $("#tcname").val();
				
				/* {
						comments : $("#comments").val(),
						tingNum : $("#tingNum").val(),
						tcuserId :  $("#tcuserId").val(),
						tcname : $("#tcname").val()
				}; */
					
				//	"comments=" + $("#comments").val() + "&tingNum=" + $("#tingNum").val()
				//+ "&tcuserId=" + $("#tcuserId").val() + "&tcname=" + $("#tcname").val();
				
				//var comment = "?tingNum=" + ${tingNum}
				
				$.ajax({
					
					type:"POST",
					url:"<%=cp%>/comment.action",
					data:params,
					//dataType:"json",
					//async:true,
					success:function(args) {
						
						$("#listData").html(args); //넘어온 데이터
						
						//출력 후 내용 비워주기
						$("#comments").val("");
						
					},
					beforeSend:showRequest,
					error:function(e) {
						alert(e.responseText);
					},
					
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
		
		function listPage(tingNum,page) {
			
			var url = "<%=cp%>/tclist.action";
			
			//전형적인 비동기방식
			//결과처리와 그에대한 함수도 같이 가지고 있다.
			$.post(url,{tingNum:tingNum,pageNum:page},function(args) {
				$("#listData").html(args);
			});
			
			$("#listData").show();
			
		}
		
		function deletePage(tingNum,commentNum,page) {
			
			var url = "<%=cp%>/tcdeleted.action";
			
			$.post(url,{tingNum:tingNum,commentNum:commentNum,pageNum:page},function(args) {
				$("#listData").html(args);
			});
			
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
.backRoom{
	color: #000;
}
.backRoom:hover {
	color: #38465c;	
	text-decoration: none;
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
                    <div>
                            <!-- Basic Card Example -->
                            <div class="card shadow mb-4">
                            
                                <div class="card-header py-3 d-sm-flex justify-content-between">
	                                <div>
										<img src='<spring:url value="/image/${dto.ustoredFileName }"/>'
											width="80" height="80"
											style="margin-right: 10px; border-radius: 50%; display: inline-block;" />
										
		                                    <h1 class="" style="font-family:'Y_Spotlight'; display: inline-block;">${dto.title }</h1>
		                                    <sup>${dto.name}(${dto.userId})</sup>
	                                 </div>   
                                </div>
                                
                                <div class="card-body">
                                
                            			<div class="card-header py-3 card shadow mb-4">
                            			
                            				
                            				<div>
										<div>
											
											<div
												style="padding: 10px; margin: 20px 10px; background-color: #edf1f7; border-radius: 10px;">
												<p style="margin-bottom: 30px;color: #000; font-size: 1.4rem;">${dto.content }</p>
												<hr>
												<p style="font-size: 1.6rem;">모임 정보</p>
												<p>일시 : ${dto.when}</p>
												<p>장소 : ${dto.place}</p>
												<p> 추천인원 : ${dto.inwon}</p> 
												<p>작성일 : ${dto.created }</p>
											</div>
											
											<hr>

											


											<div class="row" align="center">
												<c:if test="${dto.userId == sessionScope.userInfo.userId}">
													<div class="col-sm-1">
														<input type="button"
															class=" btn btn-primary btn-user btn-block" value="수정"
															style="width: 100%; background-color: #1e509c;"
															onclick="javascript:location.href='<%=cp%>/tupdated.action?roomNum=${roomNum }&tingNum=${dto.tingNum }&${params }';" />
													</div>

													<div class="col-sm-1">
														<input type="button"
															class="btn btn-danger btn-user btn-block" value="삭제"
															style="width: 100%;"
															onclick="javascript:location.href='<%=cp%>/tdeleted.action?roomNum=${roomNum }&tingNum=${dto.tingNum }&${params }';" />
													</div>
												</c:if>
											</div>

										</div>
									</div>
											<hr>
												<span id="listData" style="display: none"></span>
											<div>
												<div class="form-group">
													<input name="comments" type="text"
														class="form-control form-control-user" id="comments" style="width: 73%; display: inline;"
														placeholder="Ting 참여여부 입력 (참여합니다,참여,조인!,나도!,...)"/>
													<input type="hidden" name="tingNum" id="tingNum" value="${dto.tingNum}"/>
													<input type="hidden" name="tcuserId" id="tcuserId" value="${userId}"/>
													<input type="hidden" name="tcname" id="tcname" value="${name}"/>
													
													<input type="button" class="btn btn-primary btn-user btn-block"
														value="Ting 참여" id="sendButton" style="width: 20%; display: inline;"/>
												</div>
											</div>
                            				
                            			</div>

                            		<div class="text-center">
										<h4><a class="backRoom" href="<%=cp%>/tmain.action?roomNum=${roomNum }&${params }">방으로 돌아가기</a></h4>
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