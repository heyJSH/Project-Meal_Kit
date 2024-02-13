<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.PreparedStatement"%>
<%@ page import = "java.lang.Exception, java.sql.SQLException" %>
<%@ page import = "java.util.*" %>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
	 integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<!-- reset.css 연결 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
	<!-- main.css 연결 -->
	<link rel="stylesheet" href="./css/main.css" />
	<!-- format.css 연결 -->
	<link rel="stylesheet" href="./css/format.css" />
		
	<!-- google font & google material icon -->
	<!-- Google 나눔고딕 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" />
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
		
	<!-- jQuery 연결 -->
	<script defer src="./js/jquery-3.7.1.min.js"></script>
	<script defer src="./js/main.js"></script>

<style>

	.headerM{width:1100px; box-sizing: border-box; text-align:right; font-style: italic; font-size: larger; font-weight: 600}
	.containerM{border:1px solid #666; background-color: #bbb;
		padding: 40px 0; box-sizing: border-box; height: 741px}
	.theader{background-color: darkblue; color: white; margin: 0 auto}
	.order th{border-collapse:collapse; border: 1px solid #fff; box-sizing: border-box; width:130px}
	.order2{ margin: 0 auto;}
	.responsible{background-color: white; margin-left: 50px; border-collapse:collapse; border: 1px solid #fff }
	.selecter{margin:20px 20px 20px 50px}
	tr{height: 22px; background-color: gray; color: white;}
	.responsible th{border-collapse:collapse; border: 1px solid #fff;}
	.order{background-color: white; margin: 0 auto}
	.order th{border-collapse:collapse; border: 1px solid #fff; box-sizing: border-box;}
	.order2 td{border-collapse:collapse; border: 2px double #999; box-sizing: border-box;width:130px; 
		background-color:white; color: black; text-align: center}
	.containerM .reviewT{width: 1188px; height:366px; overflow-y:scroll; margin: 0 0 0 54px; box-sizing: content-box}


</style>
<title>Sales order select</title>

</head>
<body>

  <%@ include file="header.jsp" %>
	
<section class="hello_World">
<!-- ================================================================================ -->


<div class="containerM">

<div class="headerM"><h2><a href="salesOrder_main.jsp">Sales order review</a></h2></div>
	<form action="salesOrder_delete.jsp" method="post">

	<table class="responsible" border=1>
	  <tr>
		<th>담당자 번호</th>
		<th>담당자 명</th>
	  </tr>
	  <tr>
	  	<td><input type="number"></td>
	  	<td><input type="text"></td>
	  </tr>
	</table>
	

	
	<div class="selecter">
		<input type = "button" value="입력" onClick="location.href='salesOrder_insertForm.jsp'">
		<input type = "button" value="수정" onClick="location.href='salesOrder_updateForm.jsp'">
	</div>


	<div>
		<table class="order">
		  <thead>
		  	<tr>
				<th>주문번호</th>
				<th>고객번호</th>
				<th>고객명</th>
				<th>제품번호</th>
				<th>제품명</th>
				<th>수량</th>
				<th>주문일</th>
				<th>요청일</th>
				<th>비고</th>
			</tr>
		  </thead>	
		  </table>	
 </div>

	  

	
 <div class="reviewT">
	 <table class="order2">
		
	<%
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver"); //driver
		conn = DriverManager.getConnection("jdbc:oracle:thin:@1.220.247.78:1522:orcl", "semi_project1", "123451");
		String sql = "SELECT ORDER_NUM , CUST_ID , CUST_NAME, PRODUCT_ID , PRODUCT_NAME , QUANTITY , ORDER_DATE , REQUST_DATE FROM SALES_ORDER ORDER BY ORDER_NUM DESC";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){ //조회되는 로우(행) 반복
			out.print("<tr>");
			out.print("<td>" + rs.getInt("order_num") + "</td>");
			out.print("<td>" + rs.getInt("cust_id") + "</td>");
			out.print("<td>" + rs.getString("cust_name") + "</td>");
			out.print("<td>" + rs.getInt("product_id") + "</td>");
			out.print("<td>" + rs.getString("product_name") + "</td>");
			out.print("<td>" + rs.getInt("quantity") + "</td>");
			out.print("<td>" + rs.getDate("order_date") + "</td>");
			out.print("<td>" + rs.getDate("requst_date") + "</td>");
			out.print("<td>"+"<button onClick='javascript: noticeDelete(" + rs.getInt("order_num") + ")'>삭제</td>");

			out.print("</tr>");
		}
		
		rs.close();
		pstmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	%>
	
	  </table>	  
	</div>
	

	</form>
<!-- ============================================================================== -->


	<!-- footer 공통 부분 연결 -->
	
	
</div>
	<%@ include file="footer.jsp" %>
</section>
    <script>
    	function searchText() {
    		location.href = "./salesOrder_select.jsp?search=" + $('#search-text').val();
    	}
    	
    	function noticeDelete(noticeNum) {
    		if (confirm('정말 삭제하시겠습니까?')) {
    			location.href = "./salesOrder_delete.jsp?order_num=" + noticeNum;
    		}
    	}
    </script>
</body>
</html>