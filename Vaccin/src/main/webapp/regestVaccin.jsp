<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백신접종예약 프로그램</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@include file="header.jsp"%>
	<%@include file="nav.jsp"%>
	<section>
		<h2>백신접종예약</h2>
		<form action="action.jsp" name="form" method="post"
			onsubmit="return validCheck()">
			<table>
				<tr>
					<th>접종예약번호</th>
					<td><input type="text" name="resvno">예) 20210001</td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td><input type="text" name="jumin">예) 710101-1000001</td>
				</tr>
				<tr>
					<th>백신코드</th>
					<td><input type="text" name="vcode">예) V001 ~ V003</td>
				</tr>
				<tr>
					<th>병원코드</th>
					<td><input type="text" name="hospcode">예) H001</td>
				</tr>
				<tr>
					<th>예약일자</th>
					<td><input type="text" name="resvdate">예) 20211231</td>
				</tr>
				<tr>
					<th>예약시간</th>
					<td><input type="text" name="resvtime">예) 1230</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="등록">
					<button type="reset">다시쓰기</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@include file="footer.jsp"%>
</body>
<script type="text/javascript">
	function validCheck(){
		if(!form.resvno.value){
			alert('접종예약번호가 입력되지 않았습니다.')
			form.resvno.focus()
			return false
		}
		if(!form.jumin.value){
			alert('주민번호가 입력되지 않았습니다.')
			form.jumin.focus()
			return false
		}
		if(!form.vcode.value){
			alert('백신코드가 입력되지 않았습니다.')
			form.vcode.focus()
			return false
		}
		if(!form.hospcode.value){
			alert('병원코드가 입력되지 않았습니다.')
			form.hospcode.focus()
			return false
		}
		if(!form.resvdate.value){
			alert('예약 일자가 입력되지 않았습니다.')
			form.resvdate.focus()
			return false
		}
		if(!form.resvtime.value){
			alert('예약시간이 입력되지 않았습니다.')
			form.resvtime.focus()
			return false
		}
		
		alert('접종예약정보가 등록되었습니다!')
		
		return true
	}
</script>
</html>