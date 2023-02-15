<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
	아래와 같이 출력하고, 수정 삭제 목록 기능을 작성해주세요.
	
	제목 : ~~~
	작성자 : ~~~~
	---------------
	내용 : ~~~~
	---------------
	[수정][삭제][목록]
 -->

	<%@ include file="dbconn.jsp"%>

	<%
	int no = Integer.parseInt(request.getParameter("no"));
	
	%>
	<c:set var="no" value="<%=no %>"/>
	<div class="container" align="center">

		<table class="table">
		<%
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			
			try{
				String sql = "select * from notice where bo_no=" + no;
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					String title = rs.getString("bo_title");
					String content = rs.getString("bo_content");
					String writer = rs.getString("bo_writer");
					String date = rs.getString("bo_date");
// 					String hit = rs.getString("bo_hit");
		%>
			<thead>
				<tr>
					<th colspan="2">
						<h3>
							제목 : <%=title %><br>
							작성자 : <%=writer %>
						</h3>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr colspan="2">
					<td height="450px">
						<%=content%>
					</td>
				</tr>
		<%
				}
				if(request.getParameter("hit") != null){
					int hit = Integer.parseInt(request.getParameter("hit"));
					hit++;
					String usql = "update notice set bo_hit = ? where bo_no = ?";
					pstmt = conn.prepareStatement(usql);
					pstmt.setInt(1, hit);
					pstmt.setInt(2, no);
					pstmt.executeUpdate();
				}
			}catch(SQLException e){
				System.out.println("SQLException : " + e.getMessage());
			}finally{
				if(rs != null)
					rs.close();
				
				if(pstmt != null)
					pstmt.close();
				
				if(conn != null)
					conn.close();
			}
		%>
				<tr>
					<td><a class="btn btn-primary" href="./list.jsp"
						role="button">목록 이동</a></td>
					<td align="right"><a class="btn btn-primary"
						href="./update.jsp?no=${no}" role="button">수정하기</a>
						<a class="btn btn-primary" href="./delete.jsp?no=${no}"
						role="button" onclick="delBtn();">삭제하기</a></td>
				</tr>
			</tbody>
		</table>
	</div>

<script type="text/javascript">
function delBtn() {
	
	if(!confirm("정말로 삭제하시겠습니까?")){
		return;
	}else{
		location.href("./delete.jsp?no=<%=no%>")
	}
	
}
</script>
</body>
</html>