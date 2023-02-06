<%@page import="java.util.Date"%>
<%@ page language="java" contentType="application/msword; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	콘텐츠 유형은 application/msword로 설정하도록 page 디렉티브 태그의
	contentType 속성을 작성한다.
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directives Tag</title>
</head>
<body>
	Today is: <%=new Date() %>
	
</body>
</html>