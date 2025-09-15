<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp" %>    
<%
	String sql = "select artist_id, artist_name, to_char(to_Date(artist_birth), 'yyyy\"년\"mm\"월\"dd\"일\"'), case artist_gender when 'F' then '여' when 'M' then '남' end, case talent when '1' then '보컬' when '2' then '댄스' when '3' then '랩' end, agency "
			   + " from tbl_artist_201905";

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
		<h2>참가자목록조회</h2>
		<table>
			<tr>
				<th>참가번호</th>
				<th>참가자명</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>특기</th>
				<th>소속사</th>
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