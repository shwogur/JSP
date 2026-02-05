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
		<h2>매출 등록 페이지</h2>
		<form action="action.jsp" name="form" method="post" onsubmit="return validCheck()">
			<table>
				<tr>
					<th>매출번호</th>
					<td><input name="sale_no"></td>
				</tr>
				<tr>
					<th>회원번호</th>
					<td><select name="cust_no">
						<option value="0">회원번호</option>
						<option value="20001">20001</option>
						<option value="20002">20002</option>
						<option value="20003">20003</option>
						<option value="20004">20004</option>
						<option value="20005">20005</option>
					</select></td>
				</tr>
				<tr>
					<th>상품코드</th>
					<td><select name="p_code">
						<option value="0">상품코드</option>
						<option value="G001">G001</option>
						<option value="L001">L001</option>
						<option value="G002">G002</option>
						<option value="S001">S001</option>
						<option value="L002">L002</option>
					</select></td>
				</tr>
				<tr>
					<th>판매수량</th>
					<td><input name="amount"></td>
				</tr>
				<tr>
					<th>판매일자</th>
					<td><input type="date" name="sale_date"></td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input type="submit" value="등록"> 
						<input type="reset" value="다시쓰기" onclick="return resetForm()"> 
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
<script type="text/javascript">
	function validCheck(){
		if(!form.sale_no.value){
			alert('매출번호가 입력되지 않았습니다.')
			form.sale_no.focus()
			return false
		}
		if(form.cust_no.value == "0"){
			alert('회원번호가 선택되지 않았습니다.')
			form.cust_no.focus()
			return false
		}
		if(form.p_code.value == "0"){
			alert('상품코드가 선택되지 않았습니다.')
			form.p_code.focus()
			return false
		}
		if(!form.amount.value){
			alert('판매수량이 입력되지 않았습니다.')
			form.amount.focus()
			return false
		}
		if(!form.sale_date.value){
			alert('날짜가 선택되지 않았습니다.')
			form.sale_date.focus()
			return false
		}
		alert('매출 정보가 정상적으로 등록되었습니다.')
		return true
	}
	
	function resetForm(){
		alert('모든 정보를 삭제합니다.')
		form.sale_no.focus()
		return true
	}
</script>
</html>