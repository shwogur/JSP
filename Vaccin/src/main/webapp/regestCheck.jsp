<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백신접종예약 프로그램</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@include file="header.jsp"%>
	<%@include file="nav.jsp"%>
	<section>
		<h2>접중예약조회</h2>
		<form action="action2.jsp" name="form2" method="post"
			onsubmit="return validCheck2()">
			<table>
				<tr>
					<th>예약번호를 입력 하시오.</th>
					<td><input type="text" name="resvno"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="예약조회"> <a href="index.jsp"><button
								type="button">홈으로</button></a></td>
				</tr>
			</table>
		</form>
	</section>
	<%@include file="footer.jsp"%>
</body>
<script type="text/javascript">
	function validCheck2() {
		if (!form.resvno.value) {
			alert('예약번호가 입력되지 않았습니다')
			form.resvno.focus()
			return false
		}

		return true
	}
</script>
</html>