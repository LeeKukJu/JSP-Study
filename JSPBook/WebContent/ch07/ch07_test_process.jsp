<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		문제1) 넘겨받은 데이터를 아래와 같이 출력해주세요.
		
		[이미지] < 넘긴 이미지를 이미지 태그를 이용하여 출력
		아이디 : a001
		비밀번호 : 1234
		이름 : 홍길동
		연락처 : 010-1234-1234
		성별 : 남성
		가입인사 :
		
		문제2) 해당 페이지로 넘어온 파라미터들은 core태그를 활용하고, EL 표현문으로 출력
		
		문제3) 아래 내용에 따른 메세지를 출력해주세요.
		
			3-1) 프로필 이미지를 선택하지 않고 전송 시, '프로필 이미지를 선택하지 않았습니다.' 메세지 출력
				프로필 이미지를 선택하고 전송 시, 정상 진행~~~
				
			3-2) 업로드 한 프로필 이미지 파일의 사이즈 크기가 4MB 초과 시, '이미지 크기를 초과하여 이미지를 출력할 수 없습니다.'
				메세지 출력
	 -->
	 
<%
	String path = request.getSession().getServletContext().getRealPath("/upload");
	System.out.println(path);
	File tempFile = new File(path);
	
	if(!tempFile.exists()){
		tempFile.mkdirs();
	}
	
	DiskFileUpload upload = new DiskFileUpload();
	
	upload.setSizeMax(5 * 1024 * 1024); // 업로드 할 파일의 최대 크기(byte)
	upload.setSizeThreshold(4096); 		// 메모리상에 저장할 최대 크기(byte)
	upload.setRepositoryPath(path); 	// 업로드된 파일을 임시로 저장할 경로
	
	List items = upload.parseRequest(request);
	Iterator params = items.iterator();
	
	int maxSize = 4 * 1024 * 1024; // 파일 업로드시 1개의 파일 당 사이즈(최대사이즈)
	while(params.hasNext()){
		FileItem item = (FileItem) params.next();
		
		if(item.isFormField()){ // 폼 페이지에서 전송된 요청 파라미터가 일반 데이터라면
			String name = item.getFieldName(); // 파라미터 이름
			String value = item.getString("utf-8"); // 파라미터의 값
// 			out.println(name + "=" + value + "<br>");
			request.setAttribute(name, value); //<<<<<<<<<<<<<<<<<<<<<<<<<추가한거 == c:set
	
		}else{ // 파일 데이터라면
			String fileFieldName = item.getFieldName();
			String fileName = item.getName();
// 			System.out.println("파일네임: " + fileName);
			
			String contentType = item.getContentType(); // 파일 콘텐츠타입(Mime type)
			long fileSize = item.getSize(); // 파일크기
			
			request.setAttribute("fileName", fileName); //<< 추가한거
			
			File file = new File(path + "/" + fileName);
			
			if(fileSize == 0){
				out.println("<span style=\"color:red\">프로필 이미지를 선택하지 않았습니다.</span> <br>");
			}else if(maxSize < fileSize){
				out.println("<span style=\"color:red\">이미지 크기를 초과하여 이미지를 출력할 수 없습니다.</span> <br>");
			}else{
				item.write(file); // 파일 업로드(쓰기)
			}
			
			out.println("-------------------------------------------------<br>");
			out.println("요청 파라미터 이름 :" + fileFieldName + "<br>");
			out.println("저장 파일 이름 :" + fileName + "<br>");
			out.println("파일 콘텐츠 타입 :" + contentType + "<br>");
			out.println("파일 크기 :" + fileSize + "<br>");
		}
	}
	
	
%>
<img alt="사진" src="<%=request.getContextPath()%>/upload/${fileName}" >
<p>아이디 : <c:out value="${id}"/></p>
<p>비밀번호 : <c:out value="${pw}"/></p>
<p>이름 : <c:out value="${name}"/></p>
<p>연락처 : <c:out value="${tel}"/></p>
<p>성별 : <c:out value="${sex}"/></p>
<p>소개 : <c:out value="${intro}"/></p>
</body>
</html>