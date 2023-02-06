<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Implict Object</title>
</head>
<body>
	<!-- 
		process.jsp?name=개똥이
		?name=개똥이 : QueryString / 요청 파라미터 / HTTㅖ vkfkalxj
		name=개똥이 : 
	 -->

	<form action="process.jsp" method="post">
		<p>
			이름 : <input type="text" name="name"/>
			<input type="submit" value="전송">
		</p>
	</form>
</body>
</html>