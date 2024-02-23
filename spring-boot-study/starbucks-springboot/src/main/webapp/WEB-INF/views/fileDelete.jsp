<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.Exception" %>    
<%@ page import="java.sql.*" %>
<!-- 파일 업로드 처리 용도 -->
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%
	// 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	String noticeNum = request.getParameter("noticeNum");			// 공지사항 번호
	String fileNum = request.getParameter("fileNum");					// 공지사항 내의 파일 번호
	String fileName = request.getParameter("fileName");				// 공지사항 내의 파일 이름
	
	String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
  String USER = "jsp";
  String PASSWORD = "123456";
	
  Connection conn = null; //디비 접속 성공시 접속 정보 저장
	PreparedStatement pstmt = null; // 쿼리 실행문
	
	Exception exception = null;
	
  // 물리적인 위치 context(내 PC 디렉토리)
  String savePath = "D:\\temp2\\java_spring_lecture\\cotogether\\workspace_stsb_4_21\\starbucks-notice\\src\\main\\webapp\\upload-files";

  try {
		// 0.
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	
		// 1. JDBC로 Oracle연결
	  conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
	  
		// 2. BO_FREE 테이블에 화면 폼으로부터 가져온 데이터 입력
		String updateQuery = "UPDATE BO_FREE SET FILE" + fileNum + "_PATH = null WHERE NUM = " + noticeNum;
		pstmt = conn.prepareStatement(updateQuery);
		
		pstmt.executeUpdate();
		
		// 3. 실제 파일 삭제
		// 물리적인 위치 context(내 PC 디렉토리)
		//File file = new File(savePath + "\\jsp웹과제_01.png");	// 임시
		File file = new File(savePath + "\\" + fileName);
   	if (file.exists()) {
   		file.delete();
   	}
  } catch(Exception e) {
	  exception = e;
	  e.printStackTrace();
  } finally {
	  if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
	  if (conn != null) try { conn.close(); } catch (SQLException ex) {}
  }
%>

<%
	if (exception == null) {	// 공지사항 글 수정이 성공할 경우
		// 1. 성공 팝업 생성
		// 2. 공지사항 리스트로 이동
%>		
<!-- 성공 케이스 html/css/js -->
<script>
	alert('해당 파일이 성공적으로 삭제되었습니다.');	// 1
	location.href = '<%= request.getContextPath() %>/adminNoticeUpdateForm.jsp?num=' + <%= noticeNum %>;
</script>
<%
	} else {									// 공지사항 글 수정이 실패할 경우
		// 1. 실패글
		// 2. 오류내용 표시
%>
<!-- 실패 케이스 html/css/js -->
해당 파일 삭제가 실패하였습니다. 시스템 관리자에게 문의하세요.<br>
오류내용: <%= exception.getMessage() %>
<%	
	}
%>