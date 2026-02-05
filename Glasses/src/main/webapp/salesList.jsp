<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select o.sale_no, mem.cust_name, men.p_name, men.p_price, o.amount, to_char(men.p_price *  o.amount, 'fm999,999,999'), to_char(o.sale_date, 'yyyy-mm-dd') " 
			   + " from tbl_member_01 mem "
			   + " join tbl_order_01 o "
			   + " on mem.cust_no = o.cust_no "
			   + " join tbl_menu_01 men "
			   + " on men.p_code = o.p_code";
	
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
		<h2>매출 현황 페이지</h2>
		<table>
			<tr>
				<th>매출번호</th>
				<th>회원성명</th>
				<th>상품명</th>
				<th>단가</th>
				<th>판매수량</th>
				<th>총액</th>
				<th>판매일자</th>
				<th>관리</th>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td align="center"><a href="salesUpdate.jsp?sale_no=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
				<td align="center"><%=rs.getString(2) %></td>
				<td align="center"><%=rs.getString(3) %></td>
				<td align="center"><%=rs.getString(4) %></td>
				<td align="center"><%=rs.getString(5) %></td>
				<td align="center"><%=rs.getString(6) %></td>
				<td align="center"><%=rs.getString(7) %></td>
				<td align="center"><a href="delete.jsp?sale_no=<%=rs.getString(1) %>">[삭제]</a></td>
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