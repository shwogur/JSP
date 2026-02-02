<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String student_id = request.getParameter("student_id");

	String sql = "select case when st.course = '01' then '학사'  when st.course = '02' then '석사'  when st.course = '03' then '박사' end, st.student_id, st.student_name, count(*)||'과목', to_char(round(sum(g.mid*0.3+g.final*0.3+g.attend*0.2+g.report*0.1+g.etc*0.1),1),'999.0'), to_char(to_char(round(sum(g.mid*0.3+g.final*0.3+g.attend*0.2+g.report*0.1+g.etc*0.1),1),'999.0') / count(g.student_code),'999.0') " 
			   + " from tbl_student_202409 st, tbl_subject_202409 su, tbl_grade_202409 g "
			   + " where st.student_id = g.student_id "
			   + " and g.student_code = su.subject_code "
			   + " and st.student_id = ? "
			   + " group by st.course, st.student_id, st.student_name";
	
	stmt = con.prepareStatement(sql);
	stmt.setString(1, student_id);
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
	<%
		if(!rs.next()){
	%>
		<h2>학생코드 : <%=student_id %> 성적정보가 존재하지 않습니다!</h2>
		<div align="center"><button><a href="personalList.jsp">돌아가기</a></button></div>
	<%
		}else{
	%>
		<section>
		<h2>학생코드 : <%=student_id %> 성적조회</h2>
		<table>
			<tr>
				<th>과정</th>
				<th>학생코드</th>
				<th>성명</th>
				<th>이수과목수</th>
				<th>총점</th>
				<th>평균</th>
			</tr>
			<tr>
				<td align="center"><%=rs.getString(1) %></td>
				<td align="center"><%=rs.getString(2) %></td>
				<td align="center"><%=rs.getString(3) %></td>
				<td align="center"><%=rs.getString(4) %></td>
				<td align="center"><%=rs.getString(5) %></td>
				<td align="center"><%=rs.getString(6) %></td>
			</tr>
		</table>
		</section>
		<%@include file="footer.jsp" %>
	<%
		}
	%>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>