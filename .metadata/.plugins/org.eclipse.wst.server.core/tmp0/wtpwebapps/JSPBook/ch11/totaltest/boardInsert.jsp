<%@page import="dao.BoardDAO"%>
<%@page import="dto.BoardVO"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page errorPage="exceptionBoard_error.jsp"%>

	<!-- 
	넘겨받은 게시글 데이터를 이용하여 게시글 등록을 진행해주세요.
	등록이 실패하여 에러가 발생 할 경우, exceptionBoard_error.jsp 페이지로 이동할 수 있게 해주세요.
	
	등록이 완료되면 작성한 게시글 상세정보 페이지(boardView)로 이동해주세요.
	이동하여 새롭게 작성된 게시글 내용으로 상세정보 페이지를 보여주세요.
 -->
	
<%
	String path = request.getServletContext().getRealPath("/resources/images");
	System.out.println(path);
	File tempFile = new File(path);
	
	if(!tempFile.exists()){
		tempFile.mkdirs();
	}
	
	DiskFileUpload upload = new DiskFileUpload();
	upload.setFileSizeMax(8 * 1024 * 1024);	//최대 크기
	upload.setSizeThreshold(4096);	//메모리상에 저장할 최대 크기(byte) - 버퍼 영역
	upload.setRepositoryPath(path);	//업로드된 파일을 임시로 저장할 경로()
	
	List items = upload.parseRequest(request);
	Iterator params = items.iterator();
	
	Map<String, Object> dataMap = new HashMap<String, Object>();
	boolean fileFlag = false;
	
	int maxSize = 4 * 1024 * 1024;	//4MB
	
	while (params.hasNext()) {
		FileItem item = (FileItem) params.next();
		
		if (item.isFormField()) {	//폼 페이지에서 전송된 요청 파라미터가 일반 데이터이면..
			String name = item.getFieldName();	//파라미터의 이름
			String value = item.getString("utf-8");	//파라미터의 값
			dataMap.put(name, value);
			
		} else {	//폼 페이지에서 전송된 요청 파라미터가 파일이면..
			String fileFieldName  = item.getFieldName();	//요청 파라미터의 이름
			String filename = item.getName();	//저장 파일의 이름
			
			if(!filename.equals("")){
				File file = new File(path + "/" + filename);
				item.write(file);
				
				dataMap.put(fileFieldName, filename);
				fileFlag = true;
				
			}
		}
	}
	
	BoardVO board = new BoardVO();
	BoardDAO boardDAO = BoardDAO.getInstance();
	String boardId = dataMap.get("id").toString();
	
	board.setId(dataMap.get("id").toString());
	board.setTitle(dataMap.get("title").toString());
	board.setAuthor(dataMap.get("author").toString());
	board.setContent(dataMap.get("content").toString());
	if(fileFlag){
		board.setFilename(dataMap.get("filename").toString());
	}
	
	boardDAO.insertBoard(board);
	
	response.sendRedirect("./boardView.jsp?id="+boardId);
%>	
