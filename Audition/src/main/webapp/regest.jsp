<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@include file="header.jsp"%>
	<%@include file="nav.jsp"%>
	<section>
		<h2>오디션 등록</h2>
		<form action="action.jsp" name="form" method="post"
			onsubmit="return validCheck()">
			<table>
				<tr>
					<th>참가번호</th>
					<td><input type="text" name="artist_id"></td>
				</tr>
				<tr>
					<th>참가자명</th>
					<td><input type="text" name="artist_name"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="text" name="artist_birth_year">년<input type="text"
						name="artist_birth_month">월<input type="text" name="artist_birth_day">일</td>
				</tr>
				<tr>
					<th>성별</th>
					<td><input type="radio" name="artist_gender" value="M">남 <input
						type="radio" name="artist_gender" value="F">여</td>
				</tr>
				<tr>
					<th>특기</th>
					<td><select name="talent">
							<option value="0">특기선택</option>
							<option value="1">보컬</option>
							<option value="2">댄스</option>
							<option value="3">랩</option>
					</select></td>
				</tr>
				<tr>
					<th>소속사</th>
					<td><input type="text" name="agency"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="오디션등록">
						<button type="reset">다시쓰기</button></td>
				</tr>
			</table>
		</form>
	</section>
</body>
<script type="text/javascript">
	function validCheck(){
		if(!form.artist_id.value){
			alert('참가번호가 입력되지 않았습니다!')
			form.artist_id.focus()
			return false
		}
		if(!form.artist_name.value){
			alert('참가자명이 입력되지 않았습니다!')
			form.artist_name.focus()
			return false
		}
		if(!form.artist_birth_year.value){
			alert('생년월일이 입력되지 않았습니다!')
			form.year.focus()
			return false
		}
		if(!form.artist_birth_month.value){
			alert('생년월일이 입력되지 않았습니다!')
			form.year.focus()
			return false
		}
		if(!form.artist_birth_day.value){
			alert('생년월일이 입력되지 않았습니다!')
			form.year.focus()
			return false
		}
		if(!document.querySelector('input[name="artist_gender"]:checked')){
			alert('성별이 선택되지 않았습니다!')
			return false
		}
		if(form.talent.value == 0){
			alert('특기를 선택하지 않았습니다!')
			return false
		}
		
		alert('오디션 참가신청이 완료되었습니다.')
		
		return true
	}
</script>
</html>