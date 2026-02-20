<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select delivery_id, rider_name, store_name, to_char(base_fee, 'fm999,999,999'), single_yn, case when single_yn = 'Y' then to_char(base_fee + 2000, 'fm999,999,999') else to_char(base_fee, 'fm999,999,999') end " 
			   + " from tbl_rider_001 r join tbl_delivery_001 d on r.rider_id = d.rider_id join tbl_store_001 s on s.store_id = d.store_id order by 1";
	
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
		<h2>전체 배달 내역</h2>
		<table>
			<tr>
				<th>번호</th>
				<th>기사명</th>
				<th>지점명</th>
				<th>기본배달비</th>
				<th>한집배달 여부</th>
				<th>총배달비</th>
				<th>관리</th>
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
				<td align="center"><a href="totalUpdate.jsp?delivery_id=<%=rs.getString(1) %>">수정</a>/<a href="delete.jsp?delivery_id=<%=rs.getString(1) %>">삭제</a></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>