<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String student_name = request.getParameter("student_name");

	String sql = "select distinct le.lecture_name "
			   + " from tbl_lecture_001 le "  
			   + " join tbl_student_001 s "
			   + " on le.lecture_id = s.lecture_id "
			   + " where s.student_name = ?";
	
	stmt = con.prepareStatement(sql);
	stmt.setString(1, student_name);
	rs = stmt.executeQuery();
	rs.next();
	
	String sql1 = "select lo.log_id, lo.study_time, lo.focus_score "
			    + " from tbl_student_001 s "
			    + " join tbl_study_log lo "
			    + " on s.student_id = lo.student_id "
			    + " where s.student_name = ?"
			    + " order by 1";
	
	PreparedStatement stmt1 = con.prepareStatement(sql1);
	stmt1.setString(1, student_name);
	ResultSet rs1 = stmt1.executeQuery();
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
		<h2>학습자 학습 기록 상세</h2>
		<h4>이름: <%=student_name %> | 강의: <%=rs.getString(1) %></h4> 
		<table>
			<tr>
				<th>기록 아이디</th>
				<th>학습 시간</th>
				<th>점수</th>
				<th>수정</th>
			</tr>
			<%
			while(rs1.next()){ 
			%>
			<tr>
				<td align="center"><%=rs1.getString(1) %></td>
				<td align="center"><%=rs1.getString(2) %></td>
				<td align="center"><%=rs1.getString(3) %></td>
				<td align="center"><a href="studyLogUpdate.jsp?log_id=<%=rs1.getString(1) %>">수정</a></td>
			</tr>
			<%
			}
			rs1.close();
			stmt1.close();
			con.close();
			%>
		</table>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>