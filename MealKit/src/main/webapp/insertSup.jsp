
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


	String supname = request.getParameter("sup_name");
	String phonenum = request.getParameter("phone_num");
	String supaddress = request.getParameter("sup_address");
	String email = request.getParameter("email");
	String supsell = request.getParameter("sup_sell");

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
			String insertQuery = "INSERT INTO SUPPLIER(SUP_NAME, PHONE_NUM, SUP_ADDRESS, SUP_EMAIL, SUP_SELL)VALUES (?, ?, ?, ?, ?)" ;
			pstmt = conn.prepareStatement(insertQuery);
			pstmt.setString(1, supname);
			pstmt.setString(2, phonenum);
			pstmt.setString(3, supaddress);
			pstmt.setString(4, email);
			pstmt.setString(5, supsell);
			
			pstmt.executeUpdate();
			
	  } catch(Exception e) {
		  exception = e;
		  e.printStackTrace();
	  } finally {
		  if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
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
	location.href = '<%= request.getContextPath() %>/modifysup.jsp';
</script>



</body>
</html>