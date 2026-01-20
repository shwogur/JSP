<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select 'M'||to_char(max(substr(movie_no,2,5)+1), 'fm00000') from TBL_MOVIE_01";

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
		<h2>영화 등록</h2>
		<form action="action.jsp" name="form" method="post" onsubmit="return validCheck()">
			<table>
			<%while(rs.next()){ %>
				<tr>
					<th>영화번호(자동발생)</th>
					<td><input value="<%=rs.getString(1) %>" name="movie_no" readonly></td>
				</tr>
				<%
				}
				rs.close();
				stmt.close();
				con.close();
				%>
				<tr>
					<th>영화명</th>
					<td><input name="movie_name"></td>
				</tr>
				<tr>
					<th>개봉일</th>
					<td><input type="date" name="open_dt" ></td>
				</tr>
				<tr>
					<th>장르</th>
					<td><input name="genre"></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><input type="submit" value="등록"></td>
				</tr>
			</table>
		</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
<script type="text/javascript">
	function validCheck(){
		if(!form.movie_name.value){
			alert('영화명이 입력되지 않았습니다.')
			form.movie_name.focus()
			return false
		}
		if(!form.open_dt.value){
			alert('날짜가 입력되지 않았습니다.')
			form.open_dt.focus()
			return false
		}
		if(!form.genre.value){
			alert('장르가 입력되지 않았습니다.')
			form.genre.focus()
			return false
		}
		alert('등록이 완료되었습니다.')
		return true
	}
</script>
</html>