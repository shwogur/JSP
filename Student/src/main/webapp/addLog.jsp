<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select distinct lo.student_id, s.student_name "
			   + " from tbl_student_001 s "
			   + " join tbl_study_log lo "
			   + " on s.student_id = lo.student_id "
			   + " order by 1";

	stmt = con.prepareStatement(sql);
	rs = stmt.executeQuery();
	
	String sql1 = "select 'LG'||to_char(max(substr(log_id,3,3)+1),'fm000') from tbl_study_log";
	PreparedStatement stmt1 = con.prepareStatement(sql1);
	ResultSet rs1 = stmt1.executeQuery();
	rs1.next();
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
		<h2>학습 기록 등록</h2>
		<form action="action.jsp" name="form" method="post" onsubmit="return validCheck()">
			<table>
				<tr>
					<input type="hidden" name="log_id" value="<%=rs1.getString(1) %>">
				</tr>
				<tr>
					<th>학생 선택</th>
					<td><select name="student_id">
						<option value="0">학생</option>
						<%
						while(rs.next()){
						%>
						<option value="<%=rs.getString(1) %>"><%=rs.getString(2) %></option>
						<%
						}
						rs.close();
						stmt.close();
						con.close();
						%>
					</select></td>
				</tr>
				<tr>
					<th>학습 시간</th>
					<td><input name="study_time">분</td>
				</tr>
				<tr>
					<th>집중도 점수</th>
					<td><input name="focus_score">점</td>
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
		if(form.student_id.value == "0"){
			alert('학생이 선택되지 않았습니다.')
			form.student_id.focus()
			return false
		}
		if(!form.study_time.value){
			alert('학습 시간이 입력되지 않았습니다.')
			form.study_time.focus()
			return false
		}
		if(!form.focus_score.value){
			alert('집중도 점수가 입력되지 않았습니다.')
			form.focus_score.focus()
			return false
		}
		alert('등록되었습니다.')
		return true
	}
</script>
</html>