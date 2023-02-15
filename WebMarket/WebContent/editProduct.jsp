<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
<title>상품 편집</title>
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 상품을 삭제합니다!!") == true)
			location.href = "./deleteProduct.jsp?id=" + id;
		else
			return;
	}
</script>
</head>
<%
	String edit = request.getParameter("edit");
%>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 편집</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp"%>
			<%
				PreparedStatement pstmt = null;	
				ResultSet rs = null;
				
				String sql = "SELECT * FROM PRODUCT";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			<div class="col-md-4">
				<img src="${pageContext.request.contextPath }/resources/images/<%=rs.getString("P_FILENAME")%>" style="width: 100%">
				<h3><%=rs.getString("P_NAME")%></h3>
				<p><%=rs.getString("P_DESCRIPTION")%>
				<p><%=rs.getString("P_UNITPRICE")%>원
				<p><%
						if (edit.equals("update")) {
					%>
					<a href="./updateProduct.jsp?id=<%=rs.getString("P_ID")%>" class="btn btn-success" role="button"> 수정 &raquo;></a>
					<%
						} else if (edit.equals("delete")) {
					%>
					<a href="#" onclick="deleteConfirm('<%=rs.getString("P_ID")%>')" class="btn btn-danger" role="button">삭제 &raquo;></a>
					<%
						}
					%>				
			</div>
			<%
				}
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			%>			
		</div>
		<hr>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>