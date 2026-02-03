<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	String regist_no = request.getParameter("regist_no");

	String sql = "delete from tbl_class_2026 where regist_no = ?";
	
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, regist_no);
	
	int result = stmt.executeUpdate();
	
	if(result > 0){
		response.sendRedirect("courseList.jsp");
	}
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