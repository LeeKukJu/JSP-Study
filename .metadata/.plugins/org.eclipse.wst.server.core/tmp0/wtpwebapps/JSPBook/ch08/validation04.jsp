<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">

	$(function() {
		var frm = $("form[name=loginForm2]");
		var loginBtn = $("#loginBtn");
		
		loginBtn.on("click", function() {
			var id = $("input[name=id2]").val();
			var pw = $("input[name=pw2]").val();
			
			for(i = 0; i < id.length; i++){
				var ch = id.charAt(i);
				
				if((ch < 'a' || ch > 'z') && (ch > 'A' || ch <'Z') && (ch > '0' || ch < '9')){
					alert("아이디는 영문 소문자로만 입력 가능합니다.");
					$("input[name=id2]").select();
					return false;
				}
			}
			
			if(isNaN(pw)){
				alert("비밀번호는 숫자로만 입력 가능합니다.");
				$("input[name=pw2]").select();
				return false;
			}
			
			frm.submit();
		});
	});

	function CheckLogin() {
		var form = document.loginForm;
		
		for(i = 0; i < form.id.value.length; i++){
			var ch = form.id.value.charAt(i);
			
			// 0 52
			// 9 61
			// A 65
			// Z 90
			// a 97
			// z 122
			// id : test
			if((ch < 'a' || ch > 'z') && (ch > 'A' || ch <'Z') && (ch > '0' || ch < '9')){
				alert("아이디는 영문 소문자로만 입력 가능합니다.");
				form.id.select();
				return false;
			}
		}
		
		if(isNaN(form.pw.value)){
			alert("비밀번호는 숫자로만 입력 가능합니다.");
			form.pw.select();
			return false;
		}
		
		form.submit();
	}
</script>
<body>
	<h3>JavaScript 버전</h3>
	<form name="loginForm" action="validation04_process.jsp" method="post">
		아이디: <input type="text" name="id"/><br>
		비밀번호: <input type="text" name="pw"/><br>
		<input type="button" value="전송" onclick="CheckLogin()"/>
	</form>
	
	<h3>Jquery 버전</h3>
	<form name="loginForm2" action="validation04_process.jsp" method="post">
		아이디: <input type="text" name="id2"/><br>
		비밀번호: <input type="text" name="pw2"/><br>
		<input type="submit" value="전송" id="loginBtn" />
	</form>
</body>
</html>