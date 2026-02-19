<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<h2>타자 성적 등록</h2>
		<form action="action.jsp" name="form" method="post" onsubmit="return validCheck()">
		<table>
			<tr>
				<th>타자 선택</th>
				<td><select name="registration_code">
					<option value="0">타자 선택</option>
					<option value="A001">김길동</option>
					<option value="A005">이길동</option>
					<option value="B002">홍길동</option>
					<option value="B006">조길동</option>
				</select></td>
			</tr>
			<tr>
				<th colspan="2">공격 포인트</th>
			</tr>
			<tr>
				<th>게임 수</th>
				<td><input name="game_numbers">게임</td>
			</tr>
			<tr>
				<th>타석 수</th>
				<td><input name="appearance">타석</td>
			</tr>
			<tr>
				<th>안타 수</th>
				<td><input name="hit_numbers">안타</td>
			</tr>
			<tr>
				<th>홈런 수</th>
				<td><input name="home_runs">홈런</td>
			</tr>
			<tr>
				<th colspan="2">수비 포인트</th>
			</tr>
			<tr>
				<th>아웃 카운트 수</th>
				<td><input name="put_out">회</td>
			</tr>
			<tr>
				<th>더블 플레이 수</th>
				<td><input name="double_play">회</td>
			</tr>
			<tr>
				<th>에러</th>
				<td><input name="error_count">회</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input type="submit" value="등록">
					<input type="reset" value="다시쓰기" onclick="return reSet()">
				</td>
			</tr>
		</table>
		</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
<script type="text/javascript">
	function validCheck(){
		if(form.registration_code.value == "0"){
			alert('타자가 선택되지 않았습니다!')
			form.registration_code.focus()
			return false
		}
		if(!form.game_numbers.value){
			alert('게임 수가 입력되지 않았습니다!')
			form.game_numbers.focus()
			return false
		}
		if(!form.appearance.value){
			alert('타석 수가 입력되지 않았습니다!')
			form.appearance.focus()
			return false
		}
		if(!form.hit_numbers.value){
			alert('안타 수가 입력되지 않았습니다!')
			form.hit_numbers.focus()
			return false
		}
		if(!form.home_runs.value){
			alert('홈런 수가 입력되지 않았습니다!')
			form.home_runs.focus()
			return false
		}
		if(!form.put_out.value){
			alert('아웃 카운트 수가 입력되지 않았습니다!')
			form.put_out.focus()
			return false
		}
		if(!form.double_play.value){
			alert('더블 플레이 수가 입력되지 않았습니다!')
			form.double_play.focus()
			return false
		}
		if(!form.error_count.value){
			alert('에러 수가 입력되지 않았습니다!')
			form.error_count.focus()
			return false
		}
		alert('타자 성적 등록이 완료되었습니다!')
		return true
	}
	
	function reSet(){
		alert('정보를 지우고 처음부터 다시 입력합니다!')
		form.registration_code.focus()
		return true
	}
</script>
</html>