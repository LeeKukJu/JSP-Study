<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directives Tag</title>
</head>
<body>

	<%
		// 내장 객체 request 변수의 setAttribute() 메소드를 ㅣ용하여
		// RequestAttribute 키에 값을 저장하도록 스크립틀릿 태그를 작성
		request.setAttribute("RequestAttribute", "request 내장 객체");
	%>
	${requestScope.RequestAttribute }
</body>
</html>