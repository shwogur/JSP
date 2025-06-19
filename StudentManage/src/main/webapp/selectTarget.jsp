<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./js/main.js"></script>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@include file="header.jsp" %>
	<%@include file="nav.jsp" %>
	<section>
		<h2>조회화면(선택)</h2>
		<form action="selectTargetResult.jsp" onsubmit="return fnselect()">
		<table>
			<tr>
				<th>조회항목</th>
				<td><select id="soption" name="soption">
					<option value=0>선택하세요</option>
					<option value="1">학번</option>
					<option value="2">성명</option>
				</select></td>
			</tr>
			<tr>
				<th>조회내용</th>
				<td>
					<input type="text" id="selec" name="selec">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="조회">
				</td>
			</tr>
		</table>
		</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>