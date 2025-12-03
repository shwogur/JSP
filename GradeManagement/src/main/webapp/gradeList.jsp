<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학기별 성적 조회</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@include file="header.jsp"%>
	<%@include file="nav.jsp"%>
	<section>
		<h2>학기별 성적 조회</h2>
		<form name="form" method="get">
			<table>
				<tr>
					<th>시험시기</th>
					<td><input type="text" name="sdate"
						value="<%= request.getParameter("sdate") != null ? request.getParameter("sdate") : "" %>"></td>
					<th>학기</th>
					<td><input type="text" name="semester"
						value="<%= request.getParameter("semester") != null ? request.getParameter("semester") : "" %>"></td>
				</tr>
				<tr>
					<th>과목</th>
					<td><select name="sno">
							<option value="1"
								<%= "1".equals(request.getParameter("sno")) ? "selected" : "" %>>국어</option>
							<option value="2"
								<%= "2".equals(request.getParameter("sno")) ? "selected" : "" %>>영어</option>
							<option value="3"
								<%= "3".equals(request.getParameter("sno")) ? "selected" : "" %>>수학</option>
							<option value="4"
								<%= "4".equals(request.getParameter("sno")) ? "selected" : "" %>>공간</option>
					</select></td>
				</tr>
				<tr>
					<th>시험종류</th>
					<td><input type="radio" name="stype" value="1"
						<%= "1".equals(request.getParameter("stype")) ? "checked" : "" %>>중간
						<input type="radio" name="stype" value="2"
						<%= "2".equals(request.getParameter("stype")) ? "checked" : "" %>>기말
						<input type="radio" name="stype" value="3"
						<%= "3".equals(request.getParameter("stype")) ? "checked" : "" %>>학기말
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center"><input type="submit" value="조회"></td>
				</tr>
			</table>
		</form>

<%
    // 폼 값이 있는 경우에만 조회
    String sdate = request.getParameter("sdate");
    String semester = request.getParameter("semester");
    String sno = request.getParameter("sno");
    String stype = request.getParameter("stype");

    if(sdate != null && !sdate.isEmpty() &&
       semester != null && !semester.isEmpty() &&
       sno != null && !sno.isEmpty() &&
       stype != null && !stype.isEmpty()) {

        PreparedStatement stmt1 = null;
        ResultSet rs1 = null;
        String sql = "";

        if(stype.equals("3")) { // 학기말 → 중간+기말 평균
            sql = "SELECT s.id, st.name, ROUND(AVG(s.score)) AS score " +
                  "FROM score s " +
                  "JOIN student st ON s.id = st.id " +
                  "WHERE s.sdate=? AND s.semester=? AND s.sno=? AND s.stype IN ('1','2') " +
                  "GROUP BY s.id, st.name";
            stmt1 = con.prepareStatement(sql);
            stmt1.setString(1, sdate);
            stmt1.setString(2, semester);
            stmt1.setString(3, sno);
        } else {
            sql = "SELECT s.id, st.name, s.score " +
                  "FROM score s " +
                  "JOIN student st ON s.id = st.id " +
                  "WHERE s.sdate=? AND s.semester=? AND s.sno=? AND s.stype=?";
            stmt1 = con.prepareStatement(sql);
            stmt1.setString(1, sdate);
            stmt1.setString(2, semester);
            stmt1.setString(3, sno);
            stmt1.setString(4, stype);
        }

        rs1 = stmt1.executeQuery();

        // 결과를 리스트에 저장
        List<Map<String, Object>> list = new ArrayList<>();
        while(rs1.next()) {
            Map<String, Object> map = new HashMap<>();
            map.put("id", rs1.getString("id"));
            map.put("name", rs1.getString("name"));
            map.put("score", rs1.getInt("score"));
            list.add(map);
        }

        rs1.close();
        stmt1.close();

        // 성적 기준 내림차순 정렬 → 등수 계산
        List<Map<String, Object>> rankList = new ArrayList<>(list);
        rankList.sort((a, b) -> ((Integer)b.get("score")).compareTo((Integer)a.get("score")));

        Map<String, Integer> rankMap = new HashMap<>();
        int rank = 1;
        for(Map<String, Object> m : rankList){
            rankMap.put((String)m.get("id"), rank++);
        }

        // 학번 오름차순으로 출력
        list.sort((a, b) -> ((String)a.get("id")).compareTo((String)b.get("id")));
%>
<table border="1">
    <tr>
        <th>학번</th>
        <th>이름</th>
        <th>성적</th>
        <th>등수</th>
    </tr>
<%
        for(Map<String, Object> m : list){
%>
    <tr>
        <td align="center"><%= m.get("id") %></td>
        <td align="center"><%= m.get("name") %></td>
        <td align="center"><%= m.get("score") %></td>
        <td align="center"><%= rankMap.get(m.get("id")) %></td>
    </tr>
<%
        }
%>
</table>
<%
    }
%>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>