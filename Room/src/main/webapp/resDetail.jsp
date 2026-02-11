<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String equip_id = request.getParameter("equip_id");

	String sql = "select location from tbl_equipment_001 where equip_id = ?";
	
	stmt = con.prepareStatement(sql);
	stmt.setString(1, equip_id);
	rs = stmt.executeQuery();
	String location = "";
	if(rs.next()){
		location = rs.getString(1);
	}
	
	String sql1 = "select r.resv_id, u.user_name, r.resv_time "
			    + " from tbl_user_001 u "
			    + " join tbl_reservation_001 r "
			    + " on u.user_id = r.user_id "
			    + " join tbl_equipment_001 e " 
			    + " on e.equip_id = r.equip_id "
			    + " where e.equip_id = ?";
	
	PreparedStatement stmt1 = con.prepareStatement(sql1);
	stmt1.setString(1, equip_id);
	ResultSet rs1 = stmt1.executeQuery();
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
		<h2>장비 예약 상세</h2>
		<h4>장비명: <%=equip_id %> | 위치: <%=location %> </h4>
		<table>
			<tr>
				<th>예약번호</th>
				<th>사용자명</th>
				<th>시간</th>
				<th>수정</th>
			</tr>
			<%
			while(rs1.next()){
			%>
			<tr>
				<td align="center"><%=rs1.getString(1) %></td>
				<td align="center"><%=rs1.getString(2) %></td>
				<td align="center"><%=rs1.getString(3) %></td>
				<td align="center"><a href="resUpdate.jsp?resv_id=<%=rs1.getString(1) %>">수정</a>/<a href="delete.jsp?resv_id=<%=rs1.getString(1) %>">삭제</a></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>