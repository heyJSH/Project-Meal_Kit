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
	<link rel="stylesheet" href="./css/instruction.css" />
	
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
		<p>제조 지시</p>
	</div>
	<div class="instruction">
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
		<div class="table1">
			<div class="sub_table">
				<table>
					<tr>
						<th class="t1_1">제품번호</th>
						<th class="t1_2">제품명</th>
						<th class="t1_3">제품수량</th>
					</tr>
				</table>
			</div>
			<div class="content">
				<table>
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
									<td class="t1_1"><%= Product_id %></td>
									<td class="t1_2"><%= Product_nm %></td>
									<td class="t1_3"><%= Product_quantity %></td>
								</tr>
								<%
							}
						} catch(Exception e) {
							
						}
					%>
				</table>
			</div>
		</div>
		<div class="table2">
			<div class="sub_table">
				<table>
					<tr>
						<th class="t2_1">Lot번호</th>
						<th class="t2_2">지시자</th>
						<th class="t2_3">제품번호</th>
						<th class="t2_4">Lot Size</th>
						<th class="t2_5">생산량</th>
						<th class="t2_6">지시일</th>
						<th class="t2_7">수행일</th>
						<th class="t2_8">수행자</th>
						<th class="t2_9">제출버튼</th>
						<th class="t2_10">완료여부</th>
					</tr>
					<form action="instruction_btn.jsp" method="post">
						<tr>
							<td class="t2_1"><input type="text" class="inputField" name="lotId" placeholder="Lot번호"></td>
							<td class="t2_2"><input type="text" class="inputField" name="instId" placeholder="지시자ID"></td>
							<td class="t2_3"><input type="text" class="inputField" name="productId" placeholder="제품번호"></td>
							<td class="t2_4"><input type="text" class="inputField" name="lotSize" placeholder="Lot Size"></td>
							<td class="t2_5"></td>
							<td class="t2_6"><input type="date" class="inputField" name="instDate" placeholder="지시일"></td>
							<td class="t2_7"></td>
							<td class="t2_8"></td>
							<td class="t2_9"><button id="submitBtn">제출</button></td>
							<td class="t2_10"></td>
						</tr>
					</form>
				</table>
			</div>
			<div class="content">
				<table>
					<%
					try{
						String sql = "SELECT I.LOT_ID, (SELECT E1.EMP_NM FROM EMPLOYEES E1 WHERE E1.EMP_ID = I.INST_ID) AS INST_NM, I.PRODUCT_ID, I.LOT_SIZE, I.OUTPUT, TO_CHAR(I.INST_DATE, 'YYYY/MM/DD') AS INST_DATE, TO_CHAR(I.MANU_DATE, 'YYYY/MM/DD') AS MANU_DATE, (SELECT E2.EMP_NM FROM EMPLOYEES E2 WHERE E2.EMP_ID = I.MANU_ID) AS MANU_NM, CASE WHEN EXISTS (SELECT M.LOT_ID FROM MANUFACTURING M WHERE M.LOT_ID = I.LOT_ID) THEN '미완료' ELSE '완료' END AS COMPLETION FROM INSTRUCTION I ORDER BY I.LOT_ID DESC";
						stmt = connection.createStatement();
						rs = stmt.executeQuery(sql);
						
						while(rs.next()) {
							int Lot_id = rs.getInt("LOT_ID");
							String Inst_nm = rs.getString("INST_NM");
							Integer Product_id = rs.getInt("PRODUCT_ID");
							Integer Lot_size = rs.getInt("LOT_SIZE");
							Integer Output = rs.getInt("OUTPUT");             // 생산량
							String Inst_date = rs.getString("INST_DATE");	// 지시일
							String Manu_date = rs.getString("MANU_DATE"); // 수행일
							String Manu_nm = rs.getString("MANU_NM");     // 수행자
							String Completion = rs.getString("COMPLETION");
							%>
							<tr>
								<td class="t2_1"><%= Lot_id %></td>
								<td class="t2_2"><%= Inst_nm %></td>
								<td class="t2_3"><%= Product_id %></td>
								<td class="t2_4"><%= Lot_size %></td>
								<td class="t2_5"><%= Output == 0 ? "" : Output %></td>
								<td class="t2_6"><%= Inst_date %></td>
								<td class="t2_7"><%= Manu_date == null ? "" : Manu_date %></td>
								<td class="t2_8"><%= Manu_nm == null ? "" : Manu_nm %></td>
								<td class="t2_9"></td>
								<td class="t2_10"><%= Completion %></td>
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
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#submitBtn').prop('disabled', true);
			function checkInputFields() {
				var allFilled = true;
				$('.inputField').each(function() {
					if ($(this).val() === '') {
						allFilled = false;
						return false;
					}
				});
				$('#submitBtn').prop('disabled', !allFilled);
			}
			$('.inputField').keyup(function() {
				checkInputFields();
			});
			$('input[type=date].inputField').on('input', function() {
	      checkInputFields();
	    });
		});
		window.onload = function() {
			var status = new URL(window.location.href).searchParams.get('status');
			switch(status) {
      	case 'success':
        	break;
        case 'error':
          alert('지시 추가가 실패했습니다.');
          break;
        case 'productNotFound':
          alert('상품이 존재하지 않습니다.');
          break;
        case 'invalidLotSize':
          alert('유효한 Lot Size를 입력하시오.');
          break;
        case 'instNotFound':
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
