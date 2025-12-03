<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp" %>
<%
	String grade = request.getParameter("grade").substring(0,1);
	String classs = request.getParameter("classs");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	
	int classNum = Integer.parseInt(classs);
	
	String realClass = "";
	String dno = "";
	
	if(classNum == 1){
		dno = "1";
		realClass = "3";
	}else if(classNum == 2){
		dno = "2";
		realClass = "4";
	}
	
	if(Integer.parseInt(realClass) < 10){
		realClass = "0" + realClass;
	}
	
	String sql = "select max(id) from student where id like ?";
	stmt = con.prepareStatement(sql);
	stmt.setString(1, grade + realClass + "%");
	
	rs = stmt.executeQuery();
	
	String newId = "";
	if(rs.next() && rs.getString(1) != null){
		newId = String.valueOf(Integer.parseInt(rs.getString(1))+1);
	}else{
		newId = grade + realClass + "01";
	}
	
	rs.close();
	stmt.close();
	
	String sql1 = "insert into student(id, name, dno, gender) values(?,?,?,?)";
	PreparedStatement stmt1 = con.prepareStatement(sql1);
	
	stmt1.setString(1, newId);
	stmt1.setString(2, name);
	stmt1.setString(3, dno);
	stmt1.setString(4, gender);
	
	if(stmt1.executeUpdate() > 0){
		response.sendRedirect("index.jsp");
	}
	stmt1.close();
	con.close();
%>