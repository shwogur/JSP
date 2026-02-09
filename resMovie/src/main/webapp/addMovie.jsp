<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select movie_id, movie_name from tbl_movie";
	
	stmt = con.prepareStatement(sql);
	rs = stmt.executeQuery();
	
	String sql2 = "select cust_id, cust_name from tbl_customer";
	
	PreparedStatement stmt2 = con.prepareStatement(sql2);
	ResultSet rs2 = stmt2.executeQuery();
	
	String sql1 = "select max(res_id) +1 from tbl_reservation";
	
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
		<h2>예매 등록</h2>
		<form action="action.jsp" name="form" method="post" onsubmit="return validCheck()">
			<table>
				<%
				while(rs1.next()){
				%>
				<tr>
					<th>예매번호</th>
					<td><input name="res_id" value="<%=rs1.getString(1) %>" readonly></td>
				</tr>
				<%
				}
				%>
				<tr>
					<th>고객ID</th>
					<td><input name="cust_id"></td>
				</tr>
				<tr>
					<th>고객 성명</th>
					<td><select name="cust_name">
						<option value="0">고객 성명</option>
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
					<th>영화 선택</th>
					<td><select name="movie_id">
						<option value="0">영화</option>
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
					<th>예매일자</th>
					<td><input type="date" name="res_date"></td>
				</tr>
				<tr>
					<th>좌석번호</th>
					<td><input name="seat_no"></td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input type="submit" value="예매하기">
						<input type="reset" value="다시쓰기"> 
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
<script type="text/javascript">
	function validCheck(){
		if(!form.cust_id.value){
			alert('고객ID가 입력되지 않았습니다.')
			form.cust_id.focus()
			return false
		}
		if(form.cust_name.value == "0"){
			alert('고객 성명이 선택되지 않았습니다.')
			form.cust_name.focus()
			return false
		}
		if(form.movie_id.value == "0"){
			alert('영화가 선택되지 않았습니다.')
			form.movie_id.focus()
			return false
		}
		if(!form.res_date.value){
			alert('예매일자가 입력되지 않았습니다.')
			form.res_date.focus()
			return false
		}
		if(!form.seat_no.value){
			alert('좌석번호가 입력되지 않았습니다.')
			form.seat_no.focus()
			return false
		}
		alert('등록이 완료되었습니다.')
		return true
	}
</script>
</html>