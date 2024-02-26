<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.lang.Exception" %>    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타벅스 공지사항 상세내용</title>
</head>
<body>

<%
	// 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	String num = request.getParameter("num");
	
	String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
  String USER = "jsp";
  String PASSWORD = "123456";
	
  Connection conn = null; //디비 접속 성공시 접속 정보 저장
  Statement stmt = null; // 쿼리 R 실행문
	PreparedStatement pstmt = null; // 쿼리 CUD 실행문
	ResultSet rs = null;
	
	Exception exception = null;
	
	String title = "";		// 공지사항 제목
	String content = "";	// 공지사항 내용
	
  try {
		// 0.
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	
		// 1. JDBC로 Oracle연결
	  conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
	  
		// 2. BO_FREE 테이블에 선택한 글 조회수 1 올리기
		String updateQuery = "UPDATE BO_FREE SET HIT = HIT + 1 WHERE NUM = ?";
		pstmt = conn.prepareStatement(updateQuery);
		pstmt.setInt(1, Integer.parseInt(num));
		
		pstmt.executeUpdate();
		
		// 3-1. 읽기를 위해 Statement 생성
		stmt = conn.createStatement();
		// 3-2. SQL 조회 쿼리 실행
		rs = stmt.executeQuery("SELECT NUM, NAME, SUBJECT, CONTENT FROM BO_FREE WHERE NUM = " + num);
	 	// 3-3. SQL 조회 쿼리 가져온 데이터를 자바 String 변수 set
	 	if (rs.next()) {
	 		title = rs.getString("SUBJECT");
	 		content = rs.getString("CONTENT");
	 	}
  } catch(Exception e) {
	  exception = e;
	  e.printStackTrace();
  } finally {
	  if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
	  if (conn != null) try { conn.close(); } catch (SQLException ex) {}
  }
%>
<%= num %>번 공지사항 제목: <%= title %> <br>
<%= num %>번 공지사항 내용: <%= content %> 
</body>
</html>