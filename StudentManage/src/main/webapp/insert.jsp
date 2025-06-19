<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="./js/main.js"></script>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@include file="header.jsp" %>
	<%@include file="nav.jsp" %>
	<section>
		<h2>후보등록</h2>
		<form action="insertAction.jsp" onsubmit="return fnvalidation()">
		<table>
			<tr>
				<th>후보번호</th>
				<td><input type="text" name="cdno" value="3" readonly></td>
			</tr>
			<tr>
				<th>학번</th>
				<td><input type="text" id="sno" name="sno"></td>
			</tr>
			<tr>
				<th>성명</th>
				<td><input type="text" id="snm" name="snm"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" id="gman" name="gender" value="0"><label for="gman">남자</label>
					<input type="radio" id="gwoman" name="gender" value="1"><label for="gwoman">여자</label>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="저장">
					<input type="reset" value="다시쓰기" onclick="fnreset()">
				</th>
			</tr>
		</table>
	</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>