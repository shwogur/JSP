<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String resv_id = request.getParameter("resv_id");

	String sql = "select r.resv_id, e.equip_name, u.user_name, r.resv_time "
			   + " from tbl_user_001 u "
			   + " join tbl_reservation_001 r "
			   + " on u.user_id = r.user_id "
			   + " join tbl_equipment_001 e "
			   + " on e.equip_id = r.equip_id "
			   + " where r.resv_id = ?";
	
	stmt = con.prepareStatement(sql);
	stmt.setString(1, resv_id);
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
		<h2>예약 수정</h2>
		<form action="action2.jsp" name="form" method="get">
			<table>
				<%
				if(rs.next()){
				%>
				<tr>
					<th>예약번호</th>
					<td><input name="resv_id" value="<%=rs.getString(1) %>" readonly></td>
				</tr>
				<tr>
					<th>장비명</th>
					<td><input name="" value="<%=rs.getString(2) %>" readonly></td>
				</tr>
				<tr>
					<th>사용자</th>
					<td><input name="" value="<%=rs.getString(3) %>" readonly></td>
				</tr>
				<tr>
					<th>예약시간</th>
					<td><input type="date" name="resv_time" value=<%=rs.getString(4) %>></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><input type="submit" value="수정" onclick="confirm('수정이 완료되었습니다.')"></td>
				</tr>
				<%
				}
				%>
			</table>
		</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>