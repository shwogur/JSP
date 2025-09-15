<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp" %>    
<%
	String sql = "select s.saleno, s.scode||'-'||sh.sname, to_char(saledate, 'yyyy-mm-dd'), s.pcode, p.pname, s.amount, '\'||to_char(amount * cost, 'fm999,999,999') "
	 		   + " from tbl_salelist_01 s, tbl_shop_01 sh, tbl_pizza_01 p "
			   + " where s.scode = sh.scode "
			   + " and s.pcode = p.pcode "
			   + " order by 1 asc ";

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
		<h2>통합매출현황조회</h2>
		<table>
			<tr>
				<th>매출전표번호</th>
				<th>지점</th>
				<th>판매일자</th>
				<th>피자코드</th>
				<th>피자명</th>
				<th>판매수량</th>
				<th>매출액</th>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td><%=rs.getString(6) %></td>
				<td align= "right">￦<%=rs.getString(7) %></td>
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