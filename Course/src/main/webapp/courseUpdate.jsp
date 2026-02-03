<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String 	regist_no = request.getParameter("regist_no");

	String sql = "select cl.regist_no, to_char(cl.regist_date, 'yyyy-mm-dd'), cl.student_id, s.student_name, cl.course_code " 
			   + " from tbl_student_2026 s, tbl_class_2026 cl "
			   + " where s.student_id = cl.student_id "
	           + " and cl.regist_no = ?";

	stmt = con.prepareStatement(sql);
	stmt.setString(1, regist_no);
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
			<h2>수강 신청 수정</h2>
			<form action="action2.jsp" name="form" method="post" onsubmit="return validCheck()">
			<table>
				<%
				if(rs.next()){
				%>
				<tr>
					<th>수강번호</th>
					<td><input name="regist_no" value="<%=rs.getString(1) %>" readonly></td>
				</tr>
				<tr>
					<th>신청날짜</th>
					<td><input name="regist_date" value="<%=rs.getString(2) %>" readonly></td>
				</tr>
				<tr>
					<th>학번</th>
					<td><input name="student_id" value="<%=rs.getString(3) %>" readonly></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input name="student_name" value="<%=rs.getString(4) %>" readonly></td>
				</tr>
				<tr>
					<th>강의 코드</th>
					<td><input value="<%=rs.getString(5) %>" name="course_code"></td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<button><a href="courseList.jsp">목록으로</a></button>
						<input type="submit" value="수정하기">
					</td>
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
		if(!form.regist_no.value){
			alert('강의 코드가 입력되지 않았습니다.')
			form.regist_no.focus()
			return false
		}
	}
</script>
</html>