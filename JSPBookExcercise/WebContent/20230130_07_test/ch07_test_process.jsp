<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	문제1) ch07_test.jsp에서 넘긴 데이터를 아래와 같이 출력해주세요.
	(*** 출력은 문제 3참고!!)
	
	[이미지] < 넘긴 이미지를 이미지 태그를 이용하여 출력해주세요.
	아이디 : a001
	비밀번호 : 1234
	이름 : 홍길동
	연락처 : - 1234 - 1234
	성별 : 남성
	가입인사 : 3123412341234
		
	문제2) 해당 페이지로 넘어온 파라미터들을 중간 처리 후 core 태그를 이용하여 저장(c:set)하고
		최종 EL로 출력해주세요.

	문제3) 아래 내용에 따른 메세지를 출력해주세요.
	
		3-1) 프로필 이미지를 선택하지 않고 전송 시, '프로필 이미지를 선택하지 않았습니다.' 메세지를 출력하고,
			프로필 이미지를 선택하고 전송 시, 정상 진행합니다.
		3-2) 프로필 이미지를 선택하고 정상적으로 전송 했을때, 
			업로드 한 파일의 사이즈 최대 크기(4MB) 초과 시  '이미지 크기를 초과하여 이미지를 출력할 수 없습니다' 메세지를 출력합니다.
 -->
<%
	String path = request.getServletContext().getRealPath("/resources/images");
	File tempFile = new File(path);
	
	if(!tempFile.exists()){
		tempFile.mkdirs();
	}
	
	DiskFileUpload upload = new DiskFileUpload();
	upload.setSizeMax(30000000);	//최대 크기
	upload.setSizeThreshold(1024);	//메모리상에 저장할 최대 크기(byte) - 버퍼 영역
	upload.setRepositoryPath(path);	//업로드된 파일을 임시로 저장할 경로()
	List items = upload.parseRequest(request);
	Iterator params = items.iterator();
	
	// 출력을 위한 Map 공간
	Map<String, Object> dataMap = new HashMap<String,Object>();
	
	// 파일 업로드 max 사이즈 설정
	int maxSize = 4 * 1024 * 1024;	//4MB
	boolean imgFlag = false;
	String msg = null;
	
	while (params.hasNext()) {
		FileItem item = (FileItem) params.next();
		
		if (item.isFormField()) {	//폼 페이지에서 전송된 요청 파라미터가 일반 데이터이면..
			String name = item.getFieldName();	//파라미터의 이름
			String value = item.getString("utf-8");	//파라미터의 값
			dataMap.put(name, value);
		} else {	//폼 페이지에서 전송된 요청 파라미터가 파일이면..
			String fileFieldName  = item.getFieldName();	//요청 파라미터의 이름
			String fileName = item.getName();	//저장 파일의 이름
			if(!fileName.equals("")){
				String contentType = item.getContentType();	//퍼일 콘텐츠 유형
				fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
				long fileSize = item.getSize();	//파일 크기 정보
				File file = new File(path + "/" + fileName);
				
				// 파일 최대 사이즈 초과 시 알림!
				if(maxSize < fileSize){
					out.println("<marquee style='color:red;'>이미지 크기를 초과하였습니다!</marquee><br/>");
				}else{
					item.write(file);
					imgFlag = true;
					dataMap.put(fileFieldName, fileName);
					
					out.println("-----------------------------------<br>");
					out.println("요청 파라미터 이름 : " + fileFieldName  + "<br>");
					out.println("저장 파일 이름 : " + fileName + "<br>");
					out.println("파일 콘텐츠 타입 : " + contentType + "<br>");
					out.println("파일 크기 : " + fileSize + "<br/>");
				}
			}else{
				msg = "프로필 이미지를 선택하지 않았습니다.";
			}
		}
	}
%>
<c:set value="<%=dataMap %>" var="datamap"/>
<c:set value="<%=imgFlag %>" var="flag"/>
<c:set value="<%=msg %>" var="message"/>
<c:if test="${message != null }">
	<p>${message }</p>
</c:if>
<c:if test="${message == null }">
	<c:if test="${flag }">
		<img src="/JSPBook/resources/images/${datamap.filename }"/>
	</c:if>
	<c:if test="${!flag }">
		<p>이미지 크기를 초과하여 이미지를 출력할 수 없습니다</p>
	</c:if>
</c:if>
<p>아이디 : ${datamap.mem_id }</p>
<p>비밀번호 : ${datamap.mem_pw }</p>
<p>이름 : ${datamap.mem_name }</p>
<p>연락처 : ${datamap.mem_phone1 } - ${datamap.mem_phone2 } - ${datamap.mem_phone3 }</p>
<p>성별 : ${datamap.mem_sex }</p>
<p>가입인사 : ${datamap.mem_comment }</p>

<a href="./ch07_test.jsp">뒤로</a>
</body>
</html>