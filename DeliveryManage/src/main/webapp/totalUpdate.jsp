<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String delivery_id = request.getParameter("delivery_id");

	String sql = "select delivery_id, base_fee, single_yn from tbl_delivery_001 where delivery_id = ?";
	
	stmt = con.prepareStatement(sql);
	stmt.setString(1, delivery_id);
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
		<h2>배달 정보 수정</h2>
		<form action="action2.jsp" name="form" method="get">
		<table>
		<%
		if(rs.next()){
		%>
			<tr>
				<th>배달번호</th>
				<td><input name="delivery_id" value="<%=rs.getString(1) %>" readonly></td>
			</tr>
			<tr>
				<th>기본 배달비</th>
				<td><input name="base_fee" value="<%=rs.getString(2) %>"></td>
			</tr>
			<tr>
				<th>배달 유형</th>
				<td>
					<input type="radio" name="single_yn" value="Y" <%=rs.getString(3).equals("Y") ? "checked" : "" %>>한집 배달
					<input type="radio" name="single_yn" value="N" <%=rs.getString(3).equals("N") ? "checked" : "" %>>일반 배달
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input type="submit" value="수정"></td>
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