
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>

<%@ page import = "java.sql.*" %>
<%@ page import = "java.lang.Exception, java.sql.SQLException" %>  

<!DOCTYPE html>
<html>
<head>
  <script src="./js/jquery-3.7.1.min.js"></script>
<meta charset="UTF-8">
<title>구매관리 구매하기</title>
<style>
	
	.h{
	margin-top: 180px;
	width: 1200px;
	height: 400px;

	}
	

	.functionbox{
		width: 1200px;
		height: 400px;
		margin: 100px auto PX auto;

		
	}
	
	.firstfunctionname{
		margin: 50px auto;
		font-size: 25px;
		width: 100PX;
		height: 30px;
		display: flex;
		justify-content: center;
		text-align: center;

	}
	
	.bigfunctionbox{
		width: 800px;
		height: 200px;
		display: flex;
		justify-content: center;
		margin: 20px auto;
		position: relative;
		gap: 100px;	
	}
	
	.firstselect {
		display: flex;
		width: 180px;
		height: 50px;		
	}
	
	.secondselect {
		display: flex;
		width: 250px;
		height: 50px;	
	}
	
	.select1 {
	  width: 200px; /* 원하는 너비설정 */
	  padding: .5em .4em; /* 여백으로 높이 설정 */
	  font-family: inherit;  /* 폰트 상속 */
	  background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */  
	  border: 1px solid #333; 
	  border-radius: 10px; /* iOS 둥근모서리 제거 */
	  -webkit-appearance: none; /* 네이티브 외형 감추기 */
	  -moz-appearance: none;
	  appearance: none;
	}	
	.supplier {
	  width: 550px; /* 원하는 너비설정 */
	  padding: .5em .4em; /* 여백으로 높이 설정 */
	  font-family: inherit;  /* 폰트 상속 */
	  background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */  
	  border: 1px solid #333; 
	  border-radius: 10px; /* iOS 둥근모서리 제거 */
	  -webkit-appearance: none; /* 네이티브 외형 감추기 */
	  -moz-appearance: none;
	  appearance: none;
	}	

	.inputnumber {
		display: flex;
		width: 300px;
		height: 50px;			  
		border-radius: 10px; /* iOS 둥근모서리 제거 */
	}
	
	.quantity{
		width: 100px;	
	}
	
	.sename1{
		margin: 0px;
		right: -20px;
		width: 180px;
		height: 50px;
		display: flex;
		text-align: center;
		align-items: center;
		justify-content: center;
	}
	
	.sename2{
		width: 400px;
		height: 50px;
		display: flex;
		text-align: center;
		align-items: center;
		justify-content: center;
	}
	
		.sename3{
		width: 100px;
		height: 50px;
		display: flex;
		text-align: center;
		align-items: center;
		justify-content: center;
	}
	
	.buybutton{

	}
	
	.finish {
		width: 50px;
		height: 30px;
	  position: absolute;
	  display: inline-block;
	  text-align: center;
	  color: white;
		bottom: 90px;
		right: -30px;
		border: 0;
		border-ridius: 30px;
		background-color: black;
		display: flex;
		font-size: 12px;
		text-align: center;
		align-items: center;
		justify-content: center;
		transition: all 0.3s;
	}
	
	.finish:hover{
	background-color: royalblue;
	color: black;
	border: #fff;
	}
	
	.secondbigbox {
		width: 1000px;
		height: 400px;

		margin: 0 auto;
		margin-top: -160px;
	}
	
	.secondmiddlebox{
		width: 800px;
		height: 400px;
		margin: 0px auto;
	}
	.secondlongbox {
		width: 800px;
		height: 40px;
		
	}
	.sup1info {
		width: 800px;
		height: 20px;
		right: 300PX;
		top: -500px;
		font-size: 16px;
		margin-left: -100px;
	} 
	
	.sup1info 1{
		width: 150px;
		border-bottom: 1px solid black;
		background-color: RED;
	}
	
	.movingbox{
		position: absolute;
		width: 300px;
		height: 300px;
		display: flex;
		justify-content: center;
		align-items: center;
		gap: 30px;
		right: 200px;
		top: 290px;
	}
	.movingbutton{
		width: 115px;
		height: 30px;
		display: flex;
		justify-content: center;
		text-align: center;
		align-items: center;

	}
	
	.mnt{
		width: 110px;
		height: 30px;
		font-size: 17px;
		color: white;
		background-color: grey;
		transition: all 0.3s;
		display: flex;
		justify-content: center;
		text-align: center;
		align-items: center;
	}
	.mnt:hover{
		background-color: royalblue;
		color: black;
		border: #fff;
	}
	
	.forframe{
		width: 1200px;
		height: 400px;

	}
	
	#full_box{
		height: 681px;
	}
	
</style>
</head>
<body>
<%@ include file = "header.jsp" %>
 <form action = "./insertdata.jsp" method="post" id="form2" onSubmit = "return false">
 <div id = "full_box">
	<DIV class = "h"> 

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
		String supplier = request.getParameter("supplier");
		String quantity = request.getParameter("quantity");

		
	  try {
		  // 0.
		  Class.forName("oracle.jdbc.driver.OracleDriver");
		  
			// 1. JDBC로 Oracle연결
		  conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
		  // System.out.println("오라클 접속 성공");
		  
			// 2. BO_FREE 테이블에서 SQL로 데이터 가져오기
		 	stmt = conn.createStatement();	// 2-1. Statement 생성
		 	rs = stmt.executeQuery("SELECT MATERIAL_NM FROM MATERIAL"); // 2-2. SQL 쿼리 실행
		 	if(materialNm== null){
		 		materialNm = "'밀가루'";
	 		} else {
	 			materialNm= request.getParameter("material");
	 		}
		 	// 3. rs로 데이터 가져온 걸 웹에 보여주기 -> 쿼리 실행 결과 출력
	%>
		 	<div class = "functionbox">
		 		<div class = "firstfunctionname">주문하기</DIV>
		 		<div class = bigfunctionbox> 
					<div class = "firstselect">	
						<div class = "sename1">원자재: </div>
						<select name = "material" id = "material" onchange="changeselect()" class= "select1">	 	
	<% 	 	
		 	while(rs.next()) {
	%>
			 				<option value=<%= rs.getString("MATERIAL_NM")%> <%= rs.getString("MATERIAL_NM") == null ? "selected" : (rs.getString("MATERIAL_NM").equals(materialNm) ? "selected" : "") %>>
			 				<%= rs.getString("MATERIAL_NM")%>
			 				</option>
	<% 		 		
		 	}
	  } catch(Exception e) {
		  System.out.println("오라클 접속 오류:1 " + e);
	  }
	%>
						</select>
		 			</div>	



		 	<%
			request.setCharacterEncoding("UTF-8");

			JDBC_URL = "jdbc:oracle:thin:@1.220.247.78:1522:orcl";
			USER = "SEMI_PROJECT1";
			PASSWORD = "123451";
			supplier = request.getParameter("supplier");
			 	conn = null; //디비 접속 성공시 접속 정보 저장
				stmt = null; //쿼리를 실행하기 객체 정보
				ResultSet rs1 = null;

				exception = null;
		 		if(materialNm==""){
		 			materialNm = "밀가루";
		 		} else {
		 			materialNm= request.getParameter("material");
		 		}
				
	  try {
		  // 0.
		  Class.forName("oracle.jdbc.driver.OracleDriver");
		  
			// 1. JDBC로 Oracle연결
		  conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
		  System.out.println("오라클 접속 성공1");
		  
			// 2. BO_FREE 테이블에서 SQL로 데이터 가져오기
		 	stmt = conn.createStatement();	// 2-1. Statement 생성
		 	rs1 = stmt.executeQuery("SELECT SUP_NAME FROM SUPPLIER WHERE SUP_SELL LIKE '%"+ materialNm + "%' order by sup_id"); // 2-2. SQL 쿼리 실행
		 	

		 	// 3. rs로 데이터 가져온 걸 웹에 보여주기 -> 쿼리 실행 결과 출력
			System.out.println(materialNm);
			%>
						<div class = "secondselect">	
							<div class = "sename2">공급업체:&ensp; </div>
							<select name = "supplier" class= "supplier" id = "supplier" onchange = "changeselectsecond()";>
						<% 		 	
			while(rs1.next()) {	 		
						%>
								<option value = "<%=rs1.getString("SUP_NAME")%>" name = "SUP_NAME" <%= rs1.getString("SUP_NAME") ==  null ? "selected" : (rs1.getString("SUP_NAME").equals(supplier) ? "selected" : "") %>><%=rs1.getString("SUP_NAME") %></option>
			<% 
			}
					
					 			 	
	  }catch(Exception e) {
		  System.out.println("오라클 접속 오류:12 " + e);
	  } 
	%>					</select>
			 		 </div>

						<div class = "inputnumber">
							<div class = "sename3">수량입력: </div>
							<input type = "number" class = "quantity" id = "quantity" name = "quantity">
						</div>
			
						<div class = "buybutton">
							<input type = "submit" class = "finish" value = "구입" onClick="javascript: prevCheckTextBox()">
						</div>
					</div>
				</div>
 	</DIV>



	
	<%
		request.setCharacterEncoding("UTF-8");

		JDBC_URL = "jdbc:oracle:thin:@1.220.247.78:1522:orcl";
		USER = "SEMI_PROJECT1";
		PASSWORD = "123451";
		
	  conn = null; //디비 접속 성공시 접속 정보 저장
		stmt = null; //쿼리를 실행하기 객체 정보
		rs = null;
		
		exception = null;

	
		try {
		  // 0.
		  Class.forName("oracle.jdbc.driver.OracleDriver");
		  supplier = request.getParameter("supplier");
			// 1. JDBC로 Oracle연결
		  conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
		  System.out.println("오라클 접속 성공123");
		  
			// 2. BO_FREE 테이블에서 SQL로 데이터 가져오기
	 		if(supplier== null){
	 			supplier = "'(주)파리크라상'";
	 		} else {
	 			supplier= request.getParameter("supplier");
	 		}
			
		 	stmt = conn.createStatement();	// 2-1. Statement 생성
		 	rs = stmt.executeQuery("SELECT * FROM SUPPLIER WHERE SUP_NAME =" +"'" +supplier + "'"); // 2-2. SQL 쿼리 실행


		 	// 3. rs로 데이터 가져온 걸 웹에 보여주기 -> 쿼리 실행 결과 출력
		 			System.out.println(supplier);
	%>
	<div class = "forframe">	
		<div class = "secondbigbox">
			<div class = "secondmiddlebox">


	<% 	 	

		 	if(rs.next()) {
	%>		<div class = "secondlongbox">
			 		<div class= "sup1info 1">● 업체ID: <%=rs.getString("SUP_ID") %></div>
			 	</div>
			 	<div class = "secondlongbox">
			 		<div class= "sup1info 2">● 업체명: <%=rs.getString("SUP_NAME") %></div>
				</div>
			 	<div class = "secondlongbox">
			 		<div class= "sup1info 3">● 전화번호: <%=rs.getString("PHONE_NUM") %></div>
				</div>	
			 	<div class = "secondlongbox">
			 		<div class= "sup1info 4">● 주소: <%=rs.getString("SUP_ADDRESS") %></div>
				</div>
			 	<div class = "secondlongbox">	
			 		<div class= "sup1info 5">● EMAIL: <%=rs.getString("SUP_EMAIL") %></div>
			 	</div>
			 	<div class = "secondlongbox">
			 		<div class= "sup1info 6">● 판매제품: <%=rs.getString("SUP_SELL") %></div>
				</div>
	<% 		
	
		 	}
	%>
				</div>
		

	<% 
	  } catch(Exception e) {
		  System.out.println("오라클 접속 오류:123 " + e);
	  }finally {
		  if (rs != null) try { rs.close(); } catch (SQLException ex) {}
		  if (rs != null) try { rs1.close(); } catch (SQLException ex) {}
		  if (stmt != null) try { stmt.close(); } catch (SQLException ex) {}
		  if (conn != null) try { conn.close(); } catch (SQLException ex) {}
	  }
	%>




		<div class="movingbox">
			<div class = "movingbutton">
				<div class = "mnt"><a href ="./modifysup.jsp">공급업체 수정</a></div>
			</div>
			<div class = "movingbutton">
				<div class = "mnt"><a href ="./modifymaterial.jsp">원자재 수정</a></div>
			</div>
			<div class = "movingbutton">
				<div class = "mnt"><a href ="./showingPurchase.jsp">계약현황</a></div>
			</div>
		</div>
	</div>
	</div>
	<%@ include file = "footer.jsp" %>
</form>
</div>


				


<script>


 function changeselect() {
	// console.log(selectValue);
	var select = document.getElementById("material");  // class = material인 데이터를 선택
	var selectValue = select.options[select.selectedIndex].value;   // select element에서 선택된 option의 value가 저장된다.
	location.href = "./firstFinal.jsp?material=" + selectValue;  // 페이지의 주소를 material = 선택된데이터(즉 WHERE 원재자명 = selectValue 이런느낌)
	 //$('#material').val() = selectValue;  // material 클래스의 값의 selectValue와 같게 해주어 select되게 만듬
	//$("#supplier").val("－－－－－－－－").prop("selected", true);
 }

 
  function changeselectsecond() {
	// console.log(selectValue);
	var select = document.getElementById("material");  // class = material인 데이터를 선택
	var selectValue = select.options[select.selectedIndex].value;   // select element에서 선택된 option의 value가 저장된다.
	var select1 = document.getElementById("supplier");  // class = material인 데이터를 선택
	var selectValue1 = select1.options[select1.selectedIndex].value;   // select element에서 선택된 option의 value가 저장된다.
	location.href = "./firstFinal.jsp?material=" + selectValue +"&supplier=" + selectValue1 ;
	 //$('#material').val() = selectValue;  // material 클래스의 값의 selectValue와 같게 해주어 select되게 만듬
		 
  }

	
  
	function prevCheckTextBox() {
		// 실제 FORM의 action의 값으로 전송
 		if(!$('#material').val()){
				alert('원자재을 선택하세요.'); // 이름 입력하라고 팝업 뜸
				$('#material').focus();
				return;
		} 
		
 		else if(!$('.supplier').val()){
			alert('공급업체을 선택하세요.'); // 이름 입력하라고 팝업 뜸
			$('.supplier').focus();
			return;
			} 

	
 		else if(!$('.quantity').val()){
			alert('수량을 입력하세요.'); // 이름 입력하라고 팝업 뜸
			$('.quantity').focus();
			return;
		}
 		else if($('.quantity').val()%100!=0){
			alert('100단위로 입력하세요.'); // 이름 입력하라고 팝업 뜸
			$('.quantity').focus();
			return;
		}

 		document.getElementById('form2').submit();
	}
</script>

</body>
</html>