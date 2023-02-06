<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	문제1) 아이디, 비밀번호를 입력받고 전송 할 폼 양식을 작성하세요.
		
		아이디 name = mem_id
		비밀번호  name = mem_pw
		버튼이름은 로그인
		
		버튼 아래에 p태그로 msg 출력 공간 만들어놓기
		<p>에러 메세지를 표시해주세요</p>
		
		전송 경로 : total_signin_process.jsp
		
	문제2) 로그인 처리(submit) 후, 로그인 실패 시에 해당 페이지에서 에러메시지를 출력해주세요.
		- 메세지 처리는 자유롭게
		- 메시지 내용도 자유롭게
		- p태그에 메세지를 출력해주세면 됩니다.
 -->
 
	<form action="total_signin_process.jsp" method="post">
		<p>아이디: <input type="text" name="mem_id"/> </p>
		<p>비밀번호: <input type="text" name="mem_pw"/> </p>
		<input type="submit" value="로그인"> 
		<a href="./total_signup.jsp"><input type="button" value="회원가입"></a><br>
	</form> 
	<%
		if(request.getAttribute("msg") != null){
			
	%>
			<p style="color:red;">** <%=request.getAttribute("msg") %></p>
	<%
		}
	%>
<%-- 			<p>${msg not empty}</p> --%>
</body>
</html>