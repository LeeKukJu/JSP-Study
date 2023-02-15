<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function swapTR(tr1, tr2) {
		var temp = tr1.innerHTML;
		tr1.innerHTML = tr2.innerHTML;
		tr2.innerHTML = temp;
	}
</script>
</head>

<body>

	<table border="1" width="400" cellspacing="0" cellpadding="0">

		<tr onclick="swapTR(this, this.nextSibling)">

			<td>row 1, cell 1</td>
			<td>row 1, cell 2</td>

		</tr>
		<tr onclick="swapTR(this, this.previousSibling)">

			<td>row 2, cell 1</td>
			<td>row 2, cell 2</td>

		</tr>
	</table>
</body>
</html>