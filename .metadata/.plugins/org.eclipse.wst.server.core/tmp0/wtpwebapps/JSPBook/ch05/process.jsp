<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Implicit Object</title>
</head>
<body>
	<%
		// process.jsp?name=개똥이
		// name=개똥이 : request 객체에 들어있음
		
		// Form에서 한글 입력을 정상적으로 처리하려면 반드시 필요하다.
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name"); //개똥이
	%>
	<p>
		이름 : <%=name %>
	</p>
</body>
</html>