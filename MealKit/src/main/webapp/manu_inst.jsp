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
	<link rel="stylesheet" href="./css/manu_inst.css" />
	
	<!-- google font & google material icon -->
  <!-- Google 나눔고딕 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" />
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	
	<!-- jQuery 연결 -->
	<script defer src="./js/jquery-3.7.1.min.js"></script>
	<script defer src="./js/main.js"></script>
</head>
<body>
	<!-- header 공통 부분 연결 -->
	<%@ include file="header.jsp" %>
	
	<!-- ============================================================================== -->
	
	<!-- 본인 컨텐츠는 여기서 쓰면 됩니다 -->
	<div class="subject">
		<p>제조지시서</p>
	</div>
	<div class="manufaturing">
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
	<div class="manu_table">
	<table>
		<tr>
			<th>Lot번호</th>
			<th>제품번호</th>
			<th>제품명</th>
			<th>Lot Size</th>
			<th>생산량</th>
			<th>생산일</th>
			<th>입고일</th>
			<th>완료버튼</th>
		</tr>
		<%
			try{
				String sql = "SELECT PO.LOT_ID, PO.PRODUCT_ID, FP.PRODUCT_NAME, PO.LOT_SIZE, PO.OUTPUT, PO.PRODUCTION_DATE, PO.RECEIPT_DATE FROM PRODUCTION_ORDER PO LEFT OUTER JOIN FINISHED_PRODUCT FP ON PO.PRODUCT_ID = FP.PRODUCT_ID ORDER BY PO.LOT_ID";
				stmt = connection.createStatement();
				rs = stmt.executeQuery(sql);
	
				while(rs.next()) {
					int Lot_id = rs.getInt("LOT_ID");
					int Product_id = rs.getInt("PRODUCT_ID");
					String Product_name = rs.getString("PRODUCT_NAME");
					int Lot_size = rs.getInt("LOT_SIZE");
					int Output = rs.getInt("OUTPUT");
					String Production_date = rs.getString("PRODUCTION_DATE");
					String Receipt_date = rs.getString("RECEIPT_DATE");
					%>
					<form id="complete_form_<%= Lot_id %>" method="post" action="complete_production_order.jsp">
					<tr>
						<td><%= Lot_id %></td>
						<td><%= Product_id %></td>
						<td><%= Product_name %></td>
						<td id="lotSize_<%= Lot_id %>"><%= Lot_size %></td>
						<td>
							<input type="number" name="output_<%= Lot_id %>" value="<%= Output %>" />
						</td>
						<td id="productionDate_<%= Lot_id %>"><%= Production_date %></td>
						<td>
							<input type="date" name="receiptDate_<%= Lot_id %>" value="" />
						</td>
						<td>
							<button type="button" class="complete_btn" data-lot-id="<%= Lot_id %>">완료</button>
						</td>
					</tr>
					<input type="hidden" name="lotId" value="<%= Lot_id %>"/>
					<input type="hidden" name="output_<%= Lot_id %>" value="<%= Output %>" />
					</form>
					<%
						}
					} catch(Exception e){
									
					}
				%>
	</table>
	</div>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(document).ready(function(){
			$('.complete_btn').click(function(e) {
				var lotId = $(this).data('lot-id');
				var receiptDate = $('input[name="receiptDate_' + lotId + '"]').val();
	      var productionDate = $('#productionDate_' + lotId).text().trim();
	      var lotSize = parseInt($('#lotSize_' + lotId).text(), 10);
	      var output = parseInt($('input[name="output_' + lotId + '"]').val(), 10);
	      var datePattern = /^\d{4}-\d{2}-\d{2}$/;

	      if (!datePattern.test(receiptDate)) {
	    	  alert('입고일의 형식이 올바르지 않습니다.');
	    	  e.preventDefault();
	    	  return;
	      }
	      
	      var receiptDateObj = new Date(receiptDate);
	      var productionDateObj = new Date(productionDate);
	      
	      if (receiptDateObj < productionDateObj) {
	    	  alert('입고일이 잘못 입력되었습니다.');
	    	  e.preventDefault();
	    	  return;
	      }
	      
	      if (lotSize !== output) {
	    	  alert('Lot size와 생산량이 일치하지 않습니다.');
	    	  e.preventDefault();
	    	  return;
	      }
				$('#complete_form_' + lotId).submit();
			});
		});
	</script>
	</div>
	
	<!-- ============================================================================== -->
	
	<!-- footer 공통 부분 연결 -->
	<%@ include file="footer.jsp" %>
</body>
</html>
