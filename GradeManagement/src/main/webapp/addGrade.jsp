<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp"%>
<%
String sql = "select to_char(sysdate, 'yyyy'), case when to_number(to_char(sysdate, 'mm')) between 1 and 7 then '1' else '2' end from dual";

stmt = con.prepareStatement(sql);
rs = stmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@include file="header.jsp"%>
	<%@include file="nav.jsp"%>
	<section>
		<h2>성적등록</h2>
		<form action="action2.jsp" name="form" method="post" onsubmit="return validation()">
			<table>
				<%
				String sdate = "";
				String semester = "";
				if (rs.next()) {
					sdate = rs.getString(1);
					semester = rs.getString(2);
				}
				rs.close();
				stmt.close();
				%>
				<tr>
					<th>시험시기</th>
					<td><input type="text" name="sdate" value="<%=sdate%>" readonly></td>
					<th>학기</th>
					<td><input type="text" name="semester" value="<%=semester%>" readonly></td>
				</tr>
				<tr>
					<th>학번</th>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>과목</th>
					<td colspan="3" align="center"><input type="radio" name="sno" value="1">국어 
					<input type="radio" name="sno" value="2">영어 
					<input type="radio" name="sno" value="3">수학 
					<input type="radio" name="sno" value="4">공간
					</td>
				</tr>
				<tr>
					<th>시험종류</th>
					<td colspan="3" align="center"><input type="radio" name="stype" value="1">중간 <input
						type="radio" name="stype" value="2">기말</td>
				</tr>
				<tr>
					<th>성적</th>
					<td><input type="text" name="score" min="0" max="100"></td>
				</tr>
				<tr>
				<td colspan="4" align="center"><input type="submit" value="등록"></td>
				</tr>
			</table>
		</form>
	</section>
	<%@include file="footer.jsp"%>
</body>
<script type="text/javascript">
	function validation(){
		if(!form.id.value){
			alert('학번이 입력되지 않았습니다.')
			form.id.focus()
			return false
		}
		if(!form.name.value){
			alert('이름이 입력되지 않았습니다.')
			form.name.focus()
			return false
		}
		if(!form.sno.value){
			alert('과목이 선택되지 않았습니다.')
			form.sno.focus()
			return false
		}
		if(!form.stype.value){
			alert('시험종류가 선택되지 않았습니다.')
			form.stype.focus()
			return false
		}
		if(!form.grade.value){
			alert('성적이 입력되지 않았습니다.')
			form.grade.focus()
			return false
		}
		alert('등록되었습니다.')
		return true
	}
</script>
</html>