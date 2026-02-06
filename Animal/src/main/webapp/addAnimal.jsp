<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select 'A'||to_char(max(substr(animal_no,2,5)+1), 'fm00000') from tbl_animal_001";

	String sql1 = "select distinct a.shelter_no, s.shelter_name "
	 	  		+ " from tbl_shelter_001 s "
	   			+ " join tbl_animal_001 a "
	    		+ " on s.shelter_no = a.shelter_no";

	stmt = con.prepareStatement(sql);
	PreparedStatement stmt1 = con.prepareStatement(sql1);
	rs = stmt.executeQuery();
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
		<h2>동물 등록</h2>
		<form action="action.jsp" name="form" method="post" onsubmit="return validCheck()">
			<table>
				<%
				while(rs.next()){
				%>
				<tr>
					<th>동물번호(자동발생)</th>
					<td><input name="animal_no" value="<%=rs.getString(1) %>" readonly></td>
				</tr>
				<%
				}
				rs.close();
				stmt.close();
				%>
				<tr>
				<tr>
					<th>동물명</th>
					<td><input name="animal_name"></td>
				</tr>
				<tr>
					<th>구조일</th>
					<td><input type="date" name="rescue_dt"></td>
				</tr>
				<tr>
					<th>종류</th>
					<td><input name="kind"></td>
				</tr>
				<tr>
					<th>보호소</th>
					<td><select name="shelter_no">
						<option value="0">보호소</option>
						<%
						while(rs1.next()){
						%>
						<option value="<%=rs1.getString(1) %>"><%=rs1.getString(2) %></option>
						<%
						}
						rs1.close();
						stmt1.close();
						con.close();
						%>
					</select></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><input type="submit" value="등록"></td>
				</tr>
			</table>
		</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
<script type="text/javascript">
	function validCheck(){
		if(!form.animal_name.value){
			alert('동물명이 입력되지 않았습니다.')
			form.animal_name.focus()
			return false
		}
		if(!form.rescue_dt.value){
			alert('구조일이 입력되지 않았습니다.')
			form.rescue_dt.focus()
			return false
		}
		if(!form.kind.value){
			alert('종류가 입력되지 않았습니다.')
			form.kind.focus()
			return false
		}
		if(form.shelter_no.value == '0'){
			alert('보호소가 선택되지 않았습니다.')
			form.shelter_no.focus()
			return false
		}
		alert('등록 되었습니다.')
		return true
	}
</script>
</html>