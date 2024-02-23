<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.Exception" %>    
<%@ page import="java.sql.*" %>
<!-- 파일 업로드 처리 용도 -->
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%
	// 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	String korname = "";
	String title = "";
	String content = "";
	String num = "";
	String fileContent1 = "";
	String fileOriginalContent1 = ""; 
	String fileContent2 = "";
	String fileOriginalContent2 = "";
	String[] fileCheckArr = null;
	
	String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
  String USER = "jsp";
  String PASSWORD = "123456";
	
  Connection conn = null; //디비 접속 성공시 접속 정보 저장
	PreparedStatement pstmt = null; // 쿼리 실행문
	
	Exception exception = null;
	
  // 파일 업로드 처리
  
  // 물리적인 위치 context(내 PC 디렉토리)
  String savePath = "D:\\temp2\\java_spring_lecture\\cotogether\\workspace_stsb_4_21\\starbucks-notice\\src\\main\\webapp\\upload-files";
  /*
  ServletContext context = getServletContext();
  String uploadFilePath = context.getRealPath(savePath);
  System.out.println(uploadFilePath);
  */

  //System.out.println("test1Attribute: " + request.getAttribute("test1"));
  //System.out.println("test1Attribute: " + session.getAttribute("test1"));
  try {
	  korname = request.getParameter("korname");					// 이름
		title = request.getParameter("title");							// 제목
		content = request.getParameter("content");					// 내용
		num = request.getParameter("num");									// 공지사항 번호

		// 0.
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	
		// 1. JDBC로 Oracle연결
	  conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
	  
		// 2. BO_FREE 테이블에 화면 폼으로부터 가져온 데이터 입력
		String updateQuery = "UPDATE BO_FREE SET NAME = ?, SUBJECT = ?, CONTENT = ?, FILE1_PATH = ?, FILE2_PATH = ? WHERE NUM = ?";
		pstmt = conn.prepareStatement(updateQuery);
		pstmt.setString(1, korname);
		pstmt.setString(2, title);
		pstmt.setString(3, content);
		pstmt.setString(4, fileContent1);
		pstmt.setString(5, fileContent2);
		pstmt.setInt(6, Integer.parseInt(num));
		
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
	if (exception == null) {	// 공지사항 글 수정이 성공할 경우
		// 1. 성공 팝업 생성
		// 2. 공지사항 리스트로 이동
%>		
<!-- 성공 케이스 html/css/js -->
<script>
	alert('공지사항 글이 성공적으로 수정되었습니다.');	// 1
	location.href = '<%= request.getContextPath() %>/adminNoticeList';
</script>
<%
	} else {									// 공지사항 글 수정이 실패할 경우
		// 1. 실패글
		// 2. 오류내용 표시
%>
<!-- 실패 케이스 html/css/js -->
공지사항 글 수정이 실패하였습니다. 시스템 관리자에게 문의하세요.<br>
오류내용: <%= exception.getMessage() %>
<%	
	}
%>







