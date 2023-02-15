<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		request.getHeader("User-Agent") request 내장객체를 이용하여 가져온 header 
		'User-Agent'를 EL에서 header['User-Agent']로 작성이 가능합니다.
	 -->
	 browser 변수 값 설정
	 <hr>
	 <c:set value="${header }" var="hd"/>
	 <c:set value="${header['User-Agent'] }" var="userAgent"/>
	 <br><hr>
	 
	 User-Agent : <c:out value="${hd['User-Agent'] }"/><br>
	 Host : <c:out value="${hd['Host'] }"/><br>
	 Accept : <c:out value="${hd['Accept'] }"/><br>
	 Accept-Language : <c:out value="${hd['Accept-Language'] }"/><br>
	 Accept-Encoding : <c:out value="${hd['Accept-Encoding'] }"/><br>
	 Referer : <c:out value="${hd['Referer'] }"/><br>
	 Connection : <c:out value="${hd['Connection'] }"/><br>
	 Cache-Control : <c:out value="${hd['Cache-Control'] }"/><br>
	 
	 <hr>
	 userAgent : <c:out value="${userAgent }"/>
	 <p>browser 변수 값 제거 후 </p>
	 <c:remove var="userAgent"/>
	 userAgent : <c:out value="${userAgent }"/>
</body>
</html>