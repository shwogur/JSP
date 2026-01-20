<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String movie_no = request.getParameter("movie_no");	

	String sql = "select movie_no, movie_name, show_yn from tbl_movie_01 where movie_no = ?";
	
	stmt = con.prepareStatement(sql);
	stmt.setString(1, movie_no);
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
		<h2>상영정보 수정</h2>
		<form action="action2.jsp" name="form" method="post" onsubmit="return validCheck()">
			<table>
				<%if(rs.next()){ %>
				<tr>
					<th>영화번호</th>
					<td><input name="movie_no" value="<%=rs.getString(1) %>"></td>
				</tr>
				<tr>
					<th>영화명</th>
					<td><input name="movie_name" value="<%=rs.getString(2) %>"></td>
				</tr>
				<tr>
					<th>상영여부</th>
					<td><input type="radio" name="show_yn" value="0" <%=rs.getString(3).equals("0") ? "checked" : "" %>>상영완료
						<input type="radio" name="show_yn" value="1" <%=rs.getString(3).equals("1") ? "checked" : "" %>>상영중
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
		alert('수정이 완료되었습니다')
		return true
	}
</script>
</html>