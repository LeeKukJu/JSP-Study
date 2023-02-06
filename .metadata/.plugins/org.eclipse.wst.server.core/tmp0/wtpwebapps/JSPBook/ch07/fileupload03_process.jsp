<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 폼 페이지에서 전송된 파일을 저장할 서버의 경로를 작성
		String fileUploadPath = "D:\\upload";
		
		File tempFile = new File(fileUploadPath);
		if(!tempFile.exists()){ // 설정한 결로에 폴더가 없으면
			tempFile.mkdirs();
		}
		// Commons-FileUpload를 이용하여 파일을 업로드하려면 먼저 Common-fileupload
		// 파일 업로드를 위해 패키지에 포함되어 있는 DiskFileupload 객체를 생성함
		DiskFileUpload upload = new DiskFileUpload();
		// 생성된 객체를 통해 DiskFileUpload 클래스가 제공하는 메소드를 사용하여 웹 브라우저가 전송한
		// multipart/form-data 유형의 요청 파라미터를 가져옴
		// 폼 페이지에서 전송된 요청 파라미터를 전달받도록 DiskFileUpload 객체 타입의 parseRequest() 메소드를 작성
		List items = upload.parseRequest(request);
		// 폼 페이지에서 전송된 요청 파라미터를 Iterator 클래스로 변환
		Iterator params = items.iterator();
		
		// 폼 페이지에서 전송된 요청 파라미터가 없을 때까지 반복하도록 Iterator 객체 타입의 hasNext() 메소드를 작성
		while(params.hasNext()){
			FileItem fileItem = (FileItem) params.next();
			
			// FileItem 클래스의 메소드를 사용하여 요청 파라미터가 일반 데이터인지 파일인지 분석 및 처리하여 파일을 업로드함
			if(!fileItem.isFormField()){ // 파일이면
				String fileName = fileItem.getName(); // 파일명
	%>
				<p><%=fileName %>이 저장되었습니다!</p>
	<%			
				// 이곳으로 업로드 된다(최종) ::: D:\\upload\chopa.jpg
				File file = new File(fileUploadPath + "/" + fileName);
				fileItem.write(file);
			}
		}
	%>
</body>
</html>