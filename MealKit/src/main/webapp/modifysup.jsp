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
	<link rel="stylesheet" href="./css/woo.css" />
	
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


		<div class = "nowsuppierbox">
			<div>
				<div class = "nowsuppier">업체현황</div>
				<div class = "movingfirstfinal"><a href = "./firstFinal.jsp">구매계약</a></div>
				<div class = "movingmodifymaterial"><a href = "./modifymaterial.jsp">재료</a></div>
				<div class = "movingpurchase"><a href = "./showingPurchase.jsp">계약현황</a></div>
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
			System.out.println("접속성공");
		} catch(SQLException se) {
			System.out.println("접속실패");
		}
	%>
		<div class="manu_container">
	
			<div class="lot_table">
				<div>
					<table>
						<tr>
						<th class="i1">업체ID</th>
						<th class="i2">업체명</th>
						<th class="i3">전화번호</th>
						<th class="i4">주소</th>
						<th class="i5">이메일</th>
						<th class="i6">판매목록</th>
						<th class="i7">삭제</th>
				</tr>
				</table>
				<div class="inst_table">
					<table>
				<%
					try{
						String sql = "SELECT * FROM SUPPLIER WHERE PHONE_NUM != '000-0000-0000' ORDER BY SUP_ID";
						stmt = connection.createStatement();
						rs = stmt.executeQuery(sql);
						
						while(rs.next()) {
							int supid = rs.getInt("SUP_ID");
							String supname = rs.getString("SUP_NAME");
							String phonenum = rs.getString("PHONE_NUM");
							String supaddress = rs.getString("SUP_ADDRESS");
							String supemail = rs.getString("SUP_EMAIL");      // 생산량
							String supsell = rs.getString("SUP_SELL");	// 지시일
							%>
							<tr>
								<td class="i11" id = "supid" name = "supid"><%= supid %></td>
								<td class="i22"><%= supname %></td>
								<td class="i33"><%= phonenum %></td>
								<td class="i44"><%= supaddress %></td>
								<td class="i55"><%= supemail%></td>
								<td class="i66"><%= supsell %></td>
								<td class="i77" style="cursor: pointer;" onClick = "javascript: deletesupinfo(<%=rs.getInt("SUP_ID")%>)">X</td>
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
	
<div class = "forfooterbox">
	<div class = "insertsuppierbigbox">
		<div class = "insertsuppierbox">
			<div class = "insertsuppier">업체추가</div>
		</div>
		
<div class="manufaturing1">
	<div class="manu_container">
		<div class="lot_table">
			<div>
				<table>
					<tr>
						<th class="i2">업체명</th>
						<th class="i3">전화번호</th>
						<th class="i4">주소</th>
						<th class="i5">이메일</th>
						<th class="i6">판매목록</th>
						<th class="i7">추가</th>
				</tr>
 					<form action = "./insertSup.jsp" method="post" id="form3" onSubmit = "return false">
						<tr>
							<td class="i22"><input type="text" class="inputField" name="sup_name" id = "sup_name" placeholder="업체명"></td>
							<td class="i33"><input type="text" class="inputField" name="phone_num" id = "phone_num" placeholder="전화번호"></td>
							<td class="i44"><input type="text" class="inputField" name="sup_address" id = "sup_address" placeholder="주소"></td>
							<td class="i55"><input type="text" class="inputField" name="email" id = "email" placeholder="이메일"></td>
							<td class="i66"><input type="text" class="inputField" name="sup_sell" id = "sup_sell" placeholder="판매목록"></td>
							<td class="i77"><input type="submit" class = "supinsertinfo" value = "추가" onClick="javascript: prevCheckTextBox();"/></td>
						</tr>
					</form>

				</table>
			</div>
		</div>
	</div>
</div>	
</div>
		<!-- ============================================================================== -->
	
	<!-- footer 공통 부분 연결 -->
	<%@ include file="footer.jsp" %>
	
	<script>
	function deletesupinfo(num) {
		if (confirm('삭제하시겠습니까?')) {
			location.href = "./supDelete.jsp?supid=" + num;
		}
	}
	
	function prevCheckTextBox() {
		if (!$('#sup_name').val()) {	// 이름 관련 dom
			alert('업체명을 입력하세요.');	// 이름 입력하라고 팝업 뜸.
			$('#sup_name').focus();		// 이름 입력 칸으로 포커스 이동
			
			return;
		}
		if (!$('#phone_num').val()) {	// 제목 관련 dom
			alert('전화번호를 입력하세요.');	// 제목 입력하라고 팝업 뜸.
			$('#phone_num').focus();		// 제목 입력 칸으로 포커스 이동
			
			return;
		}
		if (!$('#email').val()) {	// 제목 관련 dom
			alert('이메일을 입력하세요.');	// 제목 입력하라고 팝업 뜸.
			$('#email').focus();		// 제목 입력 칸으로 포커스 이동
			
			return;
		}
		if (!$('#sup_sell').val()) {	// 내용 관련 dom
			alert('판매목록을 입력하세요.');	// 내용 입력하라고 팝업 뜸.
			$('#sup_sell').focus();		// 내용 입력 칸으로 포커스 이동
			
			return;
		}
			
		// 실제 form의 action의 값으로 전송
			document.getElementById('form3').submit();
	}
	
	
	
	
	</script>
	
	
</body>
</html>