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
		<h2>학습자 학습 기록 상세</h2>
		<form action="studyLogList.jsp" name="form" method="get">
			<table>
				<tr>
					<th>학생 이름 입력</th>
					<td><input name="student_name"></td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input type="submit" value="검색">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>