<%@page import="jakarta.servlet.RequestDispatcher"%>
<%@page import="vaccine.RestVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp"%>
<%
	//resvno 받아오기
	String resvno = request.getParameter("resvno");
	
	//DB에서 resvno에 해당하는 예약정보를 받아오기
	String sql = "select pname, resvno, j.jumin, decode(substr(j.jumin, 8, 1), 1, '남', 2, '여'), tel, to_char(to_date(resvdate, 'yyyymmdd'), 'yyyy\"년\"mm\"월\"dd\"일\"'), substr(resvtime, 1, 2) || ':' || substr(resvtime, 3, 2), hospname, hosptel, hospaddr, decode(v.vcode, 'V001', 'A백신', 'V002', 'B백신', 'V003', 'C백신') from tbl_vaccresv_202108 v, tbl_jumin_201808 j, tbl_hosp_202108 h where v.jumin = j.jumin and v.hospcode = h.hospcode and resvno = ?";
	stmt = con.prepareStatement(sql);
	
	stmt.setString(1, resvno);
	
	rs = stmt.executeQuery();
	
	RestVO vo = null;
	
	if(rs.next()){
		vo = new RestVO();
		
		vo.setName(rs.getString(1));
		vo.setResvno(rs.getString(2));
		vo.setJumin(rs.getString(3));
		vo.setGender(rs.getString(4));
		vo.setTel(rs.getString(5));
		vo.setResvdate(rs.getString(6));
		vo.setResvtime(rs.getString(7));
		vo.setHostpname(rs.getString(8));
		vo.setHosptel(rs.getString(9));
		vo.setHospaddr(rs.getString(10));
		vo.setVcode(rs.getString(11));
	}

	//가져온 내용을 이용해서 화면 열기
	request.setAttribute("vo", vo);
	RequestDispatcher view = request.getRequestDispatcher("result.jsp");
	view.forward(request, response);
	
	stmt.close();
	con.close();
%>