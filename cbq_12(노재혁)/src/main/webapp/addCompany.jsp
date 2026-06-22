<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sql = "select item_code, '['||item_code||']'||item_name from tbl_esg_info";

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
		<h2>기업 평가 정보 등록</h2>
		<form action="action.jsp" name="form" method="post" onsubmit="return validCheck()">
		<table>
			<tr>
				<th>기업코드</th>
				<td><input name="company_code"></td>
			</tr>
			<tr>
				<th>평가 항목 코드</th>
				<td><select name="item_code">
					<option value="0">평가 항목 코드</option>
					<%
					while(rs.next()){
					%>
					<option value="<%=rs.getString(1) %>"><%=rs.getString(2) %></option>
					<%
					}
					%>
				</select></td>
			</tr>
			<tr>
				<th>평가항목 1</th>
				<td><input name="item_one"> 점</td>
			</tr>
			<tr>
				<th>평가항목 2</th>
				<td><input name="item_two"> 점</td>
			</tr>
			<tr>
				<th>평가항목 3</th>
				<td><input name="item_three"> 점</td>
			</tr>
			<tr>
				<th>평가항목 4</th>
				<td><input name="item_four"> 점</td>
			</tr>
			<tr>
				<th>평가항목 5</th>
				<td><input name="item_five"> 점</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input type="submit" value="등록">
					<input type="reset" value="다시쓰기" onclick="confirm('정보를 지우고 처음부터 다시 입력 합니다!')">
				</td>
			</tr>
		</table>
		</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
<script type="text/javascript">
	function validCheck(){
		if(!form.company_code.value){
			alert('기업 코드가 입력되지 않았습니다!')
			form.company_code.focus()
			return false
		}
		if(form.item_code.value == "0"){
			alert('평가 항목 코드가 선택되지 않았습니다!')
			form.item_code.focus()
			return false
		}
		if(!form.item_one.value){
			alert('평가항목 1이 입력되지 않았습니다!')
			form.item_one.focus()
			return false
		}
		if(!form.item_two.value){
			alert('평가항목 2가 입력되지 않았습니다!')
			form.item_two.focus()
			return false
		}
		if(!form.item_three.value){
			alert('평가항목 3이 입력되지 않았습니다!')
			form.item_three.focus()
			return false
		}
		if(!form.item_four.value){
			alert('평가항목 4가 입력되지 않았습니다!')
			form.item_four.focus()
			return false
		}
		if(!form.item_five.value){
			alert('평가항목 5가 입력되지 않았습니다!')
			form.item_five.focus()
			return false
		}
		alert('기업 평가 정보 등록이 완료 되었습니다!')
		return true
	}
</script>
</html>