<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@include file="header.jsp" %>
	<%@include file="nav.jsp" %>
	<section>
		<h2>조회화면(전체)</h2>
		<table class="tbl-candidate">
			<tr>
				<th>후보번호</th>
				<th>학번</th>
				<th>성명</th>
				<th>성별</th>
			</tr>
			<tr>
				<td>1</td>
				<td>20300</td>
				<td>홍길동</td>
				<td>남</td>
			</tr>
			<tr>
				<td>2</td>
				<td>20400</td>
				<td>고길동</td>
				<td>여</td>
			</tr>
		</table>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>