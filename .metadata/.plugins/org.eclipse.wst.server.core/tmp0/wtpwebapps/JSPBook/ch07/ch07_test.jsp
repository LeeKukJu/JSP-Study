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
		1) ch07_test.jsp에
		프로필 이미지, 아이디, 비밀번호, 이름, 연락처, 성별, 소개를 입력받는 폼을 작성
		
		2) ch07_test_process.jsp로 입력한 데이터를 전송
	 -->
	 
	 <form action="ch07_test_process.jsp" method="post" enctype="multipart/form-data">
	 	프로필 이미지 : <input type="file" name="profile" ><br>
	 	아이디 : <input type="text" name="id"><br>
	 	비밀번호 : <input type="text" name="pw"><br>
	 	이름 : <input type="text" name="name"><br>
	 	연락처 : <input type="text" name="tel"><br>
	 	성별 : <input type="text" name="sex"><br>
	 	소개 : <textarea rows="3" cols="30" wrap="soft" name="intro" placeholder="가입인사를 입력해주세요."></textarea><br>
	 	<input type="submit" value="전송하기">
	 
	 </form>
</body>
</html>