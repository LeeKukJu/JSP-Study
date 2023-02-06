<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="Date 클래스를 이용한 날짜 출력하기" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directives Tag</title>
</head>
<body>
	<!-- 
		웹 페이지의 설명을 설정하기 위해 page 디렉티브 태그의 info 속성을 작성
	 -->
	<h2>page 디렉티브 - info</h2>
	Today is: <%=new Date() %>
</body>
</html>