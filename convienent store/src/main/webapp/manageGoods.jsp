<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)session.getAttribute("msg");
	if(msg != null){
%>
<script>
	alert("<%=msg %>");
</script>
<%
	session.removeAttribute("msg");
	}
	//DB에서 데이터 가져와서 화면에 보여주기
	Connection conn = DBConnector.getConnection();
	String sql = "select goods_cd, goods_nm, to_char(goods_price, 'fml99,999,999'), to_char(cost, 'fml99,999,999'), to_char(in_date, 'yyyy-mm-dd') from goods_tbl_003";
	
	PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%@ include file = "./header.jsp" %>
	<%@ include file = "./nav.jsp" %>
	<section>
		<h1>상품관리</h1>
		<table border="1">
			<tr>
				<td>상품코드</td>
				<td>상품명</td>
				<td>단가</td>
				<td>원가</td>
				<td>입고일자</td>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td><a href="updateGoods.jsp?goods_cd=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
				<td><%=rs.getString(2) %></td>
				<td align="right"><%=rs.getString(3) %></td>
				<td align="right"><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
			</tr>
			<%
			}
			%>
			<tr>
				<td colspan="5" align="center"><input type="button" value="등록" onclick='location.href="addGoods.jsp"'></td>
			</tr>
		</table>
	</section>
	<%@ include file = "./footer.jsp" %>
</body>
</html>