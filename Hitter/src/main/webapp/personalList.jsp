<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@include file="header.jsp" %>
	<%@include file="nav.jsp" %>
	<section>
		<h2>개별 타자 성적 조회</h2>
		<form action="hitterList.jsp" name="form" method="get" onsubmit="return validCheck()">
		<table>
			<tr>
				<th>선수 등록 코드를 입력 하시오.</th>
				<td><input name="registration_code"></td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input type="submit" value="선수조회">
					<button><a href="index.jsp">홈으로</a></button>
				</td>
			</tr>
		</table>
		</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
<script type="text/javascript">
	function validCheck(){
		if(!form.registration_code.value){
			alert('선수 등록 코드가 입력되지 않았습니다.')
			form.registration_code.focus()
			return false
		}
		return true
	}
</script>
</html>