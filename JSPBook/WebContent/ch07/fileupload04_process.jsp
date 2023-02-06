<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = "D:\\upload";
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
		
		if(item.isFormField()){ // 폼페이지에서 전송된 요청 파라미터가 일반 데이터라면
			String name = item.getFieldName(); // 파라미터 이름
			String value = item.getString("utf-8"); // 파라미터의 값
			out.println(name + "=" + value + "<br>");
		}else{ // 파일 데이터라면
			String fileFieldName = item.getFieldName();
			String fileName = item.getName();
			String contentType = item.getContentType(); // 파일 콘텐츠타입(Mime type)
			long fileSize = item.getSize(); // 파일크기
			
			File file = new File(path + "/" + fileName);
			
			if(maxSize < fileSize){
				out.println("파일 크기를 초과하였습니다! <br>");
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