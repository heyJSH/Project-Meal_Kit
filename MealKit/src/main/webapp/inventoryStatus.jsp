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
	 <!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<!-- reset.css 연결 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
	<!-- main.css 연결 -->
	<link rel="stylesheet" href="./css/main.css" />
	<!-- format.css 연결 -->
	<link rel="stylesheet" href="./css/inventoryStatus.css" />
	
	<!-- google font & google material icon -->
  <!-- Google 나눔고딕 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" />
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	
	<!-- jQuery 연결 -->
	<script defer src="./js/jquery-3.7.1.min.js"></script>
</head>
<body>
	<!-- header 공통 부분 연결 -->
	<%@ include file="header.jsp" %>
	
	<!-- ============================================================================== -->
	
	<!-- 본인 컨텐츠는 여기서 쓰면 됩니다 -->
	<div class="subject">
		<p>재고 현황</p>
	</div>
	<div class="inventoryStatus">
		<%
		Connection connection = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			connection = DBConfig.getConnection();
			System.out.println("접속성공");
		} catch(SQLException se) {
			System.out.println("접속실패");
		}
		%>
		<div class="full_box">
		<div class="small_box">
		<div>
			<p>
				완제품
			</p>
		</div>
		<div class="table">
			<div class="up">
				<table border="1">
					<tr>
						<th class="t1">제품번호</th>
						<th class="t2">제품명</th>
						<th class="t3">제품수량</th>
					</tr>
				</table>
			</div>
			<div class="content">
				<table border="1">
					<%
						try {
							String sql = "SELECT PRODUCT_ID, PRODUCT_NM, PRODUCT_QUANTITY FROM FINISHED_PRODUCT ORDER BY PRODUCT_ID ASC";
							stmt = connection.createStatement();
							rs = stmt.executeQuery(sql);
							
							while(rs.next()) {
								int Product_id = rs.getInt("PRODUCT_ID");
								String Product_nm = rs.getString("PRODUCT_NM");
								int Product_quantity = rs.getInt("PRODUCT_QUANTITY");
								%>
								<tr>
									<td class="t1"><%= Product_id %></td>
									<td class="t2"><%= Product_nm %></td>
									<td class="t3"><%= Product_quantity %></td>
								</tr>
								<%
							}
						} catch(Exception e) {
							
						}
					%>
				</table>
			</div>
			</div>
			</div>
			<div class="small_box">
			<div>
				<p>
					재료
				</p>
			</div>
			<div class="table">
			<div class="up">
				<table border="1">
					<tr>
						<th class="t1">재료번호</th>
						<th class="t2">재료명</th>
						<th class="t3">재료수량</th>
					</tr>
				</table>
			</div>
			<div class="content">
				<table border="1">
					<%
						try {
							String sql = "SELECT DISTINCT M.MATERIAL_ID, M.MATERIAL_NM, M.MATERIAL_QUANTITY, B.QUANTITY_UNITS FROM MATERIAL M INNER JOIN BOM B ON M.MATERIAL_ID = B.MATERIAL_ID ORDER BY M.MATERIAL_ID ASC";
							stmt = connection.createStatement();
							rs = stmt.executeQuery(sql);
							
							while(rs.next()) {
								int Material_id = rs.getInt("MATERIAL_ID");
								String Material_nm = rs.getString("MATERIAL_NM");
								int Material_quantity = rs.getInt("MATERIAL_QUANTITY");
								String Quantity_units = rs.getString("QUANTITY_UNITS");
								%>
								<tr>
									<td class="t1"><%= Material_id %></td>
									<td class="t2"><%= Material_nm %></td>
									<td class="t3"><%= Material_quantity %> <%= Quantity_units %></td>
								</tr>
								<%
							}
						} catch(Exception e) {
							
						}
					%>
				</table>
			</div>
		</div>
	</div>
	</div>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<%@ include file="footer.jsp" %>
</body>
</html>
