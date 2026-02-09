<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select r.res_id, c.cust_name, m.movie_name, to_char(r.res_date, 'yyyy-mm-dd'), r.seat_no, to_char(m.price, 'fm999,999,999') "
			   + " from tbl_movie m "
			   + " join tbl_reservation r "
			   + " on m.movie_id = r.movie_id "
			   + " join tbl_customer c "
			   + " on c.cust_id = r.cust_id order by 1";

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
			<h2>예매 현황 조회</h2>
			<table>
				<tr>
					<th>예매번호</th>
					<th>고객성명</th>
					<th>영화제목</th>
					<th>예매일자</th>
					<th>좌석번호</th>
					<th>티켓가격</th>
				</tr>
				<%
				while(rs.next()){
				%>
				<tr>
					<td align="center"><a href="resUpdate.jsp?res_id=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
					<td align="center"><%=rs.getString(2) %></td>
					<td align="center"><%=rs.getString(3) %></td>
					<td align="center"><%=rs.getString(4) %></td>
					<td align="center"><%=rs.getString(5) %></td>
					<td align="center"><%=rs.getString(6) %></td>
				</tr>
				<%
				}
				rs.close();
				stmt.close();
				con.close();
				%>
			</table>
		</section>
	<%@include file="footer.jsp" %>
</body>
</html>