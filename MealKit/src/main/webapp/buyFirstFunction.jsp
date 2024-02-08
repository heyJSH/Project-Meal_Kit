<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.lang.Exception, java.sql.SQLException" %>  
<!DOCTYPE html>
<html>
<head>
  <script src="./js/jquery-3.7.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	
</style>
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
	// 한글 처리
	request.setCharacterEncoding("UTF-8");

	String JDBC_URL = "jdbc:oracle:thin:@1.220.247.78:1522:orcl";
	String USER = "SEMI_PROJECT1";
	String PASSWORD = "123451";
	
	  Connection conn = null; //디비 접속 성공시 접속 정보 저장
		Statement stmt = null; //쿼리를 실행하기 객체 정보
		ResultSet rs = null;
		
		Exception exception = null;

		String materialNm = request.getParameter("material");
		
	  try {
		  // 0.
		  Class.forName("oracle.jdbc.driver.OracleDriver");
		  
			// 1. JDBC로 Oracle연결
		  conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
		  // System.out.println("오라클 접속 성공");
		  
			// 2. BO_FREE 테이블에서 SQL로 데이터 가져오기
		 	stmt = conn.createStatement();	// 2-1. Statement 생성
		 	rs = stmt.executeQuery("SELECT MATERIAL_NM FROM MATERIAL"); // 2-2. SQL 쿼리 실행
			
		 	// 3. rs로 데이터 가져온 걸 웹에 보여주기 -> 쿼리 실행 결과 출력
	%>
		 	<div class = "functionbox">
			<div class = "firstselect">	
				<form>
					<select name = "material" id = "material" onchange="changeselect()" >	 	
	<% 	 	
		 	while(rs.next()) {
	%>
		 			<option value=<%= rs.getString("MATERIAL_NM")%> <%= rs.getString("MATERIAL_NM") == null ? "" : (rs.getString("MATERIAL_NM").equals(materialNm) ? "selected" : "") %>>
		 				<%= rs.getString("MATERIAL_NM")%>
		 			</option>
	<% 		 		
		 	}
	  } catch(Exception e) {
		  System.out.println("오라클 접속 오류: " + e);
	  }
	%>
					</select>
		 			</form>
		 		</div>	


<%
	// 한글 처리

		JDBC_URL = "jdbc:oracle:thin:@1.220.247.78:1522:orcl";
		USER = "SEMI_PROJECT1";
		PASSWORD = "123451";
		conn = null; //디비 접속 성공시 접속 정보 저장
		stmt = null; //쿼리를 실행하기 객체 정보
		ResultSet rs1 = null;
	  exception = null;
		
	  try {
		  // 0.
		  Class.forName("oracle.jdbc.driver.OracleDriver");
		  
			// 1. JDBC로 Oracle연결
		  conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
		  System.out.println("오라클 접속 성공1");
		  
			// 2. BO_FREE 테이블에서 SQL로 데이터 가져오기
		 	stmt = conn.createStatement();	// 2-1. Statement 생성
		 	rs1 = stmt.executeQuery("SELECT SUP_NAME FROM SUPPLIER WHERE SUP_SELL LIKE '%"+ materialNm + "%'"); // 2-2. SQL 쿼리 실행
		 // 3. rs로 데이터 가져온 걸 웹에 보여주기 -> 쿼리 실행 결과 출력
			%>
		 	
			<div class = "secondselect">	
				<form>
					<select name = "supplier" class= "supplier" id = "supplier" onchange = "changeselectsecond()";>
<% 		 	
		 	while(rs1.next()) {	 		
%>
				<option value = "제발되라" name = "SUP_NAME"><%=rs1.getString("SUP_NAME") %>;</option>
<% 
		 	}
	  } catch(Exception e) {
		  System.out.println("오라클 접속 오류: " + e);
	  } finally {
		  if (rs != null) try { rs.close(); } catch (SQLException ex) {}
		  if (rs1 != null) try { rs1.close(); } catch (SQLException ex) {}
		  if (stmt != null) try { stmt.close(); } catch (SQLException ex) {}
		  if (conn != null) try { conn.close(); } catch (SQLException ex) {}
	  }
	%>
						</select>
				</form>
			</div>		
			<div class = "inputnumber">
				<input type = "number" class = "ea">
			</div>
			<form>
			<div class = "buybutton">
				<input type = "submit" class = "finish">
			</div>
			</form>
					
		</div>
		</DIV>

<%@ include file = "footer.jsp" %>

<script>
 function changeselect() {
	 var select = document.getElementById("material");  // class = material인 데이터를 선택
	 var selectValue = select.options[select.selectedIndex].value;   // select element에서 선택된 option의 value가 저장된다.
	 console.log(selectValue);

	 location.href = "./index.jsp?material=" + selectValue;  // 페이지의 주소를 material = 선택된데이터(즉 WHERE 원재자명 = selectValue 이런느낌)
	 $('#material').val() = selectValue;  // material 클래스의 값의 selectValue와 같게 해주어 select되게 만듬
	 

	 
 }
 function changeselectsecond() {
	 var selectsecond = document.getElementById("supplier");  // class = supplier 인데이터를 선택
	 var selectsecondValue = selectsecond.options[selectsecond.selectedIndex].value;  
	 console.log(selectsecond);

	 $('#supplier').val() = selectValue;  // supplier 클래스의 값의 selectsecondValue와 같게 해주어 select되게 만듬
	 

	 
 }

 /*
 $(document).ready(function() { 
	 $('select[id="material"]').find('option:contains("${currentSwVersion}")').attr("selected",true);        });
 });
	*/
</script>

</body>
</html>