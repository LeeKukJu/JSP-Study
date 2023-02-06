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
	- 프로필 이미지, 아이디, 비밀번호, 이름, 연락처, 성별, 소개를 입력받는 폼을 작성하세요
		이미지	name = filename
		아이디	name = mem_id
		비밀번호	name = mem_pw
		이름		name = mem_name
		연락처	name = mem_phone1, mem_phone2, mem_phone3
		 > [첫번째] 010,011,016,017,019 select 이용
		 > [두번째] type text
		 > [세번째] type text
		성별		name = mem_sex
		 > 남자 여자
		소개		name = mem_comment
		 > textarea 이용
	- 버튼은 submit, reset 작성
		> submit 버튼은 가입하기로 생성
		> reset  버튼은 취소하기로 생성
		
	2) ch06_test_process.jsp로 입력한 데이터를 전송해주세요
 -->
	<h3>회원가입</h3>
	<form action="ch07_test_process.jsp" name="member" method="post" enctype="multipart/form-data">
		<p>프로필 이미지</p>
		<p><input type="file" name="filename"/></p>
		<p>	아이디 : <input type="text" name="mem_id"/></p>
		<p>	비밀번호 : <input type="password" name="mem_pw"></p>
		<p>	이름 : <input type="text" name="mem_name"></p>
		<p>	연락처 : <select name="mem_phone1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="019">019</option>
			</select> - <input type="text" maxlength="4" size="4" name="mem_phone2"> -
			<input type="text" maxlength="4" size="4" name="mem_phone3">
		</p>
		<p>	성별 : <input type="radio" name="mem_sex" value="남성" checked >남성 
				<input  type="radio" name="mem_sex" value="여성">여성
		</p>
		<p>	<textarea name="mem_comment" cols="30" rows="3"	placeholder="가입인사를 입력해주세요"></textarea>
		<p>	<input type="submit" value="가입하기"> 
			<input type="reset"	value="취소하기">
	</form>
</body>
</html>