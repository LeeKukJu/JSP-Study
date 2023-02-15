<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function updateBtn() {
	var form = document.frm;
	
	if(!confirm("정말로 수정하시겠습니까?")){
		return;
	}else{
		form.submit();
	}
}

function backBtn(){
	
	window.history.back();
}
</script>
</head>
<body>
<!-- 
	먼저 수정할 게시글 정보를 출력하고
	제목, 내용, 작성자를 수정하기위해 입력하고 게시글을 수정해주세요.
	
	제목, 내용, 날짜(수정한 현 날짜 시간)가 수정됩니다.
	
	제목 : 제목입니다.
	작성자 : a001
	-------------------
	내용 : ~~~~~
	-------------------
	[수정][취소]
 -->
 <%@include file="dbconn.jsp" %>
 <%
 	request.setCharacterEncoding("utf-8");
 
 	int no = Integer.parseInt(request.getParameter("no"));
 	
 	ResultSet rs = null;
	PreparedStatement pstmt = null;
 	
	try{
		String sql = "select * from notice where bo_no=" + no;
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			String title = rs.getString("bo_title");
			String writer = rs.getString("bo_writer");
			String content = rs.getString("bo_content");
			String date = rs.getString("bo_date");
		
 %>
 	<form action="update_process.jsp" method="post" name="frm">
		<input type="hidden" name="no" value="<%=no%>">
 		<table border="1">
 			<thead>
 				<tr>
 					<td>제목 : <input type="text" name="title" value="<%=title %>" placeholder="<%=title %>" ></td>
 				</tr>
 				<tr>
 					<td>작성자 : <%=writer %></td>
 				</tr>
 			</thead>
 			
 			<tbody>
 				<tr>
 					<td>
 						<textarea name="content" rows="10px" cols="100px"><%=content %></textarea>
 					</td>
 				</tr>
 			</tbody>
 		</table><br>
 		<button type="button" class="btn btn-primary"
						onclick="updateBtn();">수정하기</button>
		<button type="button" class="btn btn-primary"
						onclick="backBtn();">취소</button>
 	</form>
 <%
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
</body>
</html>