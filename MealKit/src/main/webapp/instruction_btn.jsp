<%@ page import="java.sql.*" %>
<%@ page import="utils.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
    int lotId = Integer.parseInt(request.getParameter("lotId"));
		int instId = Integer.parseInt(request.getParameter("instId"));
    int productId = Integer.parseInt(request.getParameter("productId"));
    int lotSize = Integer.parseInt(request.getParameter("lotSize"));
    String instDate = request.getParameter("instDate");

    Connection connection = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        connection = DBConfig.getConnection();
        connection.setAutoCommit(false);
        
        String checkInstSql = "SELECT COUNT(*) AS cnt FROM EMPLOYEES WHERE EMP_ID = ?";
        pstmt = connection.prepareStatement(checkInstSql);
        pstmt.setInt(1, instId);
        rs = pstmt.executeQuery();
        int instCount = 0;
        if(rs.next()) {
        	instCount = rs.getInt("cnt");
        }
        rs.close();
        pstmt.close();
        
        if(instCount == 0) {
        	response.sendRedirect("instruction.jsp?status=instNotFound");
        	return;
        }
        
        String checkProductSql = "SELECT COUNT(*) AS cnt FROM FINISHED_PRODUCT WHERE PRODUCT_ID = ?";
        pstmt = connection.prepareStatement(checkProductSql);
        pstmt.setInt(1, productId);
        rs = pstmt.executeQuery();
        
        int productCount = 0;
        if(rs.next()) {
        	productCount = rs.getInt("cnt");
        }
        rs.close();
        pstmt.close();
        
        if(productCount == 0) {
        	response.sendRedirect("instruction.jsp?status=productNotFound");
        	return;
        }
        
        if (lotSize % 1000 != 0) {
        	response.sendRedirect("instruction.jsp?status=invalidLotSize");
        	return;
        }
        
        String sql = "INSERT INTO INSTRUCTION (LOT_ID, INST_ID, PRODUCT_ID, LOT_SIZE, INST_DATE) VALUES (?, ?, ?, ?, ?)";
        pstmt = connection.prepareStatement(sql);
        pstmt.setInt(1, lotId);
        pstmt.setInt(2, instId);
        pstmt.setInt(3, productId);
        pstmt.setInt(4, lotSize);
        pstmt.setString(5, instDate);
        pstmt.executeUpdate();
        
        String sql2 = "INSERT INTO MANUFACTURING (LOT_ID, INST_ID, PRODUCT_ID, LOT_SIZE, INST_DATE) VALUES (?, ?, ?, ?, ?)";
        pstmt = connection.prepareStatement(sql2);
        pstmt.setInt(1, lotId);
        pstmt.setInt(2, instId);
        pstmt.setInt(3, productId);
        pstmt.setInt(4, lotSize);
        pstmt.setString(5, instDate);
        int affectedRows = pstmt.executeUpdate();
        
        if(affectedRows > 0) {
            response.sendRedirect("instruction.jsp?status=success");
        } else {
        		response.sendRedirect("instruction.jsp?status=error");
        }
    } catch (SQLException se) {
        se.printStackTrace();
        response.sendRedirect("instruction.jsp?status=error");
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {  }
        if (connection != null) try { connection.close(); } catch(SQLException e) {  }
    }
%>
</body>
</html>
