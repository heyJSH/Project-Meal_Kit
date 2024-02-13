<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.*" %>

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

<% 
	String JDBC_URL = "jdbc:oracle:thin:@1.220.247.78:1522:orcl";
	String USER = "SEMI_PROJECT1";
	String PASSWORD = "123451";
	
  Connection conn = null; //디비 접속 성공시 접속 정보 저장
	Statement stmt = null; //쿼리를 실행하기 객체 정보
	ResultSet rs = null;
	Exception exception = null;
	PreparedStatement pstmt = null; // 쿼리 실행문

	String pid = request.getParameter("purchaseidd");
	String name = "'"+request.getParameter("purchasenamee") +"'";
	String quantity = request.getParameter("purchasequantityy");

	System.out.println(pid);

	

  try {

	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  
		// 1. JDBC로 Oracle연결
	  conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
	  // System.out.println("오라클 접속 성공");
	  
		// 2. BO_FREE 테이블에서 SQL로 데이터 가져오기
	 	String updateQuery ="update purchase set purchase_fixed_date = sysdate where purchase_id =" + pid;
	 	pstmt = conn.prepareStatement(updateQuery);
		pstmt.executeUpdate();

%>
	<% 
  } catch(Exception e) {
	  System.out.println("오라클 접속 오류: " + e);
  } finally {
	  if (stmt != null) try { stmt.close(); } catch (SQLException ex) {}
	  if (conn != null) try { conn.close(); } catch (SQLException ex) {}
  }
%>

<% 
try {
	  // 0.
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  
		// 1. JDBC로 Oracle연결
	  conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
	  // System.out.println("오라클 접속 성공");
	  
		// 2. BO_FREE 테이블에서 SQL로 데이터 가져오기
	 	String updateQuery ="update material set material_quantity = material_quantity +" + quantity + "where material_nm =" + name;
	 	pstmt = conn.prepareStatement(updateQuery);
		pstmt.executeUpdate();
%>
	<% 
  } catch(Exception e) {
	  System.out.println("오라클 접속 오류: " + e);
  }
%>


<%@ include file = "footer.jsp" %>

<script>
	alert('작업이 성공적으로 완료되었습니다.');
	location.href = '<%= request.getContextPath() %>/showingPurchase.jsp';
	</script>
</body>
</html>