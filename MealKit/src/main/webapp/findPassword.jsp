<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="utils.DBConfig"%> <!-- DBConfig 클래스를 사용하도록 수정 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>

<!-- 비밀번호 찾기 -->
<%
	// 입력된 정보 받기
	String empId = request.getParameter("empId");
	String empContact = request.getParameter("empContact");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		// 데이터베이스 연결
		conn = DBConfig.getConnection(); // 수정된 부분
		
	    // 비밀번호 찾기를 위한 SQL 쿼리
	    String sql = "SELECT EMP_PW FROM EMPLOYEES WHERE EMP_ID=? AND EMP_CONTACT=?";
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setInt(1, Integer.parseInt(empId));
	    pstmt.setString(2, empContact);
	    
	    rs = pstmt.executeQuery();
	    
	    if (rs.next()) {
	        String empPw = rs.getString("EMP_PW");
	        out.println("<script>alert('비밀번호는 " + empPw + " 입니다.'); location.href='login.jsp';</script>");
	    } else {
	        out.println("<script>alert('정보가 일치하지 않습니다.'); location.href='login.jsp';</script>");
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	    out.println("<script>alert('시스템 오류가 발생했습니다.');location.href='login.jsp';</script>");
	} finally {
	    if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	    if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	    if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
%>

</body>
</html>