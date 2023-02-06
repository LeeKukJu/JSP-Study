<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<%!
		int dan;
		String color = "";
	%>
		<%
		for(int i = 1; i <= 9; i++){
			for(int j = 1; j <= 9; j++){
				if(i % 2 == 0){
					color = "red";
				}else{
					color = "black";
				}
				dan = i * j;
				out.println("<tr>");
				out.println("<td><font color='" + color + "'> " + i + " x " + j + "=" + dan + "</font></td>"); 
				out.println("</tr>");
			}
		}
	%>
	</table>

</body>
</html>