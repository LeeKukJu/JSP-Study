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
		var submitBtn = $("#submitBtn");
		var loginForm2 = $("#loginForm2");
		
		// 방법3
		loginForm2.submit(function(event){
			event.preventDefault();
			console.log("submit 이벤트 발동 안함!!!!!");
			
			alert("아이디 : " + $("input[name=id2]").val() + "\n" +
					"비밀번호 : " + $("input[name=pw2]").val());
			
			loginForm2.submit(); // submit 이벤트를 준다.
		});
		
		
		// 방법2
// 		submitBtn.on("click", function(event) {
// 			event.preventDefault(); // 이벤트 처리를 막는다.
// 			console.log("submit 이벤트 발동 안함!!!");
			
// 			alert("아이디 : " + $("input[name=id2]").val() + "\n" +
// 					"비밀번호 : " + $("input[name=pw2]").val());
// 		});
		
		
		// 방법1
// 		submitBtn.on("click", CheckFormJquery);
		
// 		function CheckFormJquery() {
// 			alert("아이디 : " + $("input[name=id2]").val() + "\n" +
// 					"비밀번호 : " + $("input[name=pw2]").val());
// 		}
	});
	function CheckForm() {
		alert("아이디 : " + document.loginForm.id.value + "\n" + 
				"비밀번호 : " + document.loginForm.pw.value);
	}
</script>
<body>
	<h3>JavaScript 버전</h3>
	<form name="loginForm">
		아이디: <input type="text" name="id"/><br>
		비밀번호: <input type="text" name="pw"/><br>
		<input type="submit" value="전송" onclick="CheckForm()"/>
	</form>
	
	<h3>Jquery 버전</h3>
	<form name="loginForm2" id="loginForm2">
		아이디: <input type="text" name="id2"/><br>
		비밀번호: <input type="text" name="pw2"/><br>
<!-- 		<input type="submit" value="전송" id="submitBtn" onclick="CheckFormJquery()"/> -->
		<input type="submit" value="전송" id="submitBtn" />
	</form>
</body>
</html>