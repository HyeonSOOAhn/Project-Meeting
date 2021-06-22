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
		<title>방-투표</title>
		
	    <!-- Custom fonts for this template -->
	    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	    <link
	        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	        rel="stylesheet">
	
	    <!-- Custom styles for this template -->
	    <link href="css/sb-admin-2.min.css" rel="stylesheet">
	
	    <!-- Custom styles for this page -->
	    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	    
	    <link href="css/board.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<div id="frame">
			<form action="<%=cp%>/created_ok.action" name="myForm" method="post">
				<div id="title_container">
					<div id="title">
						<dl>
							<dt>제목</dt>
							<dd><input type="text" name="boardTitle" value="" size="65" maxlength="100" class="boxTF"/></dd>
						</dl>
					</div>
				</div>
				
				<div style="height:30px;"></div>
				
				<div id="container">
					<div id="bottomLine">
						<dl>
							<dt>내용1</dt>
							<dd><input type="text" name="member1" value="" size="65" maxlength="100" class="boxTF"/></dd>
						</dl>
					</div>
					<div id="bottomLine">
						<dl>
							<dt>내용2</dt>
							<dd><input type="text" name="member2" value="" size="65" maxlength="100" class="boxTF"/></dd>
						</dl>
					</div>
				</div>
				
				<div id="memberManager">
					<input type="button" value=" 내용추가 " class="btn2" onclick="addMember();"/>
					<input type="button" value=" 내용제거 " class="btn2" onclick="removeMember();"/>
				</div>
				
				<div id="footer">
					<input type="hidden" name="mode1" value="vote"/>
					<input type="submit" value=" 등록 " class="btn2"/>
					<input type="button" value=" 취소 " class="btn2" onclick="location.href='<%=cp%>/room.action';"/>
				</div>
			</form>
		</div>
		
		<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
		<script type="text/javascript">
		
			function addMember() {
				
				var arrayMember = document.getElementById("container").children;
				var countMember = arrayMember.length + 1;
				var memberName = "member" + countMember;
				
				$("#container").append( "<div id='bottomLine'><dl><dt>내용" + countMember + "</dt><dd><input type='text' name=\"" + memberName + "\" value='' size='65' maxlength='100' class='boxTF'/></dd></dl></div>");
			}
			
			function removeMember() {
				
				var container = document.getElementById("container");
				var arrayMember = container.children;
				
				if(arrayMember.length <= 2) {
					
					alert("투표에는 최소 2개의 선택지가 필요합니다.")
					return;
				}
				
				container.removeChild(container.lastElementChild);
			}
		
		</script>
	</body>
</html>