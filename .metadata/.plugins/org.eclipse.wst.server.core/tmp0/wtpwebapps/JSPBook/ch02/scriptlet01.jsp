<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Scripting Tag</title>
</head>
<body>
	<h2>��ũ��Ʈ�� �±�</h2>
	<%
		// ��ũ��Ʋ�� �±״� �ڹ� �ڵ�� �̷���� ���� �κ��� ǥ���ϸ�,
		// out ��ü�� ������� �ʰ� ���� Html ������ ����� �� �� �ִ�.
		// ��ũ��Ʋ�� �±״� ���� �Ϲ������� ���Ǹ� ���� �Ǵ� �޼��� ����, ��ȿ�� ��
		// �ټ��� ������ �� �ִ�.
		
		// �������� a, b�� ���� �����ϵ��� ��ũ��Ʋ�� �±׸� �ۼ���
		int a = 2;
		int b = 3;
		int sum = a + b;
		out.println("2 + 3 = " + sum);
	%>
	<hr/>
	<%	
		// �������� a, b�� 1�� ������Ŵ 
		a++;
		b++;
		sum = a + b;
		out.println("3 + 4 = " + sum);
	%>
</body>
</html>