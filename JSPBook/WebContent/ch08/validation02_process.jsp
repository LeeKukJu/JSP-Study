<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>입력에 성공하였습니다!</h3>
	<hr>
	
	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String id2 = request.getParameter("id2");
		String pw2 = request.getParameter("pw2");
	%>
	
	<h3>JavaScript 버전</h3>
	<p>아이디 : <%=id %></p>
	<p>비밀번호 : <%=pw %></p>
	<hr>
	
	<h3>Jquery 버전</h3>
	<p>아이디 : <%=id2 %></p>
	<p>비밀번호 : <%=pw2 %></p>
	<hr>
</body>
</html>