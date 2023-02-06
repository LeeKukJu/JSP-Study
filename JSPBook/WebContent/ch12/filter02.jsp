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
		해당 페이지에서 아이디, 비밀번호를 입력하고 filter02_process.jsp로 요청했을때,
		Filter에 의해서 InitParamFilter필터가 작동한다.
		입력한 아이디, 비밀번호가 admin/1234가 아닌 경우 web.xml에 설정한 filter의 파라미터 값과 다르므로
		"로그인 실패했습니다."가 함께 출력된다.
		
		정사적으로 damin/1234를 입력하면 요청 시엔 "로그인 성공했습니다."가 함께 출력된다.
	 -->
	<form action="filter02_process.jsp" method="post">
		<p>아이디 : <input type="text" name="id"> </p>
		<p>비밀번호 : <input type="text" name="pw"> </p>
		<p> <input type="submit" value="전송"></p>
	</form>
</body>
</html>