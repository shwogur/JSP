<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp" %>    
<%
	String sql = " select p.pcode, pname, '￦'||to_char(sum(cost * amount), 'fm999,999,999') "
			   + " from tbl_pizza_01 p, tbl_shop_01 sh, tbl_salelist_01 s "
			   + " where s.scode = sh.scode "
			   + " and s.pcode = p.pcode "
			   + " group by p.pcode, pname "
			   + " order by 3 asc ";

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
		<h2>상품별매출현황</h2>
		<table>
			<tr>
				<th>피자코드</th>
				<th>피자 명</th>
				<th>총매출액</th>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
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