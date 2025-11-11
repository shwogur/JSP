<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp" %>
<%
	String sql = "select university_code, '['||university_code||']', university_name from tbl_university";

	stmt = con.prepareStatement(sql);
	rs = stmt.executeQuery();
	
	String sql1 = "select major_code, '['||major_code||']', major_name from tbl_major";
	
	PreparedStatement stmt1 = con.prepareStatement(sql1);
	ResultSet rs1 = stmt1.executeQuery();
%>
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
		<h2>원서 등록</h2>
		<form action="action.jsp" name="form" method="post" onsubmit="return validCheck()">
		<table>
			<tr>
				<th>주민 번호</th>
				<td><input type="text" name="regist_num">예)0211113000011</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>학교</th>
				<td><select name="university_code">
					<option value="">학교</option>
					<%
					while(rs.next()){
					%>
					<option value="<%=rs.getString(1) %>"><%=rs.getString(2) %><%=rs.getString(3) %></option>
					<%
					}
					rs.close();					
					stmt.close();
					%>
				</select></td>
			</tr>
			<tr>
				<th>학과</th>
				<td><select name="major_code">
					<option value="">학과</option>
					<%
					while(rs1.next()){
					%>
					<option value="<%=rs1.getString(1) %>"><%=rs1.getString(2) %><%=rs1.getString(3) %></option>
					<%
					}
					rs1.close();
					stmt1.close();
					%>
				</select></td>
			</tr>
			<tr>
				<th>수능 점수</th>
				<td><input type="number" min="0" max="100" name="s_score">0~100</td>
			</tr>
			<tr>
				<th>내신 점수</th>
				<td><input type="number" min="0" max="100" name="n_score">0~100</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="등록">
				<button type="reset" onclick="return resetAlert()">다시쓰기</button></td>
			</tr>
		</table>
		</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
<script type="text/javascript">
	function validCheck(){
		if(!form.regist_num.value){
			alert('주민번호를 입력하지 않았습니다.')
			form.regist_num.focus()
			return false
		}
		if(!form.name.value){
			alert('이름을 입력하지 않았습니다.')
			form.name.focus()
			return false
		}
		if(!form.university_code.value){
			alert('학교를 선택하지 않았습니다.')
			form.university_code.focus()
			return false
		}
		if(!form.major_code.value){
			alert('학과를 선택하지 않았습니다.')
			form.major_code.focus()
			return false
		}
		if(!form.s_score.value){
			alert('수능점수를 입력하지 않았습니다.')
			form.s_score.focus()
			return false
		}
		if(!form.n_score.value){
			alert('내신점수를 입력하지 않았습니다.')
			form.n_score.focus()
			return false
		}
		alert('수강신청이 정상적으로 완료되었습니다!')
		return true
	}
	function resetAlert(){
		alert('정보를 지우고 처음부터 다시 입력합니다!')
		return true
	}
</script>
</html>