<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
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
		<h2>개인성적등록</h2>
		<form action="action.jsp" name="form" method="post" onsubmit="return validCheck()">
			<table>
				<tr>
					<th>학생코드</th>
					<td><input name="student_id"></td>
				</tr>
				<tr>
					<th>과목코드</th>
					<td><input name="student_code"></td>
				</tr>
				<tr>
					<th>중간(30%)(0~100)</th>
					<td><input name="mid"></td>
				</tr>
				<tr>
					<th>기말(30%)(0~100)</th>
					<td><input name="finall"></td>
				</tr>
				<tr>
					<th>출석(20%)(0~100)</th>
					<td><input name="attend"></td>
				</tr>
				<tr>
					<th>레포트(10%)(0~100)</th>
					<td><input name="report"></td>
				</tr>
				<tr>
					<th>기타(10%)(0~100)</th>
					<td><input name="etc"></td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input type="submit" value="등록">
						<input type="reset" value="다시쓰기" onclick="return Click()">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
<script type="text/javascript">
	function validCheck(){

		if(!form.student_id.value){
			alert('학생코드가 입력되지 않았습니다!')
			form.student_id.focus()
			return false
		}

		if(!form.student_code.value){
			alert('과목코드가 입력되지 않았습니다!')
			form.student_code.focus()
			return false
		}

		// 중간
		if(!form.mid.value){
			alert('중간 점수가 입력되지 않았습니다!')
			form.mid.focus()
			return false
		}
		if (form.mid.value < 0 || form.mid.value > 100) {
			alert('0부터 100사이의 값만 입력하세요!')
			form.mid.focus()
			return false
		}

		// 기말
		if(!form.finall.value){
			alert('기말 점수가 입력되지 않았습니다!')
			form.finall.focus()
			return false
		}
		if (form.finall.value < 0 || form.finall.value > 100) {
			alert('0부터 100사이의 값만 입력하세요!')
			form.finall.focus()
			return false
		}

		// 출석
		if(!form.attend.value){
			alert('출석 점수가 입력되지 않았습니다!')
			form.attend.focus()
			return false
		}
		if (form.attend.value < 0 || form.attend.value > 100) {
			alert('0부터 100사이의 값만 입력하세요!')
			form.attend.focus()
			return false
		}

		// 레포트
		if(!form.report.value){
			alert('레포트 점수가 입력되지 않았습니다!')
			form.report.focus()
			return false
		}
		if (form.report.value < 0 || form.report.value > 100) {
			alert('0부터 100사이의 값만 입력하세요!')
			form.report.focus()
			return false
		}

		// 기타
		if(!form.etc.value){
			alert('기타 점수가 입력되지 않았습니다!')
			form.etc.focus()
			return false
		}
		if (form.etc.value < 0 || form.etc.value > 100) {
			alert('0부터 100사이의 값만 입력하세요!')
			form.etc.focus()
			return false
		}

		alert('등록이 완료되었습니다!')
		return true
	}

	function Click(){
		alert('정보를 지우고 처음부터 다시 입력합니다!')
		form.student_id.focus()
	}
</script>
</html>