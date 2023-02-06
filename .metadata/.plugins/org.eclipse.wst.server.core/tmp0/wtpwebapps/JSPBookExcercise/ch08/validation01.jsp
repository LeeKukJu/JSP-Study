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
		<input type="button" value="전송" onclick="CheckForm()"/>
	</form>
</body>
</html>