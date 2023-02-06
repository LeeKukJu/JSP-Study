<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function CheckForm() {
		var form = document.loginForm;
		var pw = form.pw.value;
		var pwCheck = form.pw2.value;
		var regExpPw = /(\w)\1{2,}/;
		
		var pattern1 = /[0-9]/;
		var pattern2 = /[a-zA-Z]/;
		var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/;
		
		if(form.id.value == ""){
			alert("아이디를 입력해주세요.");
			form.id.focus();
			form.id.select();
			return;
		}else if(form.pw.value == ""){
			alert("비밀번호를 입력해주세요.");
			form.pw.focus();
			form.pw.select();
			return;
		}
		
		if(form.pw.value.includes(form.id.value)){
			alert("비밀번호는 ID를 포함할 수 없습니다.");
			form.pw.focus();
			form.pw.select();
			return;
		}
		
		if(pw != pwCheck){
			alert("비밀번호가 일치하지 않습니다..")
			form.pw2.focus();
			form.pw2.select();
			return;
		}
		
		if(regExpPw.test(pw)){
			alert("영문, 숫자는 3자이상 연속 입력할 수 없습니다.")
			form.pw.focus();
			form.pw.select();
			return;
		}
		
		if(!pattern1.test(pw) || !pattern2.test(pw) || !pattern3.test(pw) || pw.length < 8){
			alert("영문+숫자+특수기호 8자리 이상으로 구성하여야 합니다.")
			form.pw.focus();
			form.pw.select();
			return;
		}
		
		form.submit();
	}
</script>
<body>
	<h3>JavaScript 버전</h3>
	<form action="validation_process.jsp" name="loginForm" method="post">
		아이디: <input type="text" name="id"/><br>
		비밀번호: <input type="text" name="pw"/><br>
		비밀번호 확인: <input type="text" name="pw2"/><br>
		<input type="button" value="전송" onclick="CheckForm()"/>
	</form>
</body>
</html>