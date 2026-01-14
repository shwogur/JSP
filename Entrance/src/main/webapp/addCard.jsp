<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select max(card_no) +1 from TBL_CARD_001";

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
		<h2>카드 등록</h2>
		<form action="action.jsp" name="form" method="post" onsubmit="return validCheck()">
		<table>
		<%while(rs.next()) { %>
			<tr>
				<th>카드번호(자동발생)</th>
				<td><input type="text" name="card_no" value="<%=rs.getString(1) %>" readonly></td>
			</tr>
			<tr>
				<th>사용자명</th>
				<td><input type="text" name="user_nm"></td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td><input type="date" name="issue_dt"></td>
			</tr>
			<tr>
				<th>부서명</th>
				<td><input type="text" name="dept"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="등록"></td>
			</tr>
			<%
			}
			rs.close();
			stmt.close();
			%>
		</table>
		</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
<script type="text/javascript">
	function validCheck() {
	if(!form.card_no.value){
		alert('카드번호가 입력되지 않았습니다.')
		form.card_no.focus()
		return false
	}
	if(!form.user_nm.value){
		alert('사용자명 입력되지 않았습니다.')
		form.user_nm.focus()
		return false
	}
	if(!form.issue_dt.value){
		alert('가입일자가 입력되지 않았습니다.')
		form.issue_dt.focus()
		return false
	}
	if(!form.dept.value){
		alert('부서명이 입력되지 않았습니다.')
		form.dept.focus()
		return false
	}
	alert('등록되었습니다.')
	return true
	}
</script>
</html>