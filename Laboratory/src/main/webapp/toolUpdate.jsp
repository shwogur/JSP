<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String equip_no = request.getParameter("equip_no");

	String sql = "select equip_no, equip_name, use_yn from tbl_lab_equip_001 where equip_no = ?";
	
	stmt = con.prepareStatement(sql);
	stmt.setString(1, equip_no);
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
			<h2>사용여부 수정</h2>
			<form action="action2.jsp" name="form" method="post" onsubmit="return validCheck()">
				<table>
					<%if(rs.next()){ %>
					<tr>
						<th>장비번호</th>
						<td><input type="text" name="equip_no" value="<%=rs.getString(1) %>" readonly></td>
					</tr>
					<tr>
						<th>장비명</th>
						<td><input type="text" name="equip_name" value="<%=rs.getString(2) %>" readonly></td>
					</tr>
					<tr>
						<th>사용여부</th>
						<td><input type="radio" name="use_yn" value="1" <%=rs.getString(3).equals("1") ? "checked" : "" %>>사용중
							<input type="radio" name="use_yn" value="0" <%=rs.getString(3).equals("0") ? "checked" : "" %>>미사용
						</td>
					</tr>
					<tr>
						<td align="center" colspan="2"><input type="submit" value="등록"></td>
					</tr>
					<%
					}
					%>
				</table>
			</form>
		</section>
	<%@include file="footer.jsp" %>
</body>
<script type="text/javascript">
	function validCheck(){
		alert('수정이 완료되었습니다.')
		return true
	}
</script>
</html>