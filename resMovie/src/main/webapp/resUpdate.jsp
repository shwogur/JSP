<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String res_id = request.getParameter("res_id");

	String sql = "select r.res_id, c.cust_id, c.cust_name, m.movie_name, to_char(r.res_date, 'yyyy-mm-dd'), r.seat_no "
			   + " from tbl_movie m "
			   + " join tbl_reservation r "
			   + " on m.movie_id = r.movie_id "
			   + " join tbl_customer c "
			   + " on c.cust_id = r.cust_id "
			   + " where r.res_id = ?";
	
	stmt = con.prepareStatement(sql);
	stmt.setString(1, res_id);
	rs = stmt.executeQuery();
	
	String sql1 = "select movie_id, movie_name from tbl_movie";
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
		<h2>예매 등록 수정</h2>
		<form action="action2.jsp" name="form" method="get">
			<table>
				<%
				if(rs.next()){
				%>
				<tr>
					<th>예매번호</th>
					<td><input name="res_id" value="<%=rs.getString(1) %>" readonly></td>
				</tr>
				<tr>
					<th>고객ID</th>
					<td><input name="cust_id" value="<%=rs.getString(2) %>" readonly></td>
				</tr>
				<tr>
					<th>고객 성명</th>
					<td><input name="cust_name" value="<%=rs.getString(3) %>" readonly></td>
				</tr>
				<tr>
					<th>영화 선택</th>
					<td><select name="movie_id">
						<%
						while(rs1.next()){
						%>
						<option value="<%=rs1.getString(1)%>"
						<%= rs1.getString(2).equals(rs.getString(4)) ? "selected" : "" %>>
						<%=rs1.getString(2)%>
						</option>
						<%
						}
						%>
					</select></td>
				</tr>
				<tr>
					<th>예매일자</th>
					<td><input name="res_date" value="<%=rs.getString(5) %>"></td>
				</tr>
				<tr>
					<th>좌석번호</th>
					<td><input name="seat_no" value="<%=rs.getString(6) %>"></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><input type="submit" value="수정하기">
						<a href="resList.jsp"><input type="button" value="돌아가기"></a>
					</td>
				</tr>
				<%
				}
				%>
			</table>
		</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>