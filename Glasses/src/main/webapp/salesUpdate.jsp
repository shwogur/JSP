<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String sale_no = request.getParameter("sale_no");

	String sql = "select sale_no, cust_no, p_code, amount, to_char(sale_date, 'yyyymmdd') from tbl_order_01 where sale_no = ?";
	
	stmt = con.prepareStatement(sql);
	stmt.setString(1, sale_no);
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
		<h2>매출 현황 수정 페이지</h2>
		<form action="action2.jsp" name="form" method="get">
			<table>
				<%
				if(rs.next()){
				%>
				<tr>
					<th>매출번호</th>
					<td align="center"><input value="<%=rs.getString(1) %>" name="sale_no" readonly></td>
				</tr>
				<tr>
					<th>회원번호</th>
					<td align="center"><input value="<%=rs.getString(2) %>" name="cust_no"></td>
				</tr>
				<tr>
					<th>상품코드</th>
					<td align="center"><input value="<%=rs.getString(3) %>" name="p_code"></td>
				</tr>
				<tr>
					<th>판매수량</th>
					<td align="center"><input value="<%=rs.getString(4) %>" name="amount"></td>
				</tr>
				<tr>
					<th>판매일자</th>
					<td align="center"><input value="<%=rs.getString(5) %>" name="sale_date"></td>
				</tr>
				<%
				}
				rs.close();
				stmt.close();
				con.close();
				%>
				<tr>
					<td align="center" colspan="2">
						<input type="submit" value="수정하기">
						<button><a href="salesList.jsp">돌아가기</a></button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>