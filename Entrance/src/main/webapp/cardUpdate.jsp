<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String card_no = request.getParameter("card_no");

	String sql = "select card_no, user_nm, enter_yn from tbl_card_001 where card_no = ?";
	stmt = con.prepareStatement(sql);
	stmt.setString(1, card_no);
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
		<h2>출입 정보 수정</h2>
		<form action="action2.jsp" name="form" method="post" onsubmit="return validCheck()">
		<table>
			<%
			if(rs.next()){
			%>
			<tr>
				<th>카드번호</th>
				<td><input type="text" name="card_no" value="<%=rs.getString(1) %>" readonly></td>
			</tr>
			<tr>
				<th>사용자명</th>
				<td><input type="text" name="user_nm" value="<%=rs.getString(2) %>" readonly></td>
			</tr>
			<tr>
				<th>출입상태</th>
				<td><input type="radio" value="0" name="enter_yn" <%=rs.getString(3).equals("0") ? "checked" : ""%>>출입
					<input type="radio" value="1" name="enter_yn" <%=rs.getString(3).equals("1") ? "checked" : ""%>>출입불가
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="등록"></td>
			</tr>
			<%
			}
			%>
		</table>
		</form>
	</section>
	<script type="text/javascript">
		function validCheck() {
			alert('수정이 완료되었습니다.')
		}
	</script>
</body>
</html>