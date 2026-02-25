<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select saleno, sa.scode||'-'||sh.sname, to_char(saledate, 'yyyy-mm-dd'), sa.pcode, p.pname, amount, '\'||to_char(sum(p.cost * sa.amount), 'fm999,999,999') " 
			   + " from tbl_pizza_01 p join tbl_saleList_01 sa on p.pcode = sa.pcode join tbl_shop_01 sh on sh.scode = sa.scode "
      		   + " group by saleno, sa.scode||'-'||sh.sname, saledate, sa.pcode, p.pname, amount order by 1";
	
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
	<%@include file="footer.jsp" %>
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
				<td align="center"><%=rs.getString(1) %></td>
				<td align="center"><%=rs.getString(2) %></td>
				<td align="center"><%=rs.getString(3) %></td>
				<td align="center"><%=rs.getString(4) %></td>
				<td align="center"><%=rs.getString(5) %></td>
				<td align="center"><%=rs.getString(6) %></td>
				<td align="center">₩<%=rs.getString(7) %></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
</body>
</html>