<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select rider_id, rider_name from tbl_rider_001";

	stmt = con.prepareStatement(sql);
	rs = stmt.executeQuery();
	
	String sql1 = "select store_id, store_name from tbl_store_001";
	
	PreparedStatement stmt1 = con.prepareStatement(sql1);
	ResultSet rs1 = stmt1.executeQuery();
	
	String sql2 = "select max(delivery_id)+1 from tbl_delivery_001";
	
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
		<h2>배달 기록 등록</h2>
		<form action="action.jsp" name="form" method="post" onsubmit="return validCheck()">
		<table>
			<tr>
				<input type="hidden" name="delivery_id" value="<%=rs2.getString(1) %>">
			</tr>
			<tr>
				<th>배달 기사</th>
				<td><select name="rider_id">
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
				<th>배달 지점</th>
				<td><select name="store_id">
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
				<th>배달비</th>
				<td><input name="base_fee"></td>
			</tr>
			<tr>
				<th>배달 유형</th>
				<td>
					<input type="radio" name="single_yn" value="Y">한집 배달(+2000원)
					<input type="radio" name="single_yn" value="N">일반 배달
				</td>
			</tr>
			<tr>
				<th>배달 일자</th>
				<td><input type="date" name="delivery_date"></td>
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
		if(form.rider_id.value == "0"){
			alert('배달 기사를 선택하지 않았습니다.')
			form.rider_id.focus()
			return false
		}
		if(form.store_id.value == "0"){
			alert('배달 지점을 선택하지 않았습니다.')
			form.store_id.focus()
			return false
		}
		if(!form.base_fee.value){
			alert('배달비를 입력하지 않았습니다.')
			form.base_fee.focus()
			return false
		}
		if(!form.single_yn.value){
			alert('배달유형을 입력하지 않았습니다.')
			form.single_yn[1].focus()
			return false
		}
		if(!form.delivery_date.value){
			alert('배달 일자를 입력하지 않았습니다.')
			form.delivery_date.focus()
			return false
		}
		alert('등록이 완료되었습니다.')
		return true
	}
</script>
</html>