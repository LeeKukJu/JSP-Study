<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String filename = "";
	String realFolder = request.getServletContext().getRealPath("/resources/images"); //웹 어플리케이션상의 절대 경로
	String encType = "utf-8"; //인코딩 타입
	
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb
	
	File file = new File(realFolder);
	if(!file.exists()){
		file.mkdirs();
	}
	
	DiskFileUpload upload = new DiskFileUpload();
	upload.setSizeMax(1000000);	//최대 크기
	upload.setSizeThreshold(maxSize);	//메모리상에 저장할 최대 크기(byte)
	upload.setRepositoryPath(realFolder);	//업로드된 파일을 임시로 저장할 경로
	List items = upload.parseRequest(request);
	Iterator params = items.iterator();
	
	String productId = "";
	String name = "";
	String unitPrice = "";
	String description = "";
	String manufacturer = "";
	String category = "";
	String unitsInStock = "";
	String condition = "";
	String fileName = "";
	
	while (params.hasNext()) {
		FileItem item = (FileItem) params.next();
		if (item.isFormField()) {	//폼 페이지에서 전송된 요청 파라미터가 일반 데이터이면..
			String fieldName = item.getFieldName();	//파라미터의 이름
			if(fieldName.equals("productId"))
			 	productId = item.getString("utf-8");
			else if(fieldName.equals("name"))
			 	name = item.getString("utf-8");
			else if(fieldName.equals("unitPrice"))
				unitPrice = item.getString("utf-8");
			else if(fieldName.equals("description"))
				description = item.getString("utf-8");
			else if(fieldName.equals("manufacturer"))
				manufacturer = item.getString("utf-8");
			else if(fieldName.equals("category"))
				category = item.getString("utf-8");
			else if(fieldName.equals("unitsInStock"))
				unitsInStock = item.getString("utf-8");
			else if(fieldName.equals("condition"))
				condition = item.getString("utf-8");
		} else {	//폼 페이지에서 전송된 요청 파라미터가 파일이면..
			String fileFieldName  = item.getFieldName();	//요청 파라미터의 이름
			fileName = item.getName();	//저장 파일의 이름
			if(!fileName.equals("")){
				String contentType = item.getContentType();	//퍼일 콘텐츠 유형
				String originalFileName = fileName;
				fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
				long fileSize = item.getSize();	//파일 크기 정보
				File originalFile = new File(originalFileName);
				File saveFile = new File(realFolder + "/" + fileName);
				item.write(saveFile);
			}
		}
	}

	Integer price;
	if (unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);

	long stock;
	if (unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	if (!fileName.equals("")) {
		sql = 
				" UPDATE PRODUCT " +  
				" SET P_NAME = ?, P_UNITPRICE = ?, P_DESCRIPTION = ?, " + 
				" P_MANUFACTURER = ?, P_CATEGORY = ?, P_UNITSINSTOCK = ?, " + 
				" P_CONDITION = ?, P_FILENAME = ? WHERE P_ID = ?";	
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setInt(2, price);
		pstmt.setString(3, description);
		pstmt.setString(4, manufacturer);
		pstmt.setString(5, category);
		pstmt.setLong(6, stock);
		pstmt.setString(7, condition);
		pstmt.setString(8, fileName);
		pstmt.setString(9, productId);	
		pstmt.executeUpdate();
	} else {
		sql = 
				" UPDATE PRODUCT " + 
				" SET P_NAME=?, P_UNITPRICE=?, P_DESCRIPTION=?, P_MANUFACTURER=?, " + 
				" P_CATEGORY=?, P_UNITSINSTOCK=?, P_CONDITION=? WHERE P_ID = ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setInt(2, price);
		pstmt.setString(3, description);
		pstmt.setString(4, manufacturer);
		pstmt.setString(5, category);
		pstmt.setLong(6, stock);
		pstmt.setString(7, condition);
		pstmt.setString(8, productId);
		pstmt.executeUpdate();			
	}		
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("product.jsp?id="+productId);
%>


