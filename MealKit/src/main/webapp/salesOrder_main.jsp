<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.PreparedStatement"%>
<%@ page import = "java.lang.Exception, java.sql.SQLException" %>
<%@ page import = "java.util.*" %>
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
	.order{background-color: white; margin: 0 auto}
	.responsible{background-color: white; margin-left: 50px; border-collapse:collapse; border: 1px solid #fff }
	.selecter{margin:20px 20px 20px 50px}
	tr{height: 22px; background-color: gray; color: white;}
	.responsible th{border-collapse:collapse; border: 1px solid #fff;}
	.order th{border-collapse:collapse; border: 1px solid #fff; box-sizing: border-box; width:130px}
	.order td{width:130px; }

</style>


<title>Sales order select</title>
</head>
<body>

  <%@ include file="header.jsp" %>
	
<section class="hello_World">
<!-- ================================================================================ -->

	<div class="containerM">
	  <div class="headerM"><h1>Sales order main</h1></div>
	
		<table class="responsible">
		
	
		
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
		
			<input type = "button" value="확인">
			<input type = "submit" value="조회" onClick="location.href='salesOrder_select.jsp'">
			<input type = "button" value="입력" onClick="location.href='salesOrder_insertForm.jsp'">
			<input type = "button" value="수정" onClick="location.href='salesOrder_updateForm.jsp'">
		</div>
	
	
	
		<table class="order" border=1>
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
	
	
		<table class="order" border=1>
		  <tbody>
		  	<tr>
				<td><input type="number" name="ORDER_NUM" style="width:94%"></td>
				<td><input type="number" name="CUST_ID" style="width:94%"></td>
				<td><input type="text" name="CUST_NAME" style="width:94%"></td>
				<td><input type="number" name="PRODUCT_ID" style="width:94%"></td>
				<td><input type="text" name="PRODUCT_NAME" style="width:94%"></td>
				<td><input type="number" name="QUANTITY" style="width:94%"></td>
				<td><input type="date" name="ORDER_DATE" style="width:96%"></td>
				<td><input type="date" name="REQUST_DATE" style="width:96%"></td>
				<td><input type="text" style="width:95%"></td>	
			</tr>		
		  </tbody>		
		</table>
		<table class="order" border=1>
		  <tbody>
		  	<tr>
				<td><input type="number" name="ORDER_NUM" style="width:94%"></td>
				<td><input type="number" name="CUST_ID" style="width:94%"></td>
				<td><input type="text" name="CUST_NAME" style="width:94%"></td>
				<td><input type="number" name="PRODUCT_ID" style="width:94%"></td>
				<td><input type="text" name="PRODUCT_NAME" style="width:94%"></td>
				<td><input type="number" name="QUANTITY" style="width:94%"></td>
				<td><input type="date" name="ORDER_DATE" style="width:96%"></td>
				<td><input type="date" name="REQUST_DATE" style="width:96%"></td>
				<td><input type="text" style="width:95%"></td>
			</tr>
		  </tbody>		
		</table>
		<table class="order" border=1>
		  <tbody>
		  	<tr>
				<td><input type="number" name="ORDER_NUM" style="width:94%"></td>
				<td><input type="number" name="CUST_ID" style="width:94%"></td>
				<td><input type="text" name="CUST_NAME" style="width:94%"></td>
				<td><input type="number" name="PRODUCT_ID" style="width:94%"></td>
				<td><input type="text" name="PRODUCT_NAME" style="width:94%"></td>
				<td><input type="number" name="QUANTITY" style="width:94%"></td>
				<td><input type="date" name="ORDER_DATE" style="width:96%"></td>
				<td><input type="date" name="REQUST_DATE" style="width:96%"></td>
				<td><input type="text" style="width:95%"></td>	
			</tr>	
		  </tbody>		
		</table>
		<table class="order" border=1>
		  <tbody>
		  <tbody>
		  	<tr>
				<td><input type="number" name="ORDER_NUM" style="width:94%"></td>
				<td><input type="number" name="CUST_ID" style="width:94%"></td>
				<td><input type="text" name="CUST_NAME" style="width:94%"></td>
				<td><input type="number" name="PRODUCT_ID" style="width:94%"></td>
				<td><input type="text" name="PRODUCT_NAME" style="width:94%"></td>
				<td><input type="number" name="QUANTITY" style="width:94%"></td>
				<td><input type="date" name="ORDER_DATE" style="width:96%"></td>
				<td><input type="date" name="REQUST_DATE" style="width:96%"></td>
				<td><input type="text" style="width:95%"></td>	
			</tr>	
		  </tbody>			
		</table>


	</div>
	

	<!-- footer 공통 부분 연결 -->
	<%@ include file="footer.jsp" %>
</section>
	
	<!-- ============================================================================== -->
	

</body>

<!-- 
추가 개선 과제:
 ○ 기간별 조회 기능
 ○ 재고자산 연동 (출고확인서 시스템 구성이 필요)
    -> 주무서 작성 시 임시재고감소 -> 출고확인 시 실제재고 감소
 ○ 비고에 메모 DB에 기록될 수 있도록 연동
 ○ 입력이 되지 않으면 경고메시지
 ○ 2개 이상의 행을 입력하더라도 첫행만 실행됨
 -->


</html>