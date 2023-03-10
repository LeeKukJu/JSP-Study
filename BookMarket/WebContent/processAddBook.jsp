<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>

<%
	request.setCharacterEncoding("UTF-8");
 	
 	String filename = "";
 	String realFolder = request.getServletContext().getRealPath("/resources/images");
 	String encType = "UTF-8";
 	
 	int maxSize = 5 * 1024 * 1024;
 	
 	File file = new File(realFolder);
 	if(!file.exists()){
		file.mkdirs();
	}
 	
 	DiskFileUpload upload = new DiskFileUpload();
 	upload.setSizeMax(10 * 1024 * 1024);
	upload.setSizeThreshold(maxSize);
	upload.setRepositoryPath(realFolder);
	
	List items = upload.parseRequest(request);
	Iterator params = items.iterator();
	
	
	String bookId = ""; 		
	String name = "";			
	String unitPrice = "";			
	String description = "";
	String author = "";
	String publisher = "";	
	String releaseDate = "";
	String totalPages = "";
	String category = ""; 
	String unitsInStock = "";
	String condition = ""; 		
	
	
	while(params.hasNext()){
		FileItem item = (FileItem) params.next();
		if(item.isFormField()){
			String fieldName = item.getFieldName();
			
			if(fieldName.equals("bookId")){
				bookId = item.getString(encType);
			}else if(fieldName.equals("name")){
				name = item.getString(encType);
			}else if(fieldName.equals("unitPrice")){
				unitPrice = item.getString(encType);
			}else if(fieldName.equals("description")){
				description = item.getString(encType);
			}else if(fieldName.equals("author")){
				author = item.getString(encType);
			}else if(fieldName.equals("publisher")){
				publisher = item.getString(encType);
			}else if(fieldName.equals("totalPages")){
				totalPages = item.getString(encType);
			}else if(fieldName.equals("category")){
				category = item.getString(encType);
			}else if(fieldName.equals("unitsInStock")){
				unitsInStock = item.getString(encType);
			}else if(fieldName.equals("condition")){
				condition = item.getString(encType);
			}
		}else{
			String fileFieldName = item.getFieldName();
			filename = item.getName();	// ?????? ????????? ??????
			String contentType = item.getContentType();
			String originalFileName = filename;
			long fileSize = item.getSize();
			File originalFile = new File(originalFileName);
			File saveFile = new File(realFolder + "/" + filename);
			item.write(saveFile);
			}
		}
		
		BookRepository dao = BookRepository.getInstance();
		Book book = new Book();
		book.setBookId(bookId);
		book.setName(name);
		book.setUnitPrice(Integer.parseInt(unitPrice));
		book.setDescription(description);
		book.setAuthor(author);
		book.setPublisher(publisher);
		book.setReleaseDate(releaseDate);
		book.setTotalPages(Integer.parseInt(totalPages));
		book.setCategory(category);
		book.setUnitsInStock(Integer.parseInt(unitsInStock));
		book.setCondition(condition);
		book.setFilename(filename);
		dao.addBook(book);
		response.sendRedirect("books.jsp");
%>