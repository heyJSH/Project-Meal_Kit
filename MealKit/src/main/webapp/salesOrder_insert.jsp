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
<title>Sales order insert</title>
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
	String order_date = request.getParameter("ORDER_DATE");
	String requst_date = request.getParameter("REQUST_DATE");
 	String emp_id = request.getParameter("EMP_ID");
	String emp_nm = request.getParameter("EMP_NM"); 
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "INSERT INTO SALES_ORDER (ORDER_NUM,CUST_ID,CUST_NAME,PRODUCT_ID,PRODUCT_NAME,QUANTITY,ORDER_DATE,REQUST_DATE,EMP_ID,EMP_NM)	VALUES(?,?,?,?,?,?,?,?,?,?)";
/* 	String sql = "INSERT INTO SALES_ORDER (ORDER_NUM,CUST_ID,CUST_NAME,PRODUCT_ID,PRODUCT_NAME,QUANTITY,ORDER_DATE,REQUST_DATE)	VALUES(?,?,?,?,?,?,?,?)"; */
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@1.220.247.78:1522:orcl", "semi_project1", "123451");
		

		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, Integer.parseInt(order_num));
		pstmt.setInt(2, Integer.parseInt(cust_id));
		pstmt.setString(3, cust_name);
		pstmt.setInt(4, Integer.parseInt(product_id));
		pstmt.setString(5, product_name);
		pstmt.setInt(6, Integer.parseInt(quantity));
		pstmt.setString(7, (order_date));
		pstmt.setString(8, (requst_date));
 		pstmt.setInt(9, Integer.parseInt(emp_id));
		pstmt.setString(10, emp_nm);
		
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
<script> alert("입력이 완료되었습니다");
		location.href = '<%= request.getContextPath() %>/salesOrder_select.jsp';
</script>

<!-- <a href="salesOrder_select.jsp">확인하기</a> -->
</body>
</html>