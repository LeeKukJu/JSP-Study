<%@ page contentType="text/html; charset=utf-8" %>
<nav class="navbar navbar-expand  navbar-dark bg-dark">
	<div class="container">			
		<div class="navbar-header">
			<a class="navbar-brand" href="./welcome.jsp">Home</a>
			<a class="navbar-brand" href="./addBook.jsp">Add</a>
			<a class="navbar-brand" href="./books.jsp">List</a>
			<%
				if(request.getRemoteUser() != null){
			%>
			<a class="navbar-brand" href="./logout.jsp">Logout</a>
			<%	
				}
			%>
		</div>
	</div>	
</nav>