<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select t_code, t_name from tbl_lab_test_202004";

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
		<h2>검사결과입력</h2>
		<form action="action.jsp" name="form" method="post" onsubmit="return validCheck()">
			<table>
				<tr>
					<th>환자번호</th>
					<td><input name="p_no">예)1001</td>
				</tr>
				<tr>
					<th>검사코드</th>
					<td>
						<select name="t_code">
						<option value="0">검사명</option>
						<%
						while(rs.next()){
						%>
						<option value="<%=rs.getString(1) %>">[<%=rs.getString(1) %>]<%=rs.getString(2) %></option>
						<%
						}
						%>
						</select>
					</td>
				</tr>
				<tr>
					<th>검사시작일자</th>
					<td><input name="t_sdate">예)20240101</td>
				</tr>
				<tr>
					<th>검사상태</th>
					<td>
						<input type="radio" name="t_status" value="1">검사중
						<input type="radio" name="t_status" value="2">검사완료
					</td>
				</tr>
				<tr>
					<th>검사완료일자</th>
					<td><input name="t_ldate"></td>
				</tr>
				<tr>
					<th>검사결과</th>
					<td>
						<input type="radio" name="t_result" value="X">미입력
						<input type="radio" name="t_result" value="P">양성
						<input type="radio" name="t_result" value="N">음성
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input type="submit" value="등록">
						<input type="button" value="다시쓰기" onclick="resetForm()">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
<script type="text/javascript">
	function validCheck(){
		if(!form.p_no.value){
			alert('환자번호가 입력되지 않았습니다!')
			form.p_no.focus()
			return false
		}
		if(form.t_code.value == "0"){
			alert('검사코드가 선택되지 않았습니다!')
			form.t_code.focus()
			return false
		}
		if(!form.t_sdate.value){
			alert('검사시작일자가 입력되지 않았습니다!')
			form.t_sdate.focus()
			return false
		}
		if(!form.t_status.value){
			alert('검사상태가 선택되지 않았습니다!')
			form.t_status[1].focus()
			return false
		}
		if(!form.t_ldate.value){
			alert('검사완료일자가 입력되지 않았습니다!')
			form.t_ldate.focus()
			return false
		}
		if(!form.t_result.value){
			alert('검사결과가 선택되지 않았습니다!')
			form.t_result[1].focus()
			return false
		}
		alert('검사결과가 정상적으로 등록 되었습니다!')
		return true
	}
	
	function resetForm(){
		alert('정보를 지우고 처음부터 다시 입력 합니다!')
		form.reset()
		form.p_no.focus()
	}
</script>
</html>