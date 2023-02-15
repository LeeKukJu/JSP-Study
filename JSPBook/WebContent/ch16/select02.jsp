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
<%@include file="dbconn.jsp" %>
<table border="1">
	<tr>
		<th>번호</th>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이름</th>
	</tr>
	<%
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try{
			String sql = "select * from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				String no = rs.getString("mem_no");
				String id = rs.getString("mem_id");
				String pw = rs.getString("mem_pw");
				String name = rs.getString("mem_name");
				
				// 가져온 아이디, 비밀번호, 이름을 차례차례 출력해준다.
			%>
				<tr>
					<td><%=no %></td>
					<td><%=id %></td>
					<td><%=pw %></td>
					<td><%=name %></td>
				</tr>
			<%
			}
			
		}catch(SQLException e){
			out.println("MEMBER 테이블 호출이 실패했습니다! <br>");
			out.println("SQLException : " + e.getMessage());
		}finally{
			if(rs != null)
				rs.close();
			
			if(pstmt != null)
				pstmt.close();
			
			if(conn != null)
				conn.close();
		}
	%>
</table>
</body>
</html>