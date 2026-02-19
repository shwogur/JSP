<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String registration_code = request.getParameter("registration_code");

	String sql = "select h.registration_code, p.name, h.game_numbers, h.appearance, h.hit_numbers, h.home_runs, round(((h.hit_numbers + h.home_runs) / h.appearance * 100) + h.home_runs, 2), h.put_out, h.double_play, h.error_count, (put_out + (h.double_play * 2) - (h.error_count * 5)) " 
			   + " from tbl_player_info p "
			   + " join tbl_hitter_info h "
			   + " on p.registration_code = h.registration_code where h.registration_code = ?";
	
	stmt = con.prepareStatement(sql);
	stmt.setString(1, registration_code);
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
		<%
		if(!rs.next()){
		%>
		<h2>선수 등록 코드 : <%=registration_code %> 성적 조회 결과가 없습니다.</h2>
		<div align="center">
		<button><a href="personalList.jsp">돌아가기</a></button>
		</div>
		<%
		}else{
		%>
		<section>
			<h2>선수 등록 코드 : <%=registration_code %> 성적 조회</h2>
			<table>
				<tr>
					<th>선수 등록 코드</th>
					<th>선수명</th>
					<th>게임수</th>
					<th>타석수</th>
					<th>안타수</th>
					<th>홈런 수</th>
					<th>공격 포인트</th>
					<th>아웃 카운트 수</th>
					<th>더블 플레이 수</th>
					<th>에러 수</th>
					<th>수비 포인트</th>
				</tr>
				<tr>
					<td align="center"><%=rs.getString(1) %></td>
					<td align="center"><%=rs.getString(2) %></td>
					<td align="center"><%=rs.getString(3) %></td>
					<td align="center"><%=rs.getString(4) %></td>
					<td align="center"><%=rs.getString(5) %></td>
					<td align="center"><%=rs.getString(6) %></td>
					<td align="center"><%=rs.getString(7) %></td>
					<td align="center"><%=rs.getString(8) %></td>
					<td align="center"><%=rs.getString(9) %></td>
					<td align="center"><%=rs.getString(10) %></td>
					<td align="center"><%=rs.getString(11) %></td>
				</tr>
			</table>
			<div align="center">
			<button><a href="personalList.jsp">돌아가기</a></button>
			</div>
		</section>
		<%@include file="footer.jsp" %>
		<%
		}
		%>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>