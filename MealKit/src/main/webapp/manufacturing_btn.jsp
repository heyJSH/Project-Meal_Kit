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
    String lotId = request.getParameter("lotId");
		int output = Integer.parseInt(request.getParameter("output_"+lotId));
		String manuDate = request.getParameter("manuDate_"+lotId);
		int manuId = Integer.parseInt(request.getParameter("manuId_"+lotId));
    Connection connection = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    System.out.println(output);

    try {
        connection = DBConfig.getConnection();
        connection.setAutoCommit(false);
        
        String checkManuSql = "SELECT COUNT (*) AS cnt FROM EMPLOYEES WHERE EMP_ID = ?";
        pstmt = connection.prepareStatement(checkManuSql);
        pstmt.setInt(1, manuId);
        rs = pstmt.executeQuery();
        int manuCount = 0;
        if(rs.next()) {
        	manuCount = rs.getInt("cnt");
        }
        rs.close();
        pstmt.close();
        
        if(manuCount == 0) {
        	response.sendRedirect("manufacturing.jsp?status=manuNotFound");
        	return;
        }
        
        String fetchSql = "SELECT FP.PRODUCT_QUANTITY FROM FINISHED_PRODUCT FP INNER JOIN MANUFACTURING M ON FP.PRODUCT_ID = M.PRODUCT_ID WHERE M.LOT_ID = ?";
        pstmt = connection.prepareStatement(fetchSql);
        pstmt.setString(1, lotId);
        rs = pstmt.executeQuery();
        int currentQuantity = 0;
        
        if (rs.next()) {
            currentQuantity = rs.getInt("PRODUCT_QUANTITY");
        }
        
        rs.close();
        pstmt.close();
        
        int newQuantity = currentQuantity + output;
        System.out.println(newQuantity);
        
        String updateSql = "UPDATE FINISHED_PRODUCT SET PRODUCT_QUANTITY = ? WHERE PRODUCT_ID IN (SELECT PRODUCT_ID FROM MANUFACTURING WHERE LOT_ID = ?)";
        pstmt = connection.prepareStatement(updateSql);
        pstmt.setInt(1, newQuantity);
        pstmt.setString(2, lotId);
        pstmt.executeUpdate();
        pstmt.close();
        
        String materialSql = "SELECT M.MATERIAL_ID, (M.LOT_SIZE / 1000 * B.BOM_PROD_QUANTITY) AS MATERIAL_TO_DEDUCT FROM MATERIAL M INNER JOIN BOM B ON M.MATERIAL_ID = B.MATERIAL_ID INNER JOIN MANUFACTURING M ON B.PRODUCT_ID = M.PRODUCT_ID WHERE M.LOT_ID = ?";
        pstmt = connection.prepareStatement(materialSql);
        pstmt.setString(1, lotId);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            int materialId = rs.getInt("MATERIAL_ID");
            int materialToDeduct = rs.getInt("MATERIAL_TO_DEDUCT");

            String updateMaterialSql = "UPDATE MATERIAL SET MATERIAL_QUANTITY = MATERIAL_QUANTITY - ? WHERE MATERIAL_ID = ?";
            PreparedStatement updatePstmt = connection.prepareStatement(updateMaterialSql);
            updatePstmt.setInt(1, materialToDeduct);
            updatePstmt.setInt(2, materialId);
            updatePstmt.executeUpdate();
            updatePstmt.close();
        }
        
        rs.close();
        pstmt.close();
        
        String sql2 = "UPDATE INSTRUCTION SET OUTPUT = ?, MANU_DATE = ?, MANU_ID = ? WHERE LOT_ID = ?";
				PreparedStatement updatePstmt2 = connection.prepareStatement(sql2);
				updatePstmt2.setInt(1, output);
				updatePstmt2.setString(2, manuDate);
				updatePstmt2.setInt(3, manuId);
				updatePstmt2.setString(4, lotId);
				updatePstmt2.executeUpdate();
				updatePstmt2.close();
        
        String sql = "DELETE FROM MANUFACTURING WHERE LOT_ID = ?";
        pstmt = connection.prepareStatement(sql);
        pstmt.setString(1, lotId);
        int affectedRows = pstmt.executeUpdate();
        
        if(affectedRows >= 0) {
        	connection.commit();
        	response.sendRedirect("manufacturing.jsp");
        } else {
        	connection.rollback();
        }
    } catch (SQLException se) {
    	if (connection != null) {
    		try {
    			connection.rollback();
    		} catch (SQLException e) {
    			
    		}
    	}
    } finally {
        if (rs != null) try { rs.close(); } catch(SQLException e) {  }
        if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {  }
        if (connection != null) try { connection.close(); } catch(SQLException e) {  }
    }
%>
</body>
</html>
