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
<title>제조 수행</title>
	 <!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<!-- reset.css 연결 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
	<!-- main.css 연결 -->
	<link rel="stylesheet" href="./css/main.css" />
	<!-- format.css 연결 -->
	<link rel="stylesheet" href="./css/manufacturing.css" />
	
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
		<p>제조 수행</p>
	</div>
	<div class="manufacturing">
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
		<div class="table5">
			<div class="table1">
				<div class="sub_table">
					<table>
						<tr>
							<th class="t1_1">Lot번호</th>
							<th class="t1_2">지시자</th>
							<th class="t1_3">제품번호</th>
							<th class="t1_4">Lot Size</th>
							<th class="t1_5">생산량</th>
							<th class="t1_6">지시일</th>
							<th class="t1_7">수행일</th>
							<th class="t1_8">수행자</th>
							<th class="t1_9">완료버튼</th>
						</tr>
					</table>
				</div>
				<div class="content">
					<table>
						<%
							try{
								String sql = "SELECT M.LOT_ID, (SELECT E.EMP_NM FROM EMPLOYEES E WHERE E.EMP_ID = M.INST_ID) AS INST_NM, M.PRODUCT_ID, M.LOT_SIZE, M.OUTPUT, TO_CHAR(M.INST_DATE, 'YYYY/MM/DD') AS INST_DATE, M.MANU_DATE, M.MANU_ID FROM MANUFACTURING M ORDER BY M.LOT_ID ASC";
								stmt = connection.createStatement();
								rs = stmt.executeQuery(sql);
					
								while(rs.next()) {
									int Lot_id = rs.getInt("LOT_ID");
									String Inst_nm = rs.getString("INST_NM");
									int Product_id = rs.getInt("PRODUCT_ID");
									int Lot_size = rs.getInt("LOT_SIZE");
									int Output = rs.getInt("OUTPUT");
									String Inst_date = rs.getString("INST_DATE");
									String Manu_date = rs.getString("MANU_DATE");
									int Manu_id = rs.getInt("MANU_ID");
									%>
									<form id="complete_form_<%= Lot_id %>" method="post" action="manufacturing_btn.jsp">
										<tr>
											<td class="t1_1"><%= Lot_id %></td>
											<td class="t1_2"><%= Inst_nm %></td>
											<td class="t1_3"><%= Product_id %></td>
											<td class="t1_4" id="lotSize_<%= Lot_id %>"><%= Lot_size %></td>
											<td class="t1_5">
												<input class="inputField" type="number" name="output_<%= Lot_id %>" placeholder="생산량" />
											</td>
											<td class="t1_6" id="instDate_<%= Lot_id %>"><%= Inst_date %></td>
											<td class="t1_7">
												<input class="inputField" type="date" name="manuDate_<%= Lot_id %>" />
											</td>
											<td class="t1_8">
												<input class="inputField" type="text" name="manuId_<%= Lot_id %>" placeholder="수행자ID" />
											</td>
											<td class="t1_9">
												<button type="button" class="complete_btn" data-lot-id="<%= Lot_id %>">완료</button>
											</td>
										</tr>
										<input type="hidden" name="lotId" value="<%= Lot_id %>" />
										<input type="hidden" name="output_<%= Lot_id %>" value="<%= Output %>" />
									</form>
									<%
								}
							} catch (Exception e) {
							
							}
						%>	
						</table>
					</div>
				</div>
			</div>
			<div class="table4">
				<div class="table2">
					<div class="sub_table">
						<table>
							<tr>
								<th class="t2_1">제품번호</th>
								<th class="t2_2">제품명</th>
								<th class="t2_3">제품수량</th>
								<th class="t2_4">재료현황</th>
							</tr>
						</table>
					</div>
					<div class="content">
						<table>
							<%
								try{
									String prodSql = "SELECT PRODUCT_ID, PRODUCT_NM, PRODUCT_QUANTITY FROM FINISHED_PRODUCT ORDER BY PRODUCT_ID ASC";
									stmt = connection.createStatement();
									rs = stmt.executeQuery(prodSql);
								
									while(rs.next()) {
										int Product_id = rs.getInt("PRODUCT_ID");
										String Product_name = rs.getString("PRODUCT_NM");
										int Product_quantity = rs.getInt("PRODUCT_QUANTITY");
										%>
										<tr>
											<td class="t2_1"><%= Product_id %></td>
											<td class="t2_2"><%= Product_name %></td>
											<td class="t2_3"><%= Product_quantity %></td>
											<td class="t2_4">
												<form action="manufacturing.jsp" method="post">
													<input type="hidden" name="product_id" value="<%= Product_id %>" />
													<input type="submit" value="더보기" />
												</form>
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
				
				<%
					if (request.getParameter("product_id") != null) {
						try{
							int productId = Integer.parseInt(request.getParameter("product_id"));
							String materialSql = "SELECT M.MATERIAL_ID, M.MATERIAL_NM, M.MATERIAL_QUANTITY, B.BOM_PROD_QUANTITY, B.QUANTITY_UNITs, CASE WHEN M.MATERIAL_QUANTITY >= B.BOM_PROD_QUANTITY THEN '제조가능' ELSE '제조 불가능' END AS MANUFACTURING_AVAILABILITY FROM FINISHED_PRODUCT FP INNER JOIN BOM B ON FP.PRODUCT_ID = B.PRODUCT_ID INNER JOIN MATERIAL M ON B.MATERIAL_ID = M.MATERIAL_ID WHERE FP.PRODUCT_ID = ? ORDER BY M.MATERIAL_ID ASC";
							PreparedStatement pstmt = connection.prepareStatement(materialSql);
							pstmt.setInt(1, productId);
							ResultSet materialRs = pstmt.executeQuery();
							%>
							<div class="table3">
								<div class="sub_table">
									<table>
										<tr>
											<th class="t3_1">재료번호</th>
											<th class="t3_2">재료명</th>
											<th class="t3_3">재고수량</th>
											<th class="t3_4">표준량</th>
											<th class="t3_5">제조가능여부</th>
										</tr>
									</table>
								</div>
							<div class="content">
							<table>
								<%
									while(materialRs.next()) {
										int Material_id = materialRs.getInt("MATERIAL_ID");
										String Material_nm = materialRs.getString("MATERIAL_NM");
										int Material_quantity = materialRs.getInt("MATERIAL_QUANTITY");
										int Bom_qua = materialRs.getInt("BOM_PROD_QUANTITY");
										String Bom_unit = materialRs.getString("QUANTITY_UNITS");									String manufacturingAvailability = materialRs.getString("MANUFACTURING_AVAILABILITY");
										%>
										<tr>
											<td class="t3_1"><%= Material_id %></td>
											<td class="t3_2"><%= Material_nm %></td>
											<td class="t3_3"><%= Material_quantity %> <%= Bom_unit %></td>
											<td class="t3_4"><%= Bom_qua %> <%= Bom_unit %></td>
											<td class="t3_5"><%= manufacturingAvailability %></td>
											<td style="display: none;" data-material-quantity="<%= Material_quantity %>" data-bom-qua="<%= Bom_qua %>" data-material-nm="<%= Material_nm %>" data-bom-unit="<%= Bom_unit %>"></td>
										</tr>
										<%
									}
									materialRs.close();
									pstmt.close();
								}catch(Exception e){
		
								}
							}
						%>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.complete_btn').click(function(e) {
				var lotId = $(this).data('lot-id');
				var manuDate = $('input[name="manuDate_' + lotId + '"]').val();
	      var instDate = $('#instDate_' + lotId).text().trim();
	      var lotSize = parseInt($('#lotSize_' + lotId).text(), 10);
	      var output = parseInt($('input[name="output_' + lotId + '"]').val(), 10);
	      var datePattern = /^\d{4}-\d{2}-\d{2}$/;

	      if (!datePattern.test(manuDate)) {
	    	  alert('입고일의 형식이 올바르지 않습니다.');
	    	  e.preventDefault();
	    	  return;
	      }
	      
	      var manuDateObj = new Date(manuDate);
	      var instDateObj = new Date(instDate);
	      
	      if (manuDateObj < instDateObj) {
	    	  alert('입고일이 잘못 입력되었습니다.');
	    	  e.preventDefault();
	    	  return;
	      }
	      
	      if (lotSize !== output) {
	    	  alert('Lot size와 생산량이 일치하지 않습니다.');
	    	  e.preventDefault();
	    	  return;
	      }
	      
	      var allMaterialIsValid = true;
	      $('.table3 tr').each(function(){
	    	  var materialQuantity = parseInt($(this).find('td[data-material-quantity]').data('material-quantity'));
	    	  var bomQua = parseInt($(this).find('td[data-bom-qua]').data('bom-qua'));
	    	  var materialNM = $(this).find('td[data-material-nm]').data('material-nm');
	    	  var bomUnit = $(this).find('td[data-bom-unit]').data('bom-unit');
	    	  
	    	  if (materialQuantity < (lotSize / 1000 * bomQua)) {
	    		  alert(materialNM + '이(가) ' + ((lotSize / 1000 * bomQua) - materialQuantity) + bomUnit + ' 부족합니다.');
	    		 	allMaterialIsValid = false;
	    		 	return false;
	    	  }
	      });
	      
	      if (!allMaterialIsValid) {
	    	  e.preventDefault();
	    	  return;
	      }
				$('#complete_form_' + lotId).submit();
			});
		});
		window.onload = function () {
			var status = new URL(window.location.href).searchParams.get('status');
			switch (status) {
				case 'success':
					break;
				case 'manuNotFound':
					alert('존재하지 않는 사원번호입니다.');
			default:
				break;
			}
			window.history.replaceState({}, document.title, window.location.pathname);
		};
	</script>
		<!-- ============================================================================== -->
	
	<!-- footer 공통 부분 연결 -->
	<%@ include file="footer.jsp" %>
</body>
</html>
