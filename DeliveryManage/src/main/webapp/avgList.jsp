<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select rider_name, to_char(sum(case when single_yn = 'Y' then base_fee + 2000 else base_fee end), 'fm999,999,999') "
			   + " from tbl_rider_001 r join tbl_delivery_001 d on r.rider_id = d.rider_id group by rider_name "
			   + " having sum(case when single_yn = 'Y' then base_fee + 2000 else base_fee end) > (select sum(case when single_yn = 'Y' then base_fee + 2000 else base_fee end) / 4 from tbl_delivery_001)";
	
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
		<h2>평균 배달 수익 초과 기사</h2>
		<table>
			<tr>
				<th>기사명</th>
				<th>총 배달 수익</th>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td align="center"><%=rs.getString(1) %></td>
				<td align="center"><%=rs.getString(2) %></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>