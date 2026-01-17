<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select a.lab_name, count(b.equip_name), count(case when b.use_yn = '1' then 1 end), round((count(case when b.use_yn = '1' then 1 end) *100 / count(b.equip_name)),1) " 
			   + " from tbl_lab_001 a, tbl_lab_equip_001 b "
			   + " where a.lab_no = b.lab_no "
			   + " group by a.lab_name "
			   + " order by 4 desc";
	
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
			<h2>실험실 장비 사용률 현황</h2>
			<table>
				<tr>
					<th>실험실명</th>
					<th>전체장비수</th>
					<th>사용중인 장비수</th>
					<th>사용률(%)</th>
				</tr>
				<%while(rs.next()){%>
				<tr>
					<td align="center"><%=rs.getString(1) %></td>
					<td align="center"><%=rs.getString(2) %></td>
					<td align="center"><%=rs.getString(3) %></td>
					<td align="center"><%=rs.getString(4) %></td>
				</tr>
				<%
				}
				%>
			</table>
		</section>
	<%@include file="footer.jsp" %>
</body>
</html>