<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>결과확인</h3>
	<!-- 인증된 사용자를 가져오도록 request 내장 객체의 getRemoteUser() 함수 사ㅛㅇ -->
	<p>사용자명 : <%=request.getRemoteUser() %> </p>
	<!-- 인증 처리 방식을 가져오도록 request 내장 객체의 getAuthType() 함수 사용 -->
	<p>인증방법 : <%=request.getAuthType() %></p>
	
	<!-- 
		로그인 시 인증한 사용자의 역할 이름이 tomcat인지, role1인지 확인하도록
		request 내장 객체의 isUserInRole() 함수 사ㅛㅇ
	 -->
	 <p>인증한 사용자명이 역할명 "tomcat"에 속하는 사용자인가요? <%=request.isUserInRole("tomcat") %></p>
	 <p>인증한 사용자명이 역할명 "role1"에 속하는 사용자인가요? <%=request.isUserInRole("role1") %></p>
</body>
</html>