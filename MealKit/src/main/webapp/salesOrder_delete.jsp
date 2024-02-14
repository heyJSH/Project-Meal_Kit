<%@ page import="java.lang.Exception" %>    
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	String order_num = request.getParameter("order_num");
	
	String JDBC_URL = "jdbc:oracle:thin:@1.220.247.78:1522:orcl";
  	String USER = "semi_project1";
  	String PASSWORD = "123451";
	
 	Connection conn = null; //디비 접속 성공시 접속 정보 저장
	PreparedStatement pstmt = null; // 쿼리 실행문
	
	Exception exception = null;
	
  try {
		// 0.
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	
		// 1. JDBC로 Oracle연결
	  conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
		
		/* System.out.println("OK"); */
	  
		// 2.테이블에 화면 폼으로부터 가져온 데이터 입력
		String deleteQuery = "DELETE FROM SALES_ORDER WHERE ORDER_NUM = " + order_num;
		pstmt = conn.prepareStatement(deleteQuery);
		
		pstmt.executeUpdate();
  } catch(Exception e) {
	  exception = e;
	  e.printStackTrace();
  } finally {
	  if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
	  if (conn != null) try { conn.close(); } catch (SQLException ex) {}
  }
%>

<%
	if (exception == null) {	// 공지사항 글 삭제가 성공할 경우
		// 1. 성공 팝업 생성
		// 2. 공지사항 리스트로 이동
%>		
<!-- 성공 케이스 html/css/js -->
<script>
	alert('성공적으로 삭제되었습니다.');	// 1
	location.href = '<%= request.getContextPath() %>/salesOrder_select.jsp';
</script>
<%
	} else {									// 공지사항 글 삭제가 실패할 경우
		// 1. 실패글
		// 2. 오류내용 표시
%>
<!-- 실패 케이스 html/css/js -->
삭제가 실패하였습니다. 시스템 관리자에게 문의하세요.<br>
오류내용: <%= exception.getMessage() %>
<%	
	}
%>







