<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directives Tag</title>
</head>
<body>
	<!-- 외부 파일의 내용을 포함하도록 include 디렉티브 태그를 작성함 -->
	<%@include file="include02_header.jsp" %>
	<p>방문해 주셔서 감사합니다.</p>
	<%@include file="include02_footer.jsp" %>
</body>
</html>