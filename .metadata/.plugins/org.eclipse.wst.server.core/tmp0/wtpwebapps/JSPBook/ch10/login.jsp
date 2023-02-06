<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		tomcat-users.xml에서 설정한 역할당 계정들 중, 인증을 진행 할 역할과 동일한 계정으로 인증시
		정상저긴 요청 및 인증이므로 로그인이 진행 될 수 있다. 하지만,
		인증을 진행 할 역할과 다른 역할의 계정으로 인증 시, 403 Forbidden 에러로 '엑세스 거부'가 출력된다.
		
		로그인 인증 처리를 위한 form태그 작성
		- 폼 기반 인증을 처리하도록 action 속성값을 j_security_check로 작성
	 -->
	<form action="j_security_check" method="post" name="loginForm">
		아이디 : <input type="text" name="j_username"><br>
		비밀번호 : <input type="text" name="j_password"><br>
		<input type="submit" value="전송">
	</form>
</body>
</html>