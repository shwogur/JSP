<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select distinct le.lecture_name, count(distinct s.student_name), round(avg(lo.study_time),1), round(avg(lo.focus_score),1) " 
			   + " from tbl_lecture_001 le "
			   + " join tbl_student_001 s "
			   + " on le.lecture_id = s.lecture_id "
			   + " join tbl_study_log lo "
			   + " on s.student_id = lo.student_id "
			   + " group by le.lecture_name order by 2";

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
		<h2>강의별 학습 집중도 통계</h2>
		<table>
			<tr>
				<th>강의명</th>
				<th>학습자수</th>
				<th>평균학습시간</th>
				<th>평균집중도</th>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td align="center"><%=rs.getString(1) %></td>
				<td align="center"><%=rs.getString(2) %></td>
				<td align="center"><%=rs.getString(3) %></td>
				<td align="center"><%=rs.getString(4) %></td>
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