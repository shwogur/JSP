<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select card_no, user_nm, to_char(issue_dt, 'yyyy-mm-dd'), dept, case when enter_yn = '0' then '출입중' when enter_yn = '1' then '출입불가' else '2' end from tbl_card_001";
	
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
		<h2>출입 현황</h2>
		<table>
			<tr>
				<th>카드번호</th>
				<th>사용자명</th>
				<th>발급일</th>
				<th>부서</th>
				<th>출입상태</th>
			</tr>
			<%while(rs.next()){ %>
			<tr>
				<td><a href="cardUpdate.jsp?card_no=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>