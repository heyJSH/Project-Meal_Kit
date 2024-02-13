<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.lang.Exception" %>    
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="utils.DBConfig"%>

<%
	// 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	String korname = "";
	String title = "";
	String content = "";
	String num = "";
	
    Connection conn = null; //디비 접속 성공시 접속 정보 저장
	PreparedStatement pstmt = null; // 쿼리 실행문
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
		num = multi.getParameter("num");
		String file1Prev = multi.getParameter("file1Prev");
		String file2Prev = multi.getParameter("file2Prev");
		
		String filename1 = multi.getFilesystemName("filecontent1");	// 첫번째 첨부파일 이름
		String filename2 = multi.getFilesystemName("filecontent2");	// 두번째 첨부파일 이름
		  
	
		// 1. JDBC로 Oracle연결
	 	conn=DBConfig.getConnection();
	  
		String fileQueryName1 = "";
		if (filename1 != null) {
			// 실제 첨부파일1 삭제
			File file = new File(savePath + "\\" + file1Prev);
			if (file.exists()) {
				file.delete();
			}
			
			fileQueryName1 = ", FILE1_PATH = '" + filename1 + "' ";
		}
		String fileQueryName2 = "";
		if (filename2 != null) {
			// 실제 첨부파일2 삭제
			File file = new File(savePath + "\\" + file2Prev);
			if (file.exists()) {
				file.delete();
			}
			// 실제 첨부파일2 삭제
			fileQueryName2 = ", FILE2_PATH = '" + filename2 + "' ";
		}
		
		// 2. BO_FREE 테이블에 화면 폼으로부터 가져온 데이터 입력
		String updateQuery = "UPDATE NOTICE SET EMP_NM = ?, TITLE = ?, CONTENT = ? " 
			+ fileQueryName1 + fileQueryName2 + " WHERE NO_NUM = ?";
		pstmt = conn.prepareStatement(updateQuery);
		pstmt.setString(1, korname);
		pstmt.setString(2, title);
		pstmt.setString(3, content);
		pstmt.setInt(4, Integer.parseInt(num));
		
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
		
	%>		
	<!-- 성공 케이스-->
		<script>
			alert('공지사항 글이 성공적으로 수정되었습니다.');	// 1
			location.href = '<%= request.getContextPath() %>/notice.jsp';
		</script>
	<%
		} else {	// 공지사항 글 수정이 실패할 경우
	%>
	<!-- 실패 케이스-->
		공지사항 글 수정이 실패하였습니다. 시스템 관리자에게 문의하세요.<br>
		오류내용: <%= exception.getMessage() %>
	<%	
		}
	%>







