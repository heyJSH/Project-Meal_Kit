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
    Connection connection = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    System.out.println(output);

    try {
        connection = DBConfig.getConnection();
        connection.setAutoCommit(false);
        
        String fetchSql = "SELECT FP.PRODUCT_QUANTITY FROM FINISHED_PRODUCT FP INNER JOIN PRODUCTION_ORDER PO ON FP.PRODUCT_ID = PO.PRODUCT_ID WHERE PO.LOT_ID = ?";
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
        
        String updateSql = "UPDATE FINISHED_PRODUCT SET PRODUCT_QUANTITY = ? WHERE PRODUCT_ID IN (SELECT PRODUCT_ID FROM PRODUCTION_ORDER WHERE LOT_ID = ?)";
        pstmt = connection.prepareStatement(updateSql);
        pstmt.setInt(1, newQuantity);
        pstmt.setString(2, lotId);
        pstmt.executeUpdate();
        pstmt.close();
        
        String materialSql = "SELECT M.MATERIAL_ID, (PO.LOT_SIZE / 1000 * B.BOM_QUA) AS MATERIAL_TO_DEDUCT FROM MATERIAL M INNER JOIN BOM B ON M.MATERIAL_ID = B.MATERIAL_ID INNER JOIN PRODUCTION_ORDER PO ON B.PRODUCT_ID = PO.PRODUCT_ID WHERE PO.LOT_ID = ?";
        pstmt = connection.prepareStatement(materialSql);
        pstmt.setString(1, lotId);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            int materialId = rs.getInt("MATERIAL_ID");
            int materialToDeduct = rs.getInt("MATERIAL_TO_DEDUCT");

            // Deduct the materialToDeduct from MATERIAL table
            String updateMaterialSql = "UPDATE MATERIAL SET MATERIAL_QUANTITY = MATERIAL_QUANTITY - ? WHERE MATERIAL_ID = ?";
            PreparedStatement updatePstmt = connection.prepareStatement(updateMaterialSql);
            updatePstmt.setInt(1, materialToDeduct);
            updatePstmt.setInt(2, materialId);
            updatePstmt.executeUpdate();
            updatePstmt.close();
        }
        
        rs.close();
        pstmt.close();

        String sql = "DELETE FROM PRODUCTION_ORDER WHERE LOT_ID = ?";
        pstmt = connection.prepareStatement(sql);
        pstmt.setString(1, lotId);
        int affectedRows = pstmt.executeUpdate();
        
        if(affectedRows >= 0) {
        	connection.commit();
        	response.sendRedirect("manu_inst.jsp");
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
        if (rs != null) try { rs.close(); } catch(SQLException e) { /* ignored */ }
        if (pstmt != null) try { pstmt.close(); } catch(SQLException e) { /* ignored */ }
        if (connection != null) try { connection.close(); } catch(SQLException e) { /* ignored */ }
    }
%>
</body>
</html>
