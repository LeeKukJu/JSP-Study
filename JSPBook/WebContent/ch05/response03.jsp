<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Implicit Objects</title>
</head>
<body>
	<%
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
	%>
	<p>문자 인코딩 : <%=response.getCharacterEncoding() %></p>
	<p>콘텐츠 유형 : <%=response.getContentType() %></p>
	
	<%
		// 웹 브라우저에 응답할 오류로 404코드 및 오류 메시지를 출력하도록
		// response 내장 객체의 sendError() 메소드를 작성
		response.sendError(404, "요청 페이지를 찾을 수 없습니다!!!");
	%>
</body>
</html>