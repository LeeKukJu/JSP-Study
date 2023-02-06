<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Scripting Tag</title>
</head>
<body>
	<h2>선언문 태그</h2>
	<%!
		int sum(int a, int b){
		return a + b;
	}
	%>
	<%
		out.println("a + b = " + sum(2, 3));
	%>
</body>
</html>