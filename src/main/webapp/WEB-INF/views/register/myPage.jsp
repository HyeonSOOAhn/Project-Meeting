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
<link href="css/myPage.css" rel="stylesheet">

<style type="text/css">

.myInfo{
	min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid #e3e6f0;
    border-radius: 0.35rem;
}



.myInfoBody{
	padding: 5px;
}
.updateModalInput{
	margin-bottom: 15px;
	height: 35px;
	border-radius: 5px;
}
.updateModalP{
	margin: 0;
	margin-bottom: 15px;
}

.myPageProfile:hover{
	opacity: 0.5;
}
.manageListLink{
	color: #000;
	text-decoration: none;
}
.manageListLink:hover{
	color:#000;
	text-decoration: none;
	font-weight: 800;
}

.warningUpdate{
	color: #f72a0f;
}
.basicProfile{
	text-decoration: none;
	color: #3E4348;
}

.basicProfile:hover {
	text-decoration: none;
	color: #C65146;
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

									<div  style="text-align: center;">
										<form id="profileImgForm" name="profileImgForm">
											<img id="profileImg" class="myPageProfile" style="border:0.005rem solid #000; border-radius: 100%;"
												src='<spring:url value="/image/${dto.ustoredFileName }"/>'
												width="200" height="200" onclick="profileImgChange();" /><br /> <br />
											<a class="basicProfile" href="#" onclick="updateBasic();">기본이미지로 변경하기</a>
											<div style="display: none;"><input name="fileProfile" type="file"/></div>
										</form>
									</div>

									
									<div class="row">
										<div class="myInfo border-left-primary col-sm-5 ">
											<div class="myInfoBody">
												<div class="row align-items-center">
													<div class="col mr-2">
														<div
														class="text-xs font-weight-bold text-primary text-uppercase mb-1">
														아이디</div>
														<div class="h5 mb-0 font-weight-bold text-gray-800">
														${dto.userId }
													</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-sm-1">
										
										</div>
										<div class="myInfo border-left-primary col-sm-5 ">
											<div class="myInfoBody">
												<div class="row align-items-center">
													<div class="col mr-2">
														<div
														class="text-xs font-weight-bold text-primary text-uppercase mb-1">
														이름</div>
														<div class="h5 mb-0 font-weight-bold text-gray-800">
														${dto.name }
													</div>
													</div>
												</div>
											</div>
										</div>
									
									</div>

									<br />
									
									<div class="row">
										<div class="myInfo border-left-primary col-sm-8 ">
											<div class="myInfoBody">
												<div class="row align-items-center">
													<div class="col mr-2">
														<div
														class="text-xs font-weight-bold text-primary text-uppercase mb-1">
														Email 주소</div>
														<div class="h5 mb-0 font-weight-bold text-gray-800">
														${dto.email }
													</div>
													</div>
												</div>
											</div>
										</div>
										
										<div class="col-sm-1"></div>
										
										<div class="myInfo border-left-primary col-sm-2 ">
											<div class="myInfoBody">
												<div class="row align-items-center">
													<div class="col mr-2">
														<div
														class="text-xs font-weight-bold text-primary text-uppercase mb-1">
														성별</div>
														<div class="h5 mb-0 font-weight-bold text-gray-800">
															<c:if test="${dto.gender == 1}">
																남자
															</c:if>
															<c:if test="${dto.gender == 2}">
																여자
															</c:if>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
	
									<br />
									<div class="row">
										<div class="myInfo border-left-primary col-sm-8 ">
											<div class="myInfoBody">
												<div class="row align-items-center">
													<div class="col mr-2">
														<div
															class="text-xs font-weight-bold text-primary text-uppercase mb-1">
															전화번호</div>
														<div class="h5 mb-0 font-weight-bold text-gray-800">
															${dto.tel}</div>
													</div>
												</div>
											</div>
										</div>
										
										<div class="col-sm-1"></div>
										
										<div class="myInfo border-left-primary col-sm-2 ">
											<div class="myInfoBody">
												<div class="row align-items-center">
													<div class="col mr-2">
														<div
															class="text-xs font-weight-bold text-primary text-uppercase mb-1">
															방 생성</div>
														<div class="h5 mb-0 font-weight-bold text-gray-800">
															<c:if test="${dto.right == 0}">
																불가
															</c:if>
															<c:if test="${dto.right == 1}">
																가능
															</c:if>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<c:if test="${dto.right == 0}">
									<div style="text-align: center; margin-top: 10px;">
										<a href="certification.action?email=${dto.email}">이메일 인증하기</a>
									</div>
									</c:if>
									<div class="row" style="margin-top: 10px; ">
										<div class="col-sm-7" style="margin: 2px;">
											<a class="btn btn-primary btn-user btn-block" data-toggle="modal" 
													href="#updateUserModal">회원 정보 수정</a>
										</div>

										<div class="col-sm-4" style="margin: 2px;">
											
												<a class="btn btn-danger btn-user btn-block" data-toggle="modal" 
													href="#removeUserModal">회원 탈퇴하기</a>
											
										</div>
									</div>

								</div>
							</div>

						</div>

						<div class="col-lg-6">

							
							<div class="card shadow mb-4">
								<!-- Card Header - Accordion -->
								<a href="#participateList" class="d-block card-header py-3"
									data-toggle="collapse" role="button" aria-expanded="false"
									aria-controls="participateList">
									<h6 class="m-0 font-weight-bold text-primary">내가 참여한 방 목록</h6>
								</a>
								<!-- Card Content - Collapse -->
								<div class="collapse show" id="participateList">
									<div class="card-body">
										<c:forEach var="participateDTO" items="${participateList}">
											<a class="manageListLink" href="article.action?roomNum=${participateDTO.roomNum}">
												<div class="row">
													<div class="col-sm-6">
														${participateDTO.title }
													</div>
													<div class="col-sm-2">
														${participateDTO.subject}
													</div>
													<div class="col-sm-2">
														${participateDTO.currentP}명/${participateDTO.totalP}명
													</div>
													<div class="col-sm-2">
														${participateDTO.created}
													</div>
												
												</div>
											</a>
										</c:forEach>
									</div>
								</div>
							</div>

							<div class="card shadow mb-4">
								<!-- Card Header - Accordion -->
								<a href="#manageList" class="d-block card-header py-3"
									data-toggle="collapse" role="button" aria-expanded="false"
									aria-controls="manageList">
									<h6 class="m-0 font-weight-bold text-primary">내가 관리하는 방 목록</h6>
								</a>
								<!-- Card Content - Collapse -->
								<div class="collapse show" id="manageList">
									<div class="card-body">
										<c:forEach var="manageDTO" items="${manageList}">
											<a class="manageListLink" href="article.action?roomNum=${manageDTO.roomNum}">
												<div class="row">
													<div class="col-sm-6">
														${manageDTO.title }
													</div>
													<div class="col-sm-2">
														${manageDTO.subject}
													</div>
													<div class="col-sm-2">
														${manageDTO.currentP}명/${manageDTO.totalP}명
													</div>
													<div class="col-sm-2">
														${manageDTO.created}
													</div>
												
												</div>
											</a>
										</c:forEach>
									</div>
								</div>
							</div>

							<div class="card shadow mb-4">
								<!-- Card Header - Accordion -->
								<a href="#requestList" class="d-block card-header py-3"
									data-toggle="collapse" role="button" aria-expanded="false"
									aria-controls="requestList">
									<h6 class="m-0 font-weight-bold text-primary">내가 신청한 방 목록</h6>
								</a>
								<!-- Card Content - Collapse -->
								<div class="collapse show" id="requestList">
									<div class="card-body">
										<c:forEach var="requestDTO" items="${requestList}">
											<p>${requestDTO.msg}</p>
											<sup><c:if test="${requestDTO.status==0}"><span style="color: #4F86C6;">대기중</span></c:if>
												<c:if test="${requestDTO.status==1}"><span style="color:#0DE65D;">수락됨</span></c:if>
												<c:if test="${requestDTO.status==2}"><span style="color:#E6210A;">거절됨</span></c:if>
																	 ${requestDTO.created }</sup>
										</c:forEach>
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
			<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	
	<!-- 수정 modal -->
	<div class="modal fade" id="updateUserModal" tabindex="-1"
		role="dialog" aria-labelledby="updateUserModal" aria-hidden="true">
		<div class="modal-dialog" style="max-width: 500px;" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">회원정보 수정</h5>
					<p style="font-size: 10px;">이메일 변경시 이메일 인증 다시 하셔야합니다.</p>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<form name="updateForm" method="POST">
					<div class="modal-body">
						<div><p class="warningUpdate"></p></div>
						<div class="row">
							<div class="col-sm-6">
								<p class="updateModalP"><sub>아이디</sub></p>
								<input class="updateModalInput updateId" type="text" name="userId" disabled="disabled" value="${dto.userId}" style="width: 200px;" >
							</div>
							<div class="col-sm-6">
								<p class="updateModalP"><sub>이름</sub></p>
								<input class="updateModalInput" type="text" name="name" style="width: 200px;" value="${dto.name}">
							</div>
						</div>
						
						<div class="row">
							<div class="col-sm-6">
								<p class="updateModalP"><sub>비밀번호</sub></p>
								<input class="updateModalInput updatePwd" type="password" name="userPwd" style="width: 200px;" placeholder="바꾸지 않을 분들은">
							</div>
							<div class="col-sm-6">
								<p class="updateModalP"><sub>비밀번호 확인</sub></p>
								<input class="updateModalInput updatePwdCon" type="password" style="width: 200px;" placeholder="비워두세요.">
							</div>
						
						</div>
						<div class="row">
							<div class="col-sm-9">
								<p class="updateModalP"><sub>이메일</sub></p>
								<input class="updateModalInput updateEmail" name="email" type="text" style="width: 330px;" value="${dto.email}">
							</div>
							<div class="col-sm-3">
								<p class="updateModalP">
									<sub>성별</sub>
								</p>
								<c:if test="${dto.gender == 1}">
									<input class="updateModalInput" type="text" style="width: 50px;" disabled="disabled" value="남자">
								</c:if>
								<c:if test="${dto.gender == 2}">
									<input class="updateModalInput" type="text" style="width: 50px;" disabled="disabled" value="여자">
								</c:if>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-9">
								<p class="updateModalP"><sub>전화번호</sub></p>
								<input class="updateModalInput updateTel" name="tel" type="text" style="width: 330px;" value="${dto.tel}">
							</div>
							
							<div class="col-sm-3">
								<p class="updateModalP"><sub>방 생성</sub></p>
								<c:if test="${dto.right == 0}">
									<input class="updateModalInput" type="text" style="width: 50px;" disabled="disabled" value="불가">
								</c:if>
								<c:if test="${dto.right == 1}">
									<input class="updateModalInput" type="text" style="width: 50px;" disabled="disabled" value="가능">
								</c:if>
							</div>
						</div>
					</div>
					
					<div class="col-sm-6">
						<p class="updateModalP"><sub>현재 비밀번호</sub></p>
						<input class="confirmPwd" type="hidden" value="${dto.userPwd}">
						<input class="updateModalInput currentPwd" type="password" name="userPwd" style="width: 200px;" placeholder="현재 비밀번호">
					</div>
					
					<div class="modal-footer">
						<a class="btn btn-primary" href="#" onclick="updateCheck();" type="button">수정</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<!-- 탈퇴 modal -->
	<div class="modal fade" id="removeUserModal" tabindex="-1"
		role="dialog" aria-labelledby="removeUserModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">정말 탈퇴 하시겠어요?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					비밀번호 입력하세요
					<input class="pwdConfirm" type="password" width="400">
				</div>
				<div class="modal-footer">
					<button class="btn btn-danger" type="button" data-dismiss="modal" aria-label="Close">
						아니오
					</button>
					<a class="btn btn-primary" href="#" onclick="removeCheck();">입력</a>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	
		function profileImgChange() {
			$("input[name='fileProfile']").click();
		}
		
		function updateBasic() {
			
			 $.ajax({
		        	type:"POST",
		        	url: "updateBasic.action",
		        	data: "",
		        	success:function(){
		        		window.location.reload();
		        	},
		        	error : function(request,status,error) {  
		               alert("code:"+request.status+"\n"+"error:"+error);
		            }
		        	
		        });
			
		}
		
		$("input[name='fileProfile']").change(function(e) {
			var frm = document.getElementById('profileImgForm');
	        frm.method = 'POST';
	        frm.enctype = 'multipart/form-data';
	        var fileData = new FormData(frm);

	        
	        $.ajax({
	        	type:"POST",
	        	url: "alterationProfileImg.action",
	        	data: fileData,
	        	processData: false,
	            contentType: false,
	        	success:function(){
	        		window.location.reload();
	        	},
	        	error : function(request,status,error) {  
	               alert("code:"+request.status+"\n"+"error:"+error);
	            }
	        	
	        });
			
		})
		
	 
	
	    function removeCheck() {
	
	    	 if (confirm("정말 탈퇴하시겠습니까?") == true){//확인
				var pwd = document.querySelector(".pwdConfirm");
	    	 	var sendData = "userPwd="+pwd.value;
	    	 	
	    	 	$.ajax({
	    	 		url:"userDeleted.action",
	    	 		type:"POST",
	    	 		data: sendData,
	    	 		success:function(data){
	    	 			if(data==='success'){
	    	 				alert("고객님의 회원정보를 삭제했습니다. 다음에 봬요!");
	    	 				window.location.href = "main.action";
	    	 			}else if(data=='false'){
	    	 				alert("비밀번호가 일치하지 않아요");
	    	 				window.location.reload();
	    	 			}
	    	 		}
	    	 	});
	    	 }else{//취소
	    		 return false;
	    	 }
	    }

	    function updateCheck() {
	    	var f = document.updateForm;
	    	const warningMsg = f.querySelector(".warningUpdate"),
	    		id = f.querySelector(".updateId"),
	    		pwd = f.querySelector(".updatePwd"),
	    		pwdCon = f.querySelector(".updatePwdCon"),
	    		tel = f.querySelector(".updateTel"),
	    		email = f.querySelector(".updateEmail")
	    		currentPwd = f.querySelector(".currentPwd"),
	    		confirmPwd = f.querySelector(".confirmPwd");
	    		
	    	if(pwd.value!=""){
	    		if(pwd.value !== pwdCon.value){
	    			warningMsg.innerText = "새로운 패스워드가 일치 하지 않습니다.";
	    			pwd.focus();
	    			return;
	    		}
	    		if(pwd.value.length < 8){
	    			warningMsg.innerText = "비밀번호가 너무 짧아요! [8-15]자로 맞춰주세요!";
		            pwd.focus();
		            return;
	    		}
	    	}
	    	
	    	var regex = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/;
	    	
	    	 if (!regex.test(email.value)) {
	    		warningMsg.innerText = "이메일 형식에 맞게 입력해주세요.";
		        email.focus();
		        return;
	    	 }
	    	 
	    	 regex = /^[0-9]*$/;
	    	
	    	 if (!regex.test(tel.value)) {
	    		warningMsg.innerText = "['-','.']등 이 없이 숫자로만 입력해주세요.";
		        tel.focus();
		        return;
	    	 }
	    	 
	    	 if(currentPwd.value == ""){
	    		 warningMsg.innerText = "수정하기 위해선 비밀번호가 필요해요";
	    		 return;
	    	 }
	    	
	    	 if(currentPwd.value !== confirmPwd.value){
	    		 warningMsg.innerText = "현재 비밀번호가 틀렸어요";
	    		 return;
	    	 }
	    	 
	    	 var sendData = "userId=" + id.value + "&userPwd=" + pwd.value + "&email=" + email.value + "&tel=" + tel.value;
	    	 
	    	 $.ajax({
	    		url: "userUpdated.action",
	    	 	type: "POST",
	    	 	data: sendData,
	    	 	success:function(data){
	    	 		if(data=="success"){
	    	 			alert("정보수정을 완료했어요!");
	    	 			window.location.reload();
	    	 		}
	    	 	}
	    		 
	    	 });
		}
	    
	   
	    
	</script>



	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

</body>
</html>