<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp"%>
<%
	String sql = "select max(pk_schedule) +1 from tbl_schedule1";

	stmt = con.prepareStatement(sql);
	rs = stmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피자전문점 판매관리 프로그램</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@include file="header.jsp"%>
	<%@include file="nav.jsp"%>
	<section>
		<h2>일정등록</h2>
		<form action="action.jsp" name="form" method="post"
			onsubmit="return validCheck()">
			<table>
				<%
				while(rs.next()){
				%>
				<tr>
					<th>일정번호 (자동발생)</th>
					<td><input type="text" name="pk_schedule" value="<%=rs.getString(1) %>" readonly></td>
				</tr>
				<tr>
					<th>일정일자</th>
					<td><input type="text" name="do_date">(ex: 25년 1월 1일 > 20250101)</td>
				</tr>
				<tr>
					<th>회원번호</th>
					<td><input type="text" name="fk_member">(ex: M0001)</td>
				</tr>
				<tr>
					<th>일정메모</th>
					<td><input type="text" name="do_memo"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="등록">
						<button type="reset">조회</button></td>
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
	<%@include file="footer.jsp"%>
</body>
<script type="text/javascript">
	function validCheck(){
		if(!form.do_date.value){
			alert('일정일자를 입력하지 않았습니다.')
			form.do_date.focus()
			return false
		}
		if(!form.fk_member.value){
			alert('회원번호를 입력하지 않았습니다.')
			form.fk_member.focus()
			return false
		}
		if(!form.do_memo.value){
			alert('일정메모를 입력하지 않았습니다.')
			form.do_memo.focus()
			return false
		}

		alert('일정등록이 정상적으로 되었습니다.')
		
		return true
}
</script>
</html>