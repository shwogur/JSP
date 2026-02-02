<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<h2>성적 관리 프로그램</h2>
		학생 성적에 관한 데이터베이스를 구축하고 관리하기 위한 프로그램입니다.<br>
		<span>
		1. 학생정보, 과목정보, 성적정보 테이블을 생성하고 샘플데이터를 추가한다.<br>
		2. 개인성적등록, 개인별성적조회, 전체성적 조회 기능을 구현한다.<br>
		3. 올바르게 구현되었는지 확인한다.
		</span>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>