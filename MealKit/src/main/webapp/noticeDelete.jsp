<%@ page import="utils.DBConfig"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.Exception" %>    
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%
	// 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	String num = request.getParameter("num");
	Connection conn = null; 		// 디비 접속 성공시 접속 정보 저장
	PreparedStatement pstmt = null; // 쿼리 실행문
	ResultSet rs = null;
	Exception exception = null;
	
  try {
		// 0.
	 	conn=DBConfig.getConnection();
		
		// 2.테이블에 화면 폼으로부터 가져온 데이터 입력
		String deleteQuery = "DELETE FROM NOTICE WHERE NO_NUM = " + num;
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
			
	%>		
		<!-- 성공 케이스-->
		<script>
			alert('공지사항 글이 성공적으로 삭제되었습니다.');	// 1
			location.href = '<%= request.getContextPath() %>/notice.jsp';
		</script>
	<%
		} else {	// 공지사항 글 삭제가 실패할 경우
	%>
		<!-- 실패 케이스 -->
		공지사항 글 삭제가 실패하였습니다. 시스템 관리자에게 문의하세요.<br>
		오류내용: <%= exception.getMessage() %>	
	<%	
		}
	%>







