<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String ship_no = request.getParameter("ship_no");

	String sql = "select ship_no, recv_nm, ship_st from tbl_delivery_001 where ship_no = ?";
	
	stmt = con.prepareStatement(sql);
	stmt.setString(1, ship_no);
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
		<h2>배송 수정</h2>
		<form action="action2.jsp" name="form" method="post" onsubmit="return validCheck()">
		<table>
			<% if(rs.next()){ %>
			<tr>
				<th>배송번호</th>
				<td><input type="text" name="ship_no" value="<%=rs.getString(1) %>" readonly></td>
			</tr>
			<tr>
				<th>수령인</th>
				<td><input type="text" name="recv_nm" value="<%=rs.getString(2) %>"></td>
			</tr>
			<tr>
				<th>배송상태</th>
				<td><input type="radio" value="1" name="ship_st" <%=rs.getString(3).equals("1") ? "checked" : "" %>>배송완료
					<input type="radio" value="0" name="ship_st" <%=rs.getString(3).equals("0") ? "checked" : "" %>>배송중
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
	<%@include file="footer.jsp" %>
</body>
<script type="text/javascript">
	function validCheck(){
		alert('수정이 완료되었습니다.')
	}
</script>
</html>