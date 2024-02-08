<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.lang.Exception, java.sql.SQLException" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <script src="./js/jquery-3.7.1.min.js"></script>
    <title>구매계약 확정</title>
    <style>
	
	.h {
	height: 697px;
	width: 100%;
	}

	.movebox {
	width: 100%;
	height: 80px;
	display: flex;
	justify-content: center;
	gap : 100px;
	<!-- border-bottom: 1px solid #333; -->
	}
	
	.A{
	width: 100px;
	height: 60px;
	margin-top: 10px;
	font-size: 25px;
	border: 1px solid grey;
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
	background-color: grey;
	color: #fff;
	border-radius: 10px;
	cursor: pointer;
	transition: all 0.2s;
	}
	
	.A:hover{
		background-color: #333333;
	}
	
	.B{
	width: 100px;
	height: 60px;
	margin-top: 10px;
	font-size: 25px;
	border: 1px solid grey;
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
	background-color: grey;
	color: #fff;
	border-radius: 10px;
	cursor: pointer;
	transition: all 0.2s;
	}
	
	.B:hover{
		background-color: #333333;
	}
	
	.C{
	width: 100px;
	height: 60px;
	margin-top: 10px;
	font-size: 25px;
	border: 1px solid grey;
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
	background-color: grey;
	color: #fff;
	border-radius: 10px;
	cursor: pointer;
	transition: all 0.2s;
	}
	
	.C:hover{
		background-color: #333333;
	}
	
	.functionbox{
		display: flex;
		width: 1200px;
		height: 550px;
		margin: 30px auto;
		background-color: orange;
	}
	
	select {
	  width: 100px; /* 원하는 너비설정 */
	  padding: .7em .4em; /* 여백으로 높이 설정 */
	  font-family: inherit;  /* 폰트 상속 */
	  background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */  
	  border: 1px solid #333; 
	  border-radius: 10px; /* iOS 둥근모서리 제거 */
	  -webkit-appearance: none; /* 네이티브 외형 감추기 */
	  -moz-appearance: none;
	  appearance: none;
	}	

	.inputnumber {
	
	}
	
	.contentbox{
		margin-top: 50px;
		width: 1200px;
		height: 600px;
	
		margin: 0px auto;
	}
	
	.purchasebox {
		margin: 0px 40px;
		width: 200px;
		height: 100%;
		display: flex;
		justify-content: space-between;
		align-items: center;
		text-align:center;

	}
	
	.pbh .minibox {
		width: 200px;
		height: 100%;
		border-left: 0.5px solid black;
		border-right: 0.5px solid black;
		border-top: 1px solid black;
		border-bottom: 2px solid black;
		display: flex;
		align-items: center;
		text-align:center;
		justify-content: center;
	}
	
	.longbox {
		WIDTH: 1200PX;
		height: 40px;
		display: flex;
		margin: 0px auto;
		justify-content: space-between;
		align-items: center;
		text-align: center;
	}
	
	
	.contentbox .longbox .minibox{
		width: 200px;
		height: 40PX;
		border: 1.5px solid black;
		display: flex;
		justify-content:center;
		align-items: center;
		text-align:center;
	}
	
	.pbh {
		WIDTH: 1200PX;
		height: 40px;
		display: flex;
		justify-content: space-between;
		align-items: center;
		text-align:center;
		margin: 0px auto;
	} 
	
	
	
	
	
	</STYLE>
</head>
<body>
<%@ include file = "header.jsp" %>
	<DIV class = "h"> 
		<div class = "movebox">
			<div class = "A"> 전체재고 </div>
			<div class = "B"> 자재구매 </div>
			<div class = "C"> 계약현황 </div>
		</div>
	
<%

	String JDBC_URL = "jdbc:oracle:thin:@1.220.247.78:1522:orcl";
	String USER = "SEMI_PROJECT1";
	String PASSWORD = "123451";
	
  Connection conn = null; //디비 접속 성공시 접속 정보 저장
	Statement stmt = null; //쿼리를 실행하기 객체 정보
	ResultSet rs = null;
	Exception exception = null;
	
	String SUPPLIER = "";
	String PRODUCT_NAME = "";
	String PRODUCT_QUANTITY = "";
	String PURCHASE_DATE = "";
	String PURCHASE_FIXDE_DATE = "";
	String PURCHASE_ID= "";
  try {
	  // 0.
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  
		// 1. JDBC로 Oracle연결
	  conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
	  // System.out.println("오라클 접속 성공");
	  
		// 2. BO_FREE 테이블에서 SQL로 데이터 가져오기
	 	stmt = conn.createStatement();	// 2-1. Statement 생성
	 	rs = stmt.executeQuery("SELECT PURCHASE_ID, SUPPLIER, PRODUCT_NAME, PRODUCT_QUANTITY, PURCHASE_DATE, PURCHASE_FIXED_DATE FROM PURCHASE ORDER BY PURCHASE_ID DESC fetch first 10 rows only");
%>
 		<div class = "contentbox">
		<div class = "pbh">
			<div class = "minibox">계약번호</div>
			<div class = "minibox">구매업체</div>
			<div class = "minibox">원자재명</div>
			<div class = "minibox">계약수량</div>
			<div class = "minibox">구매날짜</div>
			<div class = "minibox">확정날짜</div>
		</div>
<%  	
	 	while (rs.next()) {
	 		%>
	 		<div class = "longbox">
		 			<div class= "minibox"><%=rs.getInt("PURCHASE_ID")%></div>
		 			<div class= "minibox"><%=rs.getString("SUPPLIER")%></div>
		 			<div class= "minibox"><%=rs.getString("PRODUCT_NAME")%></div>
		 			<div class= "minibox"><%=rs.getString("PRODUCT_QUANTITY")%></div>
		 			<div class= "minibox"><%=rs.getDate("PURCHASE_DATE")%></div>
		 			<div class= "minibox"><%=rs.getDate("PURCHASE_FIXED_DATE")%></div>
	 		</div>	
	 	<%
	 	}
	%>
		</div>

	<% 
  } catch(Exception e) {
	  System.out.println("오라클 접속 오류: " + e);
  } finally {
	  if (stmt != null) try { stmt.close(); } catch (SQLException ex) {}
	  if (conn != null) try { conn.close(); } catch (SQLException ex) {}
  }
%>
<%@ include file = "footer.jsp" %>
</body>
</html>