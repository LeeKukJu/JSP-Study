<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page buffer="16kb"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directives Tag</title>
</head>
<body>
	<!-- 
		출력 버퍼 크기를 16kb로 설정하기 위해 page 디렉티브 태그의 buffer 속성을 작성
	 -->
	<h2>page 디렉티브 - buffer</h2>
	Today is : <%=new Date()%>
</body>
</html>