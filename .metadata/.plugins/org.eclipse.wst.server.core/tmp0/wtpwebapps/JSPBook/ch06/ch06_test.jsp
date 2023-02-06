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
		1) ch06_test.jsp에
		아이디, 비밀번호, 이름, 연락처, 성별, 취미, 소개를 입력받는 폼을 작성해주세요.
		
		연락처의 앞자리는 select를 이용해주세요.
		소개는 textarea를 이용(속성은 자유롭게)
		
		2) ch06_test_process.jsp로 입력한 데이터를 전송
	 -->
	 
	 <h3>회원가입</h3>
	<form action="ch06_test_process.jsp" name="member" method="post">
		<p>
			아이디 : <input type="text" name="id"/>
			<input type="button" value="아이디 중복검사"/> 
		</p>
		<p>비밀번호 : <input type="password" name="pw"></p>
		<p>이름 : <input type="text" name="name"/></p>
		<p>
			연락처 : <select name="phone1">
					<option value="010">010</option>	
					<option value="011">011</option>	
					<option value="016">016</option>	
					<option value="017">017</option>	
					<option value="019">019</option>	
			</select> -
			<input type="text" maxlength="4" size="4" name="phone2"/> - 
			<input type="text" maxlength="4" size="4" name="phone3"/> 
		</p> 
		<p>
			성별 : <input type="radio" name="sex" value="남성" checked/>남성		
				<input type="radio" name="sex" value="여성" />여성		
		</p>
		<p>
			취미 : 독서 <input type="checkbox" name="hobby" value="독서" checked/>		
				운동 <input type="checkbox" name="hobby" value="운동"/>		
				영화 <input type="checkbox" name="hobby" value="영화"/>		
		</p>
		<p>
			<!-- 
				wrap="off" : 줄바꿈 안함
				wrap="soft" : 자동 줄바꿈
				wrap="hard" : 서버 전송 시 캐리지 리턴(엔터문자) 문자ㅡㄹ 전달
				
				해당 속성은 html5에서 새롭게 추가된 기능,
				wrap="hard" 속성을 사용 시, cols 속성이 꼭 명시되어 있어야한다.
			 -->
			<textarea rows="3" cols="30" wrap="soft" placeholder="가입인사를 입력해주세요." name="comment"></textarea>
		</p>
		<p>
			<input type="submit" value="가입하기"/>
			<input type="reset" value="다시쓰기"/>
		</p>
	</form>
</body>
</html>