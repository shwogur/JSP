<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//판매점포와 판매상품을 가져와서 select에 알려주기
	Connection conn = DBConnector.getConnection();
	String sql = "select * from store_tbl_003";
	PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery();
	
	sql = "select * from goods_tbl_003";
	PreparedStatement stmt2 = conn.prepareStatement(sql);
	ResultSet rs2 = stmt2.executeQuery();
	
	//화면에 들어오면 자동발생하는 판매번호와 판매일자를 받아오기
	sql = "select to_char(sale_sq.nextval, 'fm0000'), to_char(sysdate, 'yyyymmdd') from dual";
	PreparedStatement stmt3 = conn.prepareStatement(sql);
	ResultSet rs3 = stmt3.executeQuery();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<script type="text/javascript">
function validcheck(){
	if(form.goods_cd.value === ''){
		alert("상품코드를 입력하지 않았습니다.");
		form.goods_cd.focus();
		return false;
	}
	if(form.sale_cnt.value === ''){
		alert("상품수량을 입력하지 않았습니다.");
		form.goods_cd.focus();
		return false;
	}
	return true;
}
</script>
</head>
<body>
	<%@ include file = "./header.jsp" %>
	<%@ include file = "./nav.jsp" %>
	<section>
		<h1>매출등록</h1>
		<form name="form" action="action.jsp" method="post" onsubmit="return validcheck();">
		<table border="1">
		<%
		if(rs3.next()){
		%>
			<tr>
				<td>판매번호(자동발생)</td>
				<td><input type="text" name="sale_no" value="<%=rs3.getString(1) %>"></td>
			</tr>
			<tr>
				<td>판매일자(자동발생)</td>
				<td><input type="text" name="sale_ymd" value="<%=rs3.getString(2) %>"></td>
			</tr>
			<%
			}
			%>
			<tr>
				<td>판매구분</td>
				<td>
					<select name="sale_fg">
					<option value="">선택</option>
					<option value="0">판매</option>
					<option value="1">판매취소</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>판매점포</td>
				<td>
					<select name="store_cd">
					<option value="">선택</option>
					<%
					while(rs.next()){
					%>
					<option value="<%=rs.getString(1) %>"><%=rs.getString(2) %></option>
					<%
					}
					%>
				</select>
				</td>
			</tr>
			<tr>
				<td>판매상품</td>
				<td>
					<select name="goods_cd">
						<option>선택</option>
								<%
					while(rs2.next()){
					%>
					<option value="<%=rs2.getString(1) %>"><%=rs2.getString(2) %></option>
					<%
					}
					%>
					</select>
				</td>
			</tr>
			<tr>
				<td>판매수량</td>
				<td><input type="text" name="sale_cnt"></td>
			</tr>
			<tr>
				<td>수취구분</td>
				<td>
					<select name="pay_type">
						<option value="">선택</option>
						<option value="01">현금</option>
						<option value="02">카드</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="등록">
				<input type="button" value="조회">
				</td>
			</tr>
		</table>
		</form>
	</section>
	<%@ include file = "./footer.jsp" %>	
</body>
</html>