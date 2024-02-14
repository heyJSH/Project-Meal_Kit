
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
<title>Insert title here</title>
</head>
<body>
<%

	// 한글 처리
request.setCharacterEncoding("UTF-8");


	String materialname = request.getParameter("material_name");
	String materialclassification = request.getParameter("classification");



	String JDBC_URL = "jdbc:oracle:thin:@1.220.247.78:1522:orcl";
	String USER = "SEMI_PROJECT1";
	String PASSWORD = "123451";

		PreparedStatement pstmt = null; // 쿼리 실행
		Connection conn = null; //디비 접속 성공시 접속 정보 저장
		Statement stmt = null; //쿼리를 실행하기 객체 정보
		ResultSet rs = null;
		Exception exception = null;
		


	  try {
			// 0.
		  Class.forName("oracle.jdbc.driver.OracleDriver");
		
			// 1. JDBC로 Oracle연결
		  conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
		  
			// 2. BO_FREE 테이블에 화면 폼으로부터 가져온 데이터 입력
			String insertQuery = "INSERT INTO MATERIAL(MATERIAL_QUANTITY, MATERIAL_NM, MATERIAL_CLASSIFICATION) VALUES(0, ?, ?)";
			pstmt = conn.prepareStatement(insertQuery);
			pstmt.setString(1, materialname);
			pstmt.setString(2, materialclassification);

			
			pstmt.executeUpdate();
			
	  } catch(Exception e) {
		  exception = e;
		  e.printStackTrace();
	  }
	%>
	
	
	
	<% 
	  try {

	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  
		// 1. JDBC로 Oracle연결
	  conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
	  // System.out.println("오라클 접속 성공");
	  
		// 2. BO_FREE 테이블에서 SQL로 데이터 가져오기
	 	String updateQuery ="update supplier set sup_sell = (?||(select sup_sell from supplier where sup_id = 400000)) where sup_id = 400000";
	 	pstmt = conn.prepareStatement(updateQuery);
		pstmt.setString(1, materialname);
		pstmt.executeUpdate();
		System.out.println(materialname);

	%>
	<% 
  } catch(Exception e) {
	  System.out.println("오라클 접속 오류: " + e);
  } finally {
	  if (stmt != null) try { stmt.close(); } catch (SQLException ex) {}
	  if (conn != null) try { conn.close(); } catch (SQLException ex) {}
  }
%>
	
	

	<%/*
		if (exception == null) {	// 공지사항 글 등록이 성공할 경우
			// 1. 성공 팝업 생성
			// 2. 공지사항 리스트로 이동


		} else {									// 공지사항 글 등록이 실패할 경우
			// 1. 실패글
			// 2. 오류내용 표시

		}*/		

	%>	

	
	
<script>
	alert('작업이 성공적으로 완료되었습니다.');
	location.href = '<%= request.getContextPath() %>/modifymaterial.jsp';
</script>



</body>
</html>