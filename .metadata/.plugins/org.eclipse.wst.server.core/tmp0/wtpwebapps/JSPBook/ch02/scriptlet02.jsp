<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Scripting Tag</title>
</head>
<body>
	<h2>��ũ��Ʋ�� �±�</h2>
	<%
		// 0���� 10������ ¦���� ����ϵ��� ��ũ��Ʋ�� �±׸� ���
		for(int i = 0; i <= 10; i++){
			if(i % 2 == 0){
				out.println(i + "<br/>");
			}
		}
	%>
</body>
</html>