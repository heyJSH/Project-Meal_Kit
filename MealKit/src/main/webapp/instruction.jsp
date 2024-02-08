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
	<div class="manu_container">
	<div class="prod_table">
	<table>
		<tr>
			<th class="p1">제품번호</th>
			<th class="p2">제품명</th>
			<th class="p3">제품수량</th>
		</tr>
	</table>
	<div class="view_table">
		<table>
		<%
					try{
						String sql = "SELECT PRODUCT_ID, PRODUCT_NAME, PRODUCT_QUANTITY FROM FINISHED_PRODUCT ORDER BY PRODUCT_ID ASC";
						stmt = connection.createStatement();
						rs = stmt.executeQuery(sql);
			
						while(rs.next()) {
							int Product_id = rs.getInt("PRODUCT_ID");
							String Product_name = rs.getString("PRODUCT_NAME");
							int Product_quantity = rs.getInt("PRODUCT_QUANTITY");
							%>
							<tr>
								<td class="p1"><%= Product_id %></td>
								<td class="p2"><%= Product_name %></td>
								<td class="p3"><%= Product_quantity %></td>
							</tr>
							<%
						}
						rs.close();
						stmt.close();
					} catch(Exception e) {
						
					}
				%>	
			</table>
		</div>
	</div>
			<div class="lot_table">
			<div>
				<table>
					<tr>
					<th class="i1">Lot번호</th>
					<th class="i2">지시자</th>
					<th class="i3">제품번호</th>
					<th class="i4">Lot Size</th>
					<th class="i5">생산량</th>
					<th class="i6">지시일</th>
					<th class="i7">수행일</th>
					<th class="i8">수행자</th>
					<th class="i9">제출버튼</th>
					<th class="i10">완료여부</th>
				</tr>
				<form action="instruction_btn.jsp" method="post">
					<tr>
						<td class="i1"><input type="text" class="inputField" name="lotId" placeholder="Lot번호"></td>
						<td class="i2"><input type="text" class="inputField" name="instId" placeholder="지시자ID"></td>
						<td class="i3"><input type="text" class="inputField" name="productId" placeholder="제품번호"></td>
						<td class="i4"><input type="text" class="inputField" name="lotSize" placeholder="Lot Size"></td>
						<td class="i5"></td>
						<td class="i6"><input type="date" class="inputField" name="instDate" placeholder="지시일"></td>
						<td class="i7"></td>
						<td class="i8"></td>
						<td class="i9"><button id="submitBtn">제출</button></td>
						<td class="i10"></td>
					</tr>
				</form>
				</table>
				<div class="inst_table">
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
								<td class="i1"><%= Lot_id %></td>
								<td class="i2"><%= Inst_nm %></td>
								<td class="i3"><%= Product_id %></td>
								<td class="i4"><%= Lot_size %></td>
								<td class="i5"><%= Output == 0 ? "" : Output %></td>
								<td class="i6"><%= Inst_date %></td>
								<td class="i7"><%= Manu_date == null ? "" : Manu_date %></td>
								<td class="i8"><%= Manu_nm == null ? "" : Manu_nm %></td>
								<td class="i9"></td>
								<td class="i10"><%= Completion %></td>
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
