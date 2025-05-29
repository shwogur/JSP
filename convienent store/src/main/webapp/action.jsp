<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//화면에서 입력한 내용 가져오기
	//판매번호, 판매일자, 판매구분, 판매점포, 판매상품, 판매수량, 수취구분
	String sale_no = request.getParameter("sale_no");
	String sale_ymd = request.getParameter("sale_ymd");
	String sale_fg = request.getParameter("sale_fg");
	String store_cd = request.getParameter("store_cd");
	String goods_cd = request.getParameter("goods_cd");
	String sale_cnt = request.getParameter("sale_cnt");
	String pay_type = request.getParameter("pay_type");
	
	//DB에 가져온 데이터 저장
	Connection conn = DBConnector.getConnection();
	String sql = "insert into sale_tbl_003 values (?, ?, ?, ?, ?, ?, ?)";
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	stmt.setString(1, sale_no);
	stmt.setString(2, sale_ymd);
	stmt.setString(3, sale_fg);
	stmt.setString(4, store_cd);
	stmt.setString(5, goods_cd);
	stmt.setString(6, sale_cnt);
	stmt.setString(7, pay_type);
	
	String msg = "";
	if(stmt.executeUpdate() > 0)
		msg = "매출이 정상적으로 저장되었습니다.";
	else
		msg = "오류 발생!!";
	
	session.setAttribute("msg", msg);
	response.sendRedirect("conditionSales.jsp");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>