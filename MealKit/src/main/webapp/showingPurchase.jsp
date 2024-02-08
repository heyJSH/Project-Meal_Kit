<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DB와 연결 -->
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.lang.Exception, java.sql.SQLException" %>
<%@ page import="utils.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제조 지시</title>
	<!-- reset.css 연결 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
	<!-- main.css 연결 -->
	<link rel="stylesheet" href="./css/main.css" />

	
	<!-- google font & google material icon -->
  <!-- Google 나눔고딕 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" />
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	
	<!-- jQuery 연결 -->
	<script defer src="./js/jquery-3.7.1.min.js"></script>
	<style>
	@charset "UTF-8";

/* 심신의 안정을 위해 해당 코드는 지우지 말 것 */

body {
	position: relative;
}

.subject {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 50px;
	padding-bottom: 0;
}

.manufaturing {
	display: flex;
	justify-content: center;
	align-items: center;
	padding-top: 200px;
	padding-bottom: 70px;
}

.manufaturing1 {
	display: flex;
	width: 1200px;
	justify-content: center;
	align-items: center;
	margin: 20px auto;
	
}



.nowsuppier {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
	margin: 20px;
	width: 200PX;
	height: 50px;
	z-index: 5;
	font-size: 25px;
} 

.nowsuppierbox{
	position: absolute;
	width: 1200px;
	height: 40px;
	display: flex;
	justify-content: center;
	align-items: center;
	top: 150px;
}

.movingfirstfinal{
	position: absolute;
	right: 200px;
	top: 20px;
	width: 100px;
	height: 20px;
}
.movingmodifymaterial{
	position: absolute;
	right: 50px;
	top: 20px;
	width: 100px;
	height: 20px;
}

.movingpurchase{
	position: absolute;
	right: -50px;
	top: 20px;
	width: 100px;
	height: 20px;
}

.forfooterbox {
	width: 100%;
	height: 118Px;
	
}


.subject p {
	font-size: 32px;
	font-weight: bold;
}

.manufaturing table {
	position: relative;
	border-collapse: collapse;
	border: 1px solid black;
	width: 1200px;
}

.manufaturing1 table {
	position: relative;
	border-collapse: collapse;
	border: 1px solid black;
	width: 1200px;
}

.manufaturing table th {
	background-color: gray;
	color: white;
	border-collapse: collapse;
	border: 1px solid white;
	border-bottom: 1px solid black;
	border-top: 1px solid black;
}

.manufaturing1 table th {
	background-color: gray;
	color: white;
	border-collapse: collapse;
	border: 1px solid white;
	border-bottom: 1px solid black;
	border-top: 1px solid black;
}

.manufaturing th, .manufaturing td {
	border-collapse: collapse;
	border: 1px solid black;
	text-align: center;
	vertical-align: middle;
	height: 30px;
}

.manufaturing1 th, .manufaturing1 td {
	border-collapse: collapse;
	border: 1px solid black;
	text-align: center;
	vertical-align: middle;
	height: 30px;
}

.manufaturing .manu_container {
	display: flex;
	
}

.manufaturing1 .manu_container {
	display: flex;
	margin: 0 auto;
}

.manufaturing .manu_container div {
	margin: 0;
	margin-right: 20px;
}

.manufaturing1 .manu_container div {
	margin-right: -40px;
	
}


.manufaturing .manu_container .prod_table {
	height: 500px;
}

.manufaturing1 .manu_container .prod_table {
	height: 500px;
}

.manufaturing .manu_container .prod_table table {
	width: 1200px;
}

.manufaturing1 .manu_container .prod_table table {
	width: 1200px;
}

.inst_table .i11 {
	width: 80px;
	border-collapse: collapse;
	border-left: 1px solid black;
}

.manu_container .lot_table .i1{
	width: 90px;
}


.inst_table .i22 {
	width: 185px;
}

.manu_container .lot_table .i2{
	width: 207px;
}

.inst_table .i33 {
	width: 200px;
}

.manu_container .lot_table .i3{
	width: 226px;
}

.inst_table .i44 {
	width: 200px;
}

.manu_container .lot_table .i4{
	width: 223px;
}

.i55 {
	width: 300px;
}

.manu_container .lot_table .i5{
	width: 340px;
}

.i66 {
	width: 200px;
}

.manu_container .lot_table .i6{
	width: 225px;
}

.inst_table .i77 {
	width: 50px;
	border-collapse: collapse;
	border-right: 1px solid black;
}

.manu_container .lot_table .i7{
	width: 55px;
}

.manufaturing1 .manu_container .lot_table .i7{
	width: 100px;
}




.manufaturing .manu_container .lot_table {
	height: 670px;
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0px auto;
	margin-top: -100px;
}

.manufaturing1 .manu_container .lot_table {
	height: 100px;
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0px auto;
}


.manufaturing .manu_container .lot_table table {
	width: 1200px;
}

.manufaturing .manu_container .prod_table .view_table {
	overflow-y: scroll;
	width: 100%;
	height: 300px;
	margin: 0;
}

.manufaturing .manu_container .lot_table .inst_table {
	overflow-y: scroll;
	width: 100%;
	height: 400px;
	margin: 0;
}


.insertsuppierbigbox {
	position: absolute;
	width: 1200px;
	height: 350px;
	top: 500px;
	justify-content: center;
	align-items: center;

}

.insertsuppierbox{
	width: 1200px;
	height: 40px;
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 40px auto;
	margin-bottom: -10px;
}

.insertsuppier{
	font-size: 25px;
}


.lot_table1 {
	width: 1200px;
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0px auto;
}

.inputsupplierheadbox{
	display: flex;
	justify-content: space-between;
	width: 1200px;
	height: 40px;
	margin-left: 100px;
	margin-right: 100px;
	
}



.inputsupplierbox{
	display: flex;
	justify-content: space-between;
	gap: 20px;
}



	
	
	</style>
</head>
<body>
	<!-- header 공통 부분 연결 -->
	<%@ include file="header.jsp" %>
	
	<!-- ============================================================================== -->
	
	<!-- 본인 컨텐츠는 여기서 쓰면 됩니다 -->


		<div class = "nowsuppierbox">
			<div>
				<div class = "nowsuppier">계약현황</div>
				<div class = "movingfirstfinal"><a href = "./firstFinal.jsp">구매계약</a></div>
				<div class = "movingmodifymaterial"><a href = "./modifymaterial.jsp">재료</a></div>
				<div class = "movingpurchase"><a href = "./modifysup.jsp">공급업체</a></div>
			</div>		
		</div>
					
		<div class="manufaturing">
		<%
		
		request.setCharacterEncoding("UTF-8");

		String JDBC_URL = "jdbc:oracle:thin:@1.220.247.78:1522:orcl";
		String USER = "SEMI_PROJECT1";
		String PASSWORD = "123451";
		
		Connection connection = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			connection = DBConfig.getConnection();
			System.out.println("접속성공1");
		} catch(SQLException se) {
			System.out.println("접속실패");
		}
	%>
		<div class="manu_container">
	
			<div class="lot_table">
				<div>
					<table>
						<tr>
						<th class="i1">계약ID</th>
						<th class="i2">계약업체</th>
						<th class="i3">계약물품</th>
						<th class="i4">계약수량</th>
						<th class="i5">계약일</th>
						<th class="i6">확정일</th>
				</tr>
				</table>
				<div class="inst_table">
					<table>
				<%
					try{
						String sql = "SELECT * FROM PURCHASE ORDER BY PURCHASE_ID";
						stmt = connection.createStatement();
						rs = stmt.executeQuery(sql);
					
						while(rs.next()) {
							int purchaseid = rs.getInt("PURCHASE_ID");
							String supplier = rs.getString("SUPPLIER");
							String productname = rs.getString("PRODUCT_NAME");
							String productquantity = rs.getString("PRODUCT_QUANTITY");
							String purchasedate = rs.getString("PURCHASE_DATE").substring(0,16);      // 생산량
							String fixeddate = rs.getString("PURCHASE_FIXED_DATE").substring(0,16);
			
							
							if(rs.getString("PURCHASE_FIXED_DATE").substring(0,16) == null){
								fixeddate = "구매확정";
							} else{
								fixeddate = rs.getString("PURCHASE_FIXED_DATE").substring(0,16);
							}			%>
							
							<tr>
								<td class="i11" id = "purchaseid" name = "purchaseid"><%= purchaseid %></td>
								<td class="i22"><%= supplier %></td>
								<td class="i33"><%= productname %></td>
								<td class="i44"><%= productquantity %></td>
								<td class="i55"><%= purchasedate%></td>
								<td class="i66" style="cursor: pointer;" onClick = "javascript: insertfixeddate(<%=rs.getInt("PURCHASE_ID")%>)">
									<%= fixeddate%>
								</td>
							</tr>
							
							<%
								}
							rs.close();
							stmt.close();
							} catch(Exception e){
								
							}
				%>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	

	<!-- footer 공통 부분 연결 -->
	<%@ include file="footer.jsp" %>
	
<script>
	function insertfixeddate(num){
		if (confirm('구매를 확정하시겠습니까?')) {
			location.href = "./fixpurchase.jsp?purchaseid=" + num;
		}
	}
</script>
	
</body>
</html>