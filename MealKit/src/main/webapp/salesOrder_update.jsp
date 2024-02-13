<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	/* System.out.println("OK"); */
	
	String order_num = request.getParameter("ORDER_NUM");
	String cust_id = request.getParameter("CUST_ID");
	String cust_name = request.getParameter("CUST_NAME");
	String product_id = request.getParameter("PRODUCT_ID");
	String product_name = request.getParameter("PRODUCT_NAME");
	String quantity = request.getParameter("QUANTITY");
		
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@1.220.247.78:1522:orcl", "semi_project1", "123451");
		
		String sql = "UPDATE SALES_ORDER SET CUST_ID = ?, CUST_NAME = ?, PRODUCT_ID = ?, PRODUCT_NAME = ?, QUANTITY = ? WHERE ORDER_NUM = ?";
		
		pstmt = conn.prepareStatement(sql);		

		pstmt.setInt(1, Integer.parseInt(cust_id));
		pstmt.setString(2, cust_name);
		pstmt.setInt(3, Integer.parseInt(product_id));
		pstmt.setString(4, product_name);
		pstmt.setInt(5, Integer.parseInt(quantity));
		pstmt.setInt(6, Integer.parseInt(order_num));

		
		pstmt.executeUpdate();
		

		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>


<script> alert("수정이 완료되었습니다");
		location.href = '<%= request.getContextPath() %>/salesOrder_select.jsp';
</script>

</body>
</html>