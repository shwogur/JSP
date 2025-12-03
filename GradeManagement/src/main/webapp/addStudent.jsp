<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp"%>
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
	<h2>학생등록</h2>
	<form action="action.jsp" name="form" method="post" onsubmit="return validCheck()">
		<table>
			<tr>
				<th>학년</th>
				<td align="center"><input type="radio" name="grade" value="1학년">1학년
					<input type="radio" name="grade" value="2학년">2학년
					<input type="radio" name="grade" value="3학년">3학년
				</td>
			</tr>
			<tr>
				<th>반</th>
				<td align="center"><select name="classs">
					<option value="">반</option>
					<option value="1">3반</option>
					<option value="2">4반</option>
				</select></td>
			</tr>
			<tr>
				<th>이름</th>
				<td align="center"><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td align="center"><input type="radio" name="gender" value="남">남
					<input type="radio" name="gender" value="여">여				
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="등록"></td>
			</tr>
		</table>
	</form>
<%@include file="footer.jsp" %>
</section>
</body>
<script type="text/javascript">
	function validCheck(){
		if(!form.grade.value){
			alert('학년이 선택되지 않았습니다.')
			form.grade.focus()
			return false
		}
		if(!form.classs.value){
			alert('반이 선택되지 않았습니다.')
			form.classs.focus()
			return false
		}
		if(!form.name.value){
			alert('이름을 입력하지 않았습니다.')
			form.name.focus()
			return false
		}
		if(!form.gender.value){
			alert('성별이 선택되지 않았습니다.')
			form.gender.focus()
			return false
		}
		alert('등록되었습니다.')
		return true
		
	}
</script>
</html>