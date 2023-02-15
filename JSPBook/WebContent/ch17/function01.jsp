<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>java 문자열 검색 </p>
	<!-- 설정된 문자열에 검색 문자열 java가 포함되었는지 확인하도록 fn:contains 태그를 작서합니다. -->
	<p>Hello, Java Server Page! => ${fn:contains("Hello, Java Server Page!", "java") }</p>
	<!-- 설정된 문자열에 검색 문자열 java가 포함되었는지 확인하도록 fn:containsIgnoreCase 태그를 작서합니다. -->
	<!-- 대소문자 상관 않고 검색함 -->
	<p>Hello, Java Server Page! => ${fn:containsIgnoreCase("Hello, Java Server Page!", "java") }</p>
	
</body>
</html>