<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Scripting Tag</title>
</head>
<body>
	<h2>Scripting Tag</h2>
	<%!
		// ���� �±׸� ����Ͽ� �ڹ� ������ �޼ҵ� ����
		int count = 3;
		 String makeItLower(String data){
			 return data.toLowerCase();
		 }
		 
	%>
	
	<%
		for(int i = 1; i <=count; i++){
			out.println("Java Server Pages " + i + "<br/>");
			
		}
	%>
	<!-- ǥ���� �±׷� ������ �޼ҵ带 ȣ���Ͽ� ���ڿ� ���·� ��� -->
	<%=makeItLower("Hello World!") %>
</body>
</html>