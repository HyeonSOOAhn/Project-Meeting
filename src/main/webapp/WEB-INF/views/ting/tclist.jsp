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

</body>
</html>

<c:if test="${dataCount!=0 }">

	<c:forEach var="dto" items="${lists }">
	<div class="card-header py-3 card shadow mb-4">
	
		<div><b>${dto.tcuserId }&nbsp;&nbsp;/&nbsp;&nbsp;${dto.tcname }</b></div>
		<div>${dto.comments }</div><br/>
		<div>${dto.created }</div>
		
		<c:if test="${dto.tcuserId == sessionScope.userInfo.userId}">
			<div><a href="javascript:deletePage('${dto.tingNum }','${dto.commentNum }','${pageNum }')">삭제</a></div>
		</c:if>
		
		<input type="hidden" name="tingNum" value="${dto.tingNum }"/>
		
	</div>
	</c:forEach>
	
	<div align="center">
		${pageIndexList }
	</div>

</c:if>
