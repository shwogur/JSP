<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select distinct ev.company_code, company_name, category, substr(foundation_day,1,4)||'년'||substr(foundation_day,5,2)||'월'||substr(foundation_day,7,2)||'일', sum(item_1 + item_2 + item_3 + item_4 + item_5), to_char(sum(item_1 + item_2 + item_3 + item_4 + item_5) / 15, 'fm99.90'), rank() over(order by sum(item_1 + item_2 + item_3 + item_4 + item_5) desc) "  
			   + " from tbl_company_info co join tbl_esg_evaluation ev on co.company_code = ev.company_code join tbl_esg_info es on es.item_code = ev.item_code "
			   + " group by ev.company_code, company_name, category, substr(foundation_day,1,4)||'년'||substr(foundation_day,5,2)||'월'||substr(foundation_day,7,2)||'일'";

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
		<h2>전체 기업 평가 조회</h2>
		<table>
			<tr>
				<th>기업코드</th>
				<th>기업명</th>
				<th>업종</th>
				<th>창립일</th>
				<th>평가 총점</th>
				<th>평균</th>
				<th>순위</th>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td align="center"><%=rs.getString(1) %></td>
				<td align="center"><%=rs.getString(2) %></td>
				<td align="center"><%=rs.getString(3) %></td>
				<td align="center"><%=rs.getString(4) %></td>
				<td align="right"><%=rs.getString(5) %></td>
				<td align="right"><%=rs.getString(6) %></td>
				<td align="center"><%=rs.getString(7) %></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>