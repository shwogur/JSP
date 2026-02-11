<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select equip_id, equip_name from tbl_equipment_001";

	stmt = con.prepareStatement(sql);
	rs = stmt.executeQuery();
	
	String sql1 = "select user_id, user_name from tbl_user_001";
	
	PreparedStatement stmt1 = con.prepareStatement(sql1);
	ResultSet rs1 = stmt1.executeQuery();
	
	String sql2 = "select 'R'||to_char(max(substr(resv_id,2,3)+1), 'fm000') from tbl_reservation_001";
	
	PreparedStatement stmt2 = con.prepareStatement(sql2);
	ResultSet rs2 = stmt2.executeQuery();
	rs2.next();
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
		<h2>장비 예약</h2>
		<form action="action.jsp" name="form" method="post" onsubmit="return validCheck()">
			<table>
				<tr>
					<input type="hidden" name="resv_id" value="<%=rs2.getString(1) %>">
				</tr>
				<tr>
					<th>장비명</th>
					<td><select name="equip_id">
						<option value="0">선택안함</option>
						<%
						while(rs.next()){
						%>
						<option value="<%=rs.getString(1) %>"><%=rs.getString(2) %></option>
						<%
						}
						%>
					</select></td>
				</tr>
				<tr>
					<th>사용자</th>
					<td><select name="user_id">
						<option value="0">선택안함</option>
						<%
						while(rs1.next()){
						%>
						<option value="<%=rs1.getString(1) %>"><%=rs1.getString(2) %></option>
						<%
						}
						%>
					</select></td>
				</tr>
				<tr>
					<th>예약시간</th>
					<td><input type="date" name="resv_time"></td>
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
		if(form.equip_id.value == "0"){
			alert('장비가 선택되지 않았습니다.')
			form.equip_id.focus()
			return false
		}
		if(form.user_id.value == "0"){
			alert('사용자가 선택되지 않았습니다.')
			form.user_id.focus()
			return false
		}
		if(!form.resv_time.value){
			alert('예약시간이 입력되지 않았습니다.')
			form.resv_time.focus()
			return false
		}
		alert('등록되었습니다.')
		return true
	}
</script>
</html>