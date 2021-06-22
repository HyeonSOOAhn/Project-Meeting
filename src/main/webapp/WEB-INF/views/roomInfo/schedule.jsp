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
		<title>방-일정</title>
		
		<link rel="stylesheet" href="css/schedule.css">
	</head>
	<body>
		<div>
			<div id="cal_frame"></div>
			
			<form action="<%=cp%>/created_ok.action" method="post">
				<div id="select_cal">
					<dl>
						<dd class="select_category">선택 날짜 : </dd>
						<dd id="select_day"><input id="day" type="text" readonly="readonly" name="selectDay"/></dd>
					</dl>
					
					<dl>
						<dd class="select_category">내용 : </dd>
						<dd><textarea rows="1" cols="30" name="boardContent"></textarea></dd>
					</dl>
					
					<dl>
						<dd class="select_category adst">참석여부 요청 : </dd>
						<dd><img id="adst" src="img/checkbox_outline.png"></dd>
						<dd><input id="hidden_adst" type="hidden" name="adst" value="N"/></dd>
					</dl>
				</div>
				
				<div id="act_schedule">
					<input type="hidden" name="mode1" value="schedule"/>
					<input type="submit" value=" 등록 "/>
					<input type="button" value=" 취소 " onclick="location.href='<%=cp%>/room.action';"/>
				</div>
			</form>
		</div>
		
		<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src="js/schedule.js"></script>
	</body>
</html>