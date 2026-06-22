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
		<h2>개별 기업 평가 조회</h2>
		<form action="companyList.jsp" name="form" method="get" onsubmit="return validCheck()">
		<table>
			<tr>
				<th>기업코드를 입력 하시오.</th>
				<td><input name="company_code"></td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input type="submit" value="평가조회">
					<button><a href="index.jsp">홈으로</a></button>
				</td>
			</tr>
		</table>
		</form>
	</section>
</body>
<script type="text/javascript">
	function validCheck(){
		if(!form.company_code.value){
			alert('기업 코드가 입력되지 않았습니다!')
			form.company_code.focus()
			return false
		}
	}
</script>
</html>