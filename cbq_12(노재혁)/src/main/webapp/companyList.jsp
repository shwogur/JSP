<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String company_code = request.getParameter("company_code");

	String sql = "select ev.company_code, company_name, decode(substr(co.company_code,1,1), 'A', '대기업', 'B', '중견기업', 'C', '중소기업', 'D', '벤처기업'), item_name, item_1, item_2, item_3, item_4, item_5, to_char(round(sum(item_1 + item_2 + item_3 + item_4 + item_5) / 5, 2), 'fm99.90'), case when sum(item_1 + item_2 + item_3 + item_4 + item_5) / 5 >= 90 then 'A' when sum(item_1 + item_2 + item_3 + item_4 + item_5) / 5 >= 80 then 'B' when sum(item_1 + item_2 + item_3 + item_4 + item_5) / 5 >= 70 then 'C' when sum(item_1 + item_2 + item_3 + item_4 + item_5) / 5 >= 60 then 'D' else 'F' end " 
			   + " from tbl_company_info co join tbl_esg_evaluation ev on co.company_code = ev.company_code join tbl_esg_info es on es.item_code = ev.item_code where ev.company_code = ? "
			   + " group by ev.company_code, company_name, decode(substr(co.company_code,1,1), 'A', '대기업', 'B', '중견기업', 'C', '중소기업', 'D', '벤처기업'), item_name, item_1, item_2, item_3, item_4, item_5";
	
	stmt = con.prepareStatement(sql);
	stmt.setString(1, company_code);
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
	<%
	if(!rs.next()){
	%>
	<h2>기업코드 : <%=company_code %> 조회 결과가 없습니다.</h2>
	<div align="center">
		<button type="button" onclick="location.href='eachCompany.jsp'">돌아가기</button>
	</div>
	<%
	}else{
	%>
	<h2>기업코드 : <%=company_code %> 평가 조회</h2>
	<table>
		<tr>
			<th>기업코드</th>
			<th>기업명</th>
			<th>기업분류</th>
			<th>평가항목</th>
			<th>평가항목 1</th>
			<th>평가항목 2</th>
			<th>평가항목 3</th>
			<th>평가항목 4</th>
			<th>평가항목 5</th>
			<th>평균</th>
			<th>등급</th>
		</tr>
		<%
		do{
		%>
		<tr>
			<td align="center"><%=rs.getString(1) %></td>
			<td align="center"><%=rs.getString(2) %></td>
			<td align="center"><%=rs.getString(3) %></td>
			<td align="center"><%=rs.getString(4) %></td>
			<td align="center"><%=rs.getString(5) %></td>
			<td align="center"><%=rs.getString(6) %></td>
			<td align="center"><%=rs.getString(7) %></td>
			<td align="center"><%=rs.getString(8) %></td>
			<td align="center"><%=rs.getString(9) %></td>
			<td align="center"><%=rs.getString(10) %></td>
			<td align="center"><%=rs.getString(11) %></td>
		</tr>
		<%
		}while(rs.next());
		%>
	</table>
	<div align="center">
		<button type="button" onclick="location.href='eachCompany.jsp'">돌아가기</button>
	</div>
	<%@include file="footer.jsp" %>
	<%
	}
	%>
	</section>
</body>
</html>