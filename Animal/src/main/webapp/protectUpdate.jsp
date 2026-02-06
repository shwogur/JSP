<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String animal_no = request.getParameter("animal_no");

	String sql = "select a.animal_no, a.animal_name, s.shelter_name, a.protect_yn"
			   + " from tbl_shelter_001 s "
			   + " join tbl_animal_001 a "
			   + " on s.shelter_no = a.shelter_no"
			   + " where animal_no = ?";
	
	stmt = con.prepareStatement(sql);
	stmt.setString(1, animal_no);
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
		<h2>보호상태 수정</h2>
		<form action="action2.jsp" name="form" method="get" onsubmit="return validCheck()">
			<table>
			<%
			if(rs.next()){
			%>
				<tr>
					<th>동물번호</th>
					<td><input name="animal_no" value="<%=rs.getString(1) %>" readonly></td>
				</tr>
				<tr>
					<th>동물명</th>
					<td><input name="animal_name" value="<%=rs.getString(2) %>" readonly></td>
				</tr>
				<tr>
					<th>보호소</th>
					<td><input name="shelter_name" value="<%=rs.getString(3) %>" readonly></td>
				</tr>
				<tr>
					<th>보호상태</th>
					<td>
						<input type="radio" name="protect_yn" value="0" <%=rs.getString(4).equals("0") ? "checked" : "" %>>보호중
						<input type="radio" name="protect_yn" value="1" <%=rs.getString(4).equals("1") ? "checked" : "" %>>입양완료
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2"><input type="submit" value="등록"></td>
				</tr>
				<%
				}
				rs.close();
				stmt.close();
				con.close();
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