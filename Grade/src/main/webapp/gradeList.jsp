<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select st.student_id, st.student_name, decode((substr(jumin,7,1)),1,'남자',3,'남자',2,'여자',4,'여자'), su.subject_name, to_char(round(g.mid * 0.3,1),'999.0'), to_char(round(g.final * 0.3,1),'999.0'), to_char(round(g.attend * 0.2,1),'999.0'), to_char(round(g.report * 0.1,1),'999.0'), to_char(round(g.etc * 0.1,1),'999.0'), to_char(round(g.mid*0.3 + g.final*0.3 + g.attend*0.2 + g.report*0.1 + g.etc*0.1,1),'999.0'), case when to_char(round(g.mid*0.3 + g.final*0.3 + g.attend*0.2 + g.report*0.1 + g.etc*0.1,1),'999.0') > 89 then 'A' when to_char(round(g.mid*0.3 + g.final*0.3 + g.attend*0.2 + g.report*0.1 + g.etc*0.1,1),'999.0') > 79 then 'B' when to_char(round(g.mid*0.3 + g.final*0.3 + g.attend*0.2 + g.report*0.1 + g.etc*0.1,1),'999.0') > 69 then 'C' when to_char(round(g.mid*0.3 + g.final*0.3 + g.attend*0.2 + g.report*0.1 + g.etc*0.1,1),'999.0') > 59 then 'D' else 'F' end "
			   + " from tbl_student_202409 st, tbl_subject_202409 su, tbl_grade_202409 g "
			   + " where st.student_id = g.student_id "
			   + " and g.student_code = su.subject_code";
	
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
		<h2>전체성적조회</h2>
		<table>
			<tr>
				<th>학생코드</th>
				<th>성명</th>
				<th>성별</th>
				<th>과목명</th>
				<th>중간(30%)</th>
				<th>기말(30%)</th>
				<th>출석(20%)</th>
				<th>레포트(10%)</th>
				<th>기타(10%)</th>
				<th>점수</th>
				<th>등급</th>
			</tr>
			<%while(rs.next()){ %>
			<tr>
				<td align="center"><%=rs.getString(1) %></td>
				<td align="center"><%=rs.getString(2) %></td>
				<td align="center"><%=rs.getString(3) %></td>
				<td align="center"><%=rs.getString(4) %></td>
				<td align="center"><%=rs.getString(5) %></td>
				<td align="center"><%=rs.getString(6) %></td>
				<td align="center"><%=rs.getString(7) %></td>
				<td align="center"><%=rs.getString(8) %></td>
				<td align="center"><%=rs.getString(9) %></td>
				<td align="center"><%=rs.getString(10) %></td>
				<td align="center"><%=rs.getString(11) %></td>
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