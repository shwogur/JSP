<%@page import="vaccine.RestVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp"%>
<%
RestVO vo = (RestVO) request.getAttribute("vo");
%>
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
		<%
		if (vo == null) {
		%>
		<h1>접종예약정보가 존재하지 않습니다!</h1>
		<%
		}else {
		%>
		<h2><%=vo.getResvno() %></h2>
		<table>
			<tr>
				<th>이름</th>
				<th>주민번호</th>
				<th>성별</th>
				<th>전화번호</th>
				<th>예약일자</th>
				<th>예약시간</th>
				<th>병원명</th>
				<th>대표전화</th>
				<th>병원주소</th>
				<th>백신종류</th>
			</tr>
			<tr>
				<td><%=vo.getName()%></td>
				<td><%=vo.getJumin()%></td>
				<td><%=vo.getGender()%></td>
				<td><%=vo.getTel()%></td>
				<td><%=vo.getResvdate()%></td>
				<td><%=vo.getResvtime()%></td>
				<td><%=vo.getHostpname()%></td>
				<td><%=vo.getHosptel()%></td>
				<td><%=vo.getHospaddr()%></td>
				<td><%=vo.getVcode()%></td>
			</tr>
		</table>
		<%
		}
		%>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>