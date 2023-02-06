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
		// 폼에서 한글 입력을 정상적으로 처리할 때 필요
		// web.xml에서 filter 태그로 처리하여 자동화할 예정
		request.setCharacterEncoding("utf-8");
	
	// 입력된 아이디와 비밀번호를 폼 태그로 부터 전송받도록 request 내장 객체의 getParameter() 메소드를 작성 
	String userId = request.getParameter("id");
	String userPw = request.getParameter("pw");
	%>
	<!-- Form으로 부터 전송받은 아이디와 비밀번호를 출력하도록 표현문 태그를 작성 -->
	<p>아이디 : <%=userId %></p>
	<p>비밀번호 : <%=userPw %></p>
	
</body>
</html>