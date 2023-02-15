<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int num1 = 123456789;
	int num2 = 123;
	double num3 = 123.45;
	double num4 = 123456.123;
%>
<c:set var="num1" value="<%=num1 %>"/>
<c:set var="num2" value="<%=num2 %>"/>
<c:set var="num3" value="<%=num3 %>"/>
<c:set var="num4" value="<%=num4 %>"/>

<!-- 
	formatNumber 태그
	- type : type 속성이 "currency"일 경우 인식할 화폐 단위
	- groupingUsed : ','와 같은 각 숫자 단위의 구분자 표시 여부
	- minFractionDigits : 화면에 표시할 소수점 이하 숫자의 최소 개수
	- maxFractionDigits : 화며넹 표시할 소수점 이하 숫자의 최대 개수
	
	*** groupingUsed 속성은 default true입니다.
 -->

<h3>formatNumber</h3>
<fmt:formatNumber value="${num1 }"/><br>
<fmt:formatNumber value="${num1 }" groupingUsed="false"  /><br>
<fmt:formatNumber value="${num1 }" type="currency" /><br>
<fmt:formatNumber value="${num4 }" minFractionDigits="6" /><br>
<fmt:formatNumber value="${num4 }" minFractionDigits="3" /><br>

<h3>formatDate</h3>
<c:set var="date" value="<%=new java.util.Date() %>"/>

기본 : <fmt:formatDate value="${date }" /><br>
날짜 : <fmt:formatDate value="${date }" type="date"/><br>
시간 : <fmt:formatDate value="${date }" type="time"/><br>
날짜 및 시간 : <fmt:formatDate value="${date }" type="both"/><br>
패턴 : <fmt:formatDate value="${date }" pattern="yyyy-MM-dd hh:mm:ss"/><br>

</body>
</html>