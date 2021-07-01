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
		<title>방-공지</title>
		
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
			<div id="container">
				<div id="bottomLine">
					<dl>
						<dt>제 목</dt>
						<dd><input type="text" name="boardTitle" value="${dto.boardTitle}" size="65" maxlength="100" class="boxTF"/></dd>
					</dl>
				</div>
				
				<div id="contents">
					<dl>
						<dt>내 용</dt>
						<dd><textarea rows="12" cols="63" name="boardContent" value="${dto.boardContent}" class="boxTA"></textarea></dd>
					</dl>
				</div>
			</div>
			
			<input type="hidden" name="mode1" value="notice"/>
		</div>
	</body>
</html>