<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp" %>
<%
	String sql = "select pk_bakery, name from tbl_bakery";

	stmt = con.prepareStatement(sql);
	rs = stmt.executeQuery();
	
	String sql1 = "select pk_bread, name from tbl_bread";
	
	PreparedStatement stmt1 = con.prepareStatement(sql1);
	ResultSet rs1 = stmt1.executeQuery();
	
	String sql2 = "select max(pk_sale) +1 from tbl_sale";
	
	PreparedStatement stmt2 = con.prepareStatement(sql2);
	ResultSet rs2 = stmt2.executeQuery();
	
	String sql3 = "select to_char(sysdate, 'yyyymmdd') from dual";
	
	PreparedStatement stmt3 = con.prepareStatement(sql3);
	ResultSet rs3 = stmt3.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제과점 매출관리 프로그램</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@include file="header.jsp" %>
	<%@include file="nav.jsp" %>
	<section>
		<h2>판매등록</h2>
		<form action="action.jsp" name="form" method="post"
		onsubmit="return validCheck()">
		<table>
			<%
			if(rs2.next()){
			%>
			<tr>
				<th>판매번호 (자동발생)</th>
				<td><input type="text" name="pk_sale" value="<%=rs2.getString(1) %>" readonly></td>
			</tr>
			<%
			}
			rs2.close();
			stmt2.close();
			%>
			<%
			if(rs3.next()){
			%>
			<tr>
				<th>판매일자 (자동발생)</th>
				<td><input type="text" name="deal_date" value="<%=rs3.getString(1) %>" readonly></td>
			</tr>
			<%
			}
			rs3.close();
			stmt3.close();
			%>
			<tr>
				<th>제과점</th>
				<td><select name="store">
				<option value="">선택</option>
				<%
				while(rs.next()){
				%>
				<option value="<%=rs.getString(1)%>"><%=rs.getString(2) %></option>
				<%
				}
				rs.close();
				stmt.close();
				%>
				</select></td>
			</tr>
			<tr>
				<th>제과</th>
				<td><select name="name">
				<option value="">선택</option>				
				<%
				while(rs1.next()){
				%>
				<option value="<%=rs1.getString(1)%>"><%=rs1.getString(2) %></option>
				<%
				}
				rs1.close();
				stmt1.close();
				%>
				</select></td>
			</tr>
			<tr>
				<th>판매수량</th>
				<td><input type="text" name="deal_count"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="등록">
				<button type="reset">조회</button></td>
			</tr>
		</table>
		</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
<script type="text/javascript">
	function validCheck(){
		if(!form.store.value){
			alert('제과점을 선택하지 않았습니다.')
			form.store.focus()
			return false
		}
		if(!form.name.value){
			alert('제과를 선택하지 않았습니다.')
			form.name.focus()
			return false
		}
		if(!form.deal_count.value){
			alert('판매수량을 입력하지 않았습니다.')
			form.deal_count.focus()
			return false
		}
		alert('판매등록이 정상적으로 되었습니다.')
		return true
	}
</script>
</html>