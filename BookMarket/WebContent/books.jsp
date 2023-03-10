<%@page import="dto.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BookRepository"%>
<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>도서 목록</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">도서 목록</h1>
		</div>
	</div>
	<!--
		책 목록을 가져올 수 있도록 Repository 인스턴스를 활용해 책 전체 목록을 가져오세요.
		:: TODO
	-->
	<%
	BookRepository bookDAO = BookRepository.getInstance();
	ArrayList<Book> listOfBooks = bookDAO.getAllBooks();
	%>
	
	<div class="container">	

		<!--
			가져온 책 목록 데이터를 활용해 아래 책 데이터를 출력할 div 셋트로 목록 갯수만큼 출력해주세요.
			:: TODO
		-->
		<%
			for(int i = 0; i < listOfBooks.size(); i++){
				Book book = listOfBooks.get(i);
		%>
		<div class="row">
			<div class="col-md-3" align="center">
				<img src="${pageContext.request.contextPath }/resources/images/<%=book.getFilename() %>" width="60%"/>
			</div>
			<div class="col-md-10">	
				<p><h5 ><b><%=book.getCategory() %> <%=book.getName() %></b></h5>
				<p style="padding-top: 10px"><%=book.getDescription() %>... 
				<p><%=book.getAuthor() %> | <%=book.getPublisher() %> | <%=book.getUnitPrice() %>원
			</div>	
			<div class="col-md-2"  style="padding-top: 60px">						    			 
				<a href="./book.jsp?id=<%=book.getBookId() %>" class="btn btn-secondary" role="button"> 상세정보 &raquo;></a>				
			</div>				
		</div>
		<%		
			}
		%>
		<hr>
	</div>	
	<%@ include file="footer.jsp" %>
</body>
</html>
