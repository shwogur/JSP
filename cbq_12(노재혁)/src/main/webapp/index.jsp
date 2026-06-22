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
		<h2>기업 평가 정보 프로그램</h2>
		<span>
		- 업무요건에 따라 기업 정보 테이블, ESG 정보테이블, ESG 평가 테이블을 생성하여야 한다.<br><br>
		- 기업 정보 테이블, ESG 정보 테이블, ESG 평가 테이블의 입력 데이터들은 샘플데이터를 참조하여 입력하고, 해당 데이터를 이용하여 프로그램 작성과 테스트를 실시하여야 한다.<br><br>
		- ESG 평가 테이블의 데이터는 샘플데이터를 참조하며, 기업정보등록 화면을 이용하여 입력한다.<br><br>
		- 개별 기업평가 조회 업무는 기업 코드를 활용하여 개별 기업평가 정보를 조회할 수 있다.<br><br>
		- 전체 기업평가 조회 업무는 전체 기업의 평가 정보를 조회할 수 있다.
		</span>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>