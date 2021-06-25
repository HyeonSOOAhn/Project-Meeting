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
		
		<link rel = "stylesheet" type = "text/css" href = "css/style.css"/>
		<link rel = "stylesheet" type = "text/css" href = "css/article.css"/>
	</head>
	<body>
		<div id = "bbs">
			<div id = "bbs_title">
				${dto.mode1}
			</div>
			
			<div id = "bbsArticle">
				<div id = "bbsArticle_header">
					${dto.boardTitle}
				</div>
				
				<div class = "bbsArticle_bottomLine">
					<dl>
						<dt>작성자</dt>
						<dd>${dto.userId}</dd>
					</dl>
				</div>
				
				<div class = "bbsArticle_bottomLine">
					<dl>
						<dt>등록일</dt>
						<dd>${dto.created}</dd>
					</dl>
				</div>
				
				<div id = "bbsArticle_content">
					<table width = "600" border = "0">
						<tr>
							<td style = "padding : 20px 80px 20px 62px;" valign = "top" height = "200">
								${dto.boardContent}
							</td>
						</tr>
					</table>
				</div>
				
				<div class = "bbsArticle_noLine" style = "text-align : right;">
					From : ip
				</div>
				
				<div id = "bbsArticle_footer">
					<c:if test="${dto.userId == userId}">
						<div id = "leftFooter">
							<input type = "button" value = " 수 정 " class = "btn2" onclick = ""/>
							<input type = "button" value = " 삭 제 " class = "btn2" onclick = ""/>
						</div>
					</c:if>
					
					<div id = "rightFooter">
						<input type = "button" value = " 리스트 " class = "btn2" onclick = ""/>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>