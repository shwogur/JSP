<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
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
		<h2>개인별성적조회</h2>
		<form action="showStudent.jsp" name="form" method="get" onsubmit="return validCheck()">
			<table>
				<tr>
					<th>학생코드</th>
					<td><input name="student_id"></td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input type="submit" value="성적조회">
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
		if(!form.student_id.value){
			alert('학생코드가 입력되지 않았습니다!')
			form.student_id.focus()
			return false
		}
	}
</script>
</html>