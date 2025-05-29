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
	String sql = "select st.store_nm, " +
				 " to_char(sum(case pay_type when '01' then goods_price * sale_cnt else 0 end), 'fm9,999'), " +
				 " to_char(sum(case pay_type when '02' then goods_price * sale_cnt else 0 end), 'fm9,999'), " +
				 " to_char(sum(goods_price * sale_cnt), 'fm99,999') " +
				 " from store_tbl_003 st, sale_tbl_003 s, goods_tbl_003 g " +
				 " where st.store_cd = s.store_cd " +
				 " and s.goods_cd = g.goods_cd " +
				 " group by st.store_nm " +
				 " order by 4 desc";
	
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
		<h1>점포별 매출현황</h1>
		<table border="1">
			<tr>
				<td>점포명</td>
				<td>현금매출</td>
				<td>카드매출</td>
				<td>총매출</td>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %>원</td>
				<td><%=rs.getString(3) %>원</td>
				<td><%=rs.getString(4) %>원</td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
	<%@ include file = "./footer.jsp" %>
</body>
</html>