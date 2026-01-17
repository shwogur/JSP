<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select 'E'||to_char(max(substr(equip_no,2,5)+1), 'fm00000') from tbl_lab_equip_001";

	stmt = con.prepareStatement(sql);
	rs = stmt.executeQuery();
	
	String sql1 = "select lab_no, lab_name from tbl_lab_001";
	
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
			<h2>장비등록</h2>
			<form action="action.jsp" name="form" method="post" onsubmit="return validCheck()">
				<table>
					<%while(rs.next()){ %>
					<tr>
						<th>장비번호(자동발생)</th>
						<td><input type="text" name="equip_no" value="<%=rs.getString(1) %>" readonly></td>
					</tr>
					<%
					}
					rs.close();
					stmt.close();
					%>
					<tr>
						<th>장비명</th>
						<td><input type="text" name="equip_name"></td>
					</tr>
					<tr>
						<th>실험실명</th>
						<td><select name="lab_name">
							<%while(rs1.next()){%>
							<option value="<%=rs1.getString(1) %>"><%=rs1.getString(2) %></option>
							<%
							}
							%>
						</select></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit" value="등록"></td>
					</tr>
				</table>
			</form>
		</section>
	<%@include file="footer.jsp" %>
</body>
<script type="text/javascript">
	function validCheck(){
		if(!form.equip_name.value){
			alert('장비명이 입력되지 않았습니다.')
			form.equip_name.focus()
			return false
		}
		if(!form.lab_name.value){
			alert('실험실명이 입력되지 않았습니다.')
			form.lab_name.focus()
			return false
		}
		alert('등록이 완료되었습니다.')
		return true
	}
</script>
</html>