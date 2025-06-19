<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/style.css">
<%
	String soption = request.getParameter("soption");
	String selec = request.getParameter("selec");
%>
</head>
<body>
	<%@include file="header.jsp" %>
	<%@include file="nav.jsp" %>
	<section>
		<h2>조회화면(선택)</h2>
		<p>
		<%
		if(soption.equals("1")){
			System.out.print("학번이");
		}
		else if(selec.equals("2")){
			System.out.print("성명이");
		}
		%>
		<%=selec %>인 후보정보를 조회합니다.
		</p>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>