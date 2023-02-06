<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Upload</title>
</head>
<body>
	<form action="fileupload04_process.jsp" method="post" enctype="multipart/form-data">
		이름 : <input type="text" name="name"><br>
		제목 : <input type="text" name="subject"><br>
		파일 : <input type="file" name="filename" multiple="multiple"/><br> 
		<input type="submit" value="파일 올리기">
	</form>
</body>
</html>