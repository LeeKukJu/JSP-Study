<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Upload</title>
</head>
<body>
	<!-- 
		파일 업로드 패키지인 Commons-fileupload는 서버의 메모리상에서 파일 처리가 가능하도록 지원함
		이 패키지는 Commons-io 패키지를 바탕으로 작성되었으므로 웹 브라우저에서 서버로 파일을 업로드하기 위해
		오픈 라이브러리 commons-fileupload.jar, commons-io.jar 파일을 사용해야 함.
		JSP 페이지에 page 디렉티브 태그의 import 속성을 사용하여 패키지 org.apache.commons.fileupload.*를 설정
		
		웹 애플리케이션의 /WebContent/WEB_INF/lib 폴더에 commons-fileupload.jar, commons-io.jar 파일을 포함
		또는
		서버 톰캣의 / common/lib 폴더와 자바 JDK의 lib 폴더에 두 파일을 포함함.
	 -->
	<form action="fileupload03_process.jsp" method="post" enctype="multipart/form-data">
		<!-- 파일을 입력 받도록 input 태그의 type 속성을 file로 작성하고, name 속성을 작성함 -->
		파일 : <input type="file" name="filename"/><br> 
		<!-- 입력된 데이터를 서버로 전송하도록 input 태그의 type 속성 값을 submit로 작성함 -->
		<input type="submit" value="파일 전송">
	</form>
</body>
</html>