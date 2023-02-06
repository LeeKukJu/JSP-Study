<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directives Tag</title>
</head>
<body>
	<!-- 
		제일 상단에 java.util.Date 패키지를 사용하기 위해 page 디렉티브 태그의
		import 속성을 작성함
	 -->
	<h2>page 디렉티브 - import</h2>
	<!-- 현재 날짜를 출력하도록 표현문 태그를 작성 -->
	Today is <%=new Date() %>
</body>
</html>