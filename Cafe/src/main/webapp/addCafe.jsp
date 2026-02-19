<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select max(sale) +1 from tbl_sale_001";

	stmt = con.prepareStatement(sql);
	rs = stmt.executeQuery();
	rs.next();
	
	String sql1 = "select cafe_id, cafe_name from tbl_cafe_001";
	
	PreparedStatement stmt1 = con.prepareStatement(sql1);
	ResultSet rs1 = stmt1.executeQuery();
	
	String sql2 = "select drink_id, drink_name from tbl_drink_001";
	
	PreparedStatement stmt2 = con.prepareStatement(sql2);
	ResultSet rs2 = stmt2.executeQuery();
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
		<h2>카페 매출 관리 시스템</h2>
		<form action="action.jsp" name="form" method="post" onsubmit="return validCheck()">
		<table>
			<tr>
				<input type="hidden" name="sale" value="<%=rs.getString(1) %>">
			</tr>
			<tr>
				<th>카페</th>
				<td><select name="cafe_id">
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
				<th>스터디룸</th>
				<td><select name="drink_id">
					<option value="0">선택안함</option>
					<%
					while(rs2.next()){
					%>
					<option value="<%=rs2.getString(1) %>"><%=rs2.getString(2) %></option>
					<%
					}
					%>
				</select></td>
			</tr>
			<tr>
				<th>매출 등록 일자</th>
				<td><input type="date" name="sale_date"></td>
			</tr>
			<tr>
				<th>수량</th>
				<td><input name="quantity"></td>
			</tr>
			<tr>
				<td align="center" colspan="2">
				<input type="submit" value="등록">
				</td>
			</tr>
		</table>
		</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
<script type="text/javascript">
	function validCheck(){
		if(form.cafe_id.value == "0"){
			alert('카페를 선택하지 않았습니다.')
			form.cafe_id.focus()
			return false
		}
		if(form.drink_id.value == "0"){
			alert('음료를 선택하지 않았습니다.')
			form.drink_id.focus()
			return false
		}
		if(!form.sale_date.value){
			alert('매출 등록 일자를 선택하지 않았습니다.')
			form.sale_date.focus()
			return false
		}
		if(!form.quantity.value){
			alert('수량을 입력하지 않았습니다.')
			form.quantity.focus()
			return false
		}
		alert('등록이 완료되었습니다.')
		return true
	}
</script>
</html>