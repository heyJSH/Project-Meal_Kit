<%@page import="utils.DBConfig"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.Exception" %>    
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@page import="java.util.*" %>

<%
	// 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	String korname = "";
	String title = "";
	String content = "";
	

  	Connection conn = null; //디비 접속 성공시 접속 정보 저장
  	PreparedStatement pstmt = null;  // 쿼리 실행문
	ResultSet rs = null;
	Exception exception = null;
	
	String savePath = "D:\\github-dh\\Project-Meal_Kit\\MealKit\\src\\main\\webapp\\upload-files";
	
  try {
	 	  MultipartRequest multi = new MultipartRequest(
		  request,
		  savePath,			// 실제 파일을 저장할 서버의 디렉토리
		  1024 * 1024 * 5,  // 업로드 제한 파일 크기(단위 byte) -> 5MB
		 "utf-8",
		  new DefaultFileRenamePolicy()
	  	);
		  korname = multi.getParameter("korname");
		  title = multi.getParameter("title");
		  content = multi.getParameter("content");
		  
		  String filename1 = multi.getFilesystemName("filecontent1");	// 첫번째 첨부파일 이름
		  String filename2 = multi.getFilesystemName("filecontent2");	// 두번째 첨부파일 이름
	  
		// 0.
	 	   conn=DBConfig.getConnection();
	 	  
	  
		// 2. 테이블에 화면 폼으로부터 가져온 데이터 입력
			String insertQuery = "INSERT INTO NOTICE(EMP_NM, TITLE, CONTENT, FILE1_PATH, FILE2_PATH) VALUES (?,?,?,?,?)";
			pstmt = conn.prepareStatement(insertQuery);
			pstmt.setString(1, korname);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setString(4, filename1);
			pstmt.setString(5, filename2);
		
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
		if (exception == null) {	// 1. 공지사항 글이 성공할 경우
	%>		
		<!-- 성공 케이스-->
		<script>
			alert('공지사항 글이 성공적으로 등록되었습니다.');	// 1
			location.href = '<%= request.getContextPath() %>/notice.jsp';
		</script>
	<%
		} else {  // 2. 공지사항 글 등록이 실패할 경우
			
	%>
		<!-- 실패 케이스-->
		공지사항 글 등록이 실패하였습니다. 시스템 관리자에게 문의하세요.<br>
		오류내용: <%= exception.getMessage() %>
	<%	
		}
	%>







