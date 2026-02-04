<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select p.p_no, p.p_name, l.t_name, to_char(r.t_sdate, 'yyyy-mm-dd'), decode(r.t_status,'1','검사중','2','검사완료'), to_char(r.t_ldate, 'yyyy-mm-dd'), decode(r.t_result,'X','미입력','P','양성','N','음성') "
			   + " from tbl_patient_202004 p, tbl_lab_test_202004 l, tbl_result_202004 r "
			   + " where p.p_no = r.p_no "
			   + " and l.t_code = r.t_code "
			   + " order by 1 asc";

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
		<h2>검사결과조회</h2>
		<table>
			<tr>
				<th>환자번호</th>
				<th>환자명</th>
				<th>검사명</th>
				<th>검사시작일</th>
				<th>검사상태</th>
				<th>검사완료일</th>
				<th>검사결과</th>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td align="center"><%=rs.getString(1) %></td>
				<td align="center"><%=rs.getString(2) %></td>
				<td align="center"><%=rs.getString(3) %></td>
				<td align="center"><%=rs.getString(4) %></td>
				<td align="center"><%=rs.getString(5) %></td>
				<td align="center"><%=rs.getString(6) %></td>
				<td align="center"><%=rs.getString(7) %></td>
			</tr>
			<%
			}
			rs.close();
			stmt.close();
			con.close();
			%>
		</table>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>