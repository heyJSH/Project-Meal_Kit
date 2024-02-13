<%@ page import="java.sql.*" %>
<%@ page import="utils.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		request.setCharacterEncoding("UTF-8"); //한글 처리

    int empId = Integer.parseInt(request.getParameter("empId"));
		String empPw = "1234";
		String empNm = request.getParameter("empNm");
		String empContact = request.getParameter("empContact");
		int depId = Integer.parseInt(request.getParameter("depId"));
		String depNm = request.getParameter("depNm");
		String empRole = request.getParameter("empRole");

    Connection connection = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        connection = DBConfig.getConnection();
        connection.setAutoCommit(false);
        
        String sql = "INSERT INTO EMPLOYEES (EMP_ID, EMP_PW, EMP_NM, EMP_CONTACT, DEP_ID, DEP_NM, EMP_ROLE) VALUES (?, ?, ?, ?, ?, ?, ?)";
        pstmt = connection.prepareStatement(sql);
        pstmt.setInt(1, empId);
        pstmt.setString(2, empPw);
        pstmt.setString(3, empNm);
        pstmt.setString(4, empContact);
        pstmt.setInt(5, depId);
        pstmt.setString(6, depNm);
        pstmt.setString(7, empRole);
        int affectedRows = pstmt.executeUpdate();
        
        if(affectedRows > 0) {
            response.sendRedirect("employees.jsp?status=success");
        } else {
        		response.sendRedirect("employees.jsp?status=error");
        }
    } catch (SQLException se) {
        se.printStackTrace();
        response.sendRedirect("employees.jsp?status=error");
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {  }
        if (connection != null) try { connection.close(); } catch(SQLException e) {  }
    }
%>
</body>
</html>
