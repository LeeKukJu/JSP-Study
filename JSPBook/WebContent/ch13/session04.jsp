<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>------------세션을 삭제하기 전---------------</h3>
	
	<%
		String user_id = (String)session.getAttribute("userId");
		String user_pw = (String)session.getAttribute("userPw");
		
		out.println("설정된 세션 값 userId : " + user_id + "<br>");
		out.println("설정된 세션 값 userPw : " + user_pw + "<br>");
		
		session.removeAttribute("userId");
	%>
	<h3>------------세션을 삭제한 후---------------</h3>
	
	<%
		user_id = (String)session.getAttribute("userId");
		user_pw = (String)session.getAttribute("userPw");
		
		out.println("설정된 세션 값 userId : " + user_id + "<br>");
		out.println("설정된 세션 값 userPw : " + user_pw + "<br>");
		
	%>
</body>
</html>