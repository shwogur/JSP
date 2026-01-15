<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select 'D'||to_char(max(substr(ship_no, 2,5)+1), 'fm00000') from tbl_delivery_001";

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
	<%@include file="header.jsp" %>
	<%@include file="nav.jsp" %>
	<section>
		<h2>배송 등록</h2>
		<form action="action.jsp" name="form" method="post" onsubmit="return validCheck()">
			<table>
			<% while(rs.next()){ %>
				<tr>
					<th>배송번호(자동발생)</th>
					<td><input type="text" name="ship_no" value="<%=rs.getString(1) %>" readonly></td>
				</tr>
				<tr>
					<th>수령인</th>
					<td><input type="text" name="recv_nm"></td>
				</tr>
				<tr>
					<th>배송일</th>
					<td><input type="date" name="ship_dt"></td>
				</tr>
				<tr>
					<th>배송지</th>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="등록"></td>
				</tr>
				<%
				}
				stmt.close();
				con.close();
				%>
			</table>
		</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
<script type="text/javascript">
	function validCheck(){
		if(!form.ship_no.value){
			alert('배송번호가 입력되지 않았습니다.')
			form.ship_no.focus()
			return false
		}
		if(!form.recv_nm.value){
			alert('수령인이 입력되지 않았습니다.')
			form.recv_nm.focus()
			return false
		}
		if(!form.ship_dt.value){
			alert('배송일이 입력되지 않았습니다.')
			form.ship_dt.focus()
			return false
		}
		if(!form.address.value){
			alert('배송지가 입력되지 않았습니다.')
			form.address.focus()
			return false
		}
		alert('등록이 완료되었습니다.')
		return true
	}
</script>
</html>