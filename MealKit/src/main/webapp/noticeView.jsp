<%@ page import="utils.DBConfig"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.Exception" %>    
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>


<html>
<head>
 	<meta charset="UTF-8">
    
    <title>공지사항 글수정</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/noticeS.css">
    <link rel="icon" href="images/favicon.ico">
    <script defer src="js/jquery-3.7.1.min.js"></script>
    <script defer src="js/main.js"></script>
    
<title>공지사항 수정폼</title>
</head>
<body>
<%@ include file="header.jsp" %>

<%
	// 한글 처리
	request.setCharacterEncoding("UTF-8");

	String num = request.getParameter("num");
	
	Connection conn = null; //디비 접속 성공시 접속 정보 저장
	Statement stmt = null; //쿼리를 실행하기 객체 정보
	ResultSet rs = null;
	
	Exception exception = null;

	String name = "";
	String title = "";
	String content = "";
	String fileName1 = "";
	String fileName2 = "";
	Integer noNum = null;
	
  try {
		// DB연결
	 	conn=DBConfig.getConnection();
		
		stmt = conn.createStatement();	// 2-1. Statement 생성
	 	rs = stmt.executeQuery("SELECT NO_NUM, EMP_NM, TITLE, CONTENT, FILE1_PATH, FILE2_PATH FROM NOTICE WHERE NO_NUM = " + num); 
		
		if (rs.next()) {
			noNum = rs.getInt("NO_NUM");
	 		name = rs.getString("EMP_NM");
	 		title = rs.getString("TITLE");
	 		content = rs.getString("CONTENT");
	 		fileName1 = rs.getString("FILE1_PATH");
	 	    fileName2 = rs.getString("FILE2_PATH");
	 	  }
  } catch(Exception e) {
	  System.out.println("오라클 접속 오류: " + e);
  } finally {
	  if (stmt != null) try { stmt.close(); } catch (SQLException ex) {}
	  if (conn != null) try { conn.close(); } catch (SQLException ex) {}
  }
%>

<%
    String num1 = request.getParameter("num");
    Connection conn1 = null;
    Statement stmt1 = null;
    PreparedStatement pstmt1 = null;
    ResultSet rs1 = null;
    Exception exception1 = null;

    try {
        // DB연결
        conn = DBConfig.getConnection();

        // 조회수 업데이트
        String updateHitQuery = "UPDATE NOTICE SET HIT = HIT + 1 WHERE NO_NUM = ?";
        pstmt1 = conn.prepareStatement(updateHitQuery);
        pstmt1.setString(1, num);
        pstmt1.executeUpdate();

        // 공지사항 정보 조회
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT NO_NUM, EMP_NM, TITLE, CONTENT, FILE1_PATH, FILE2_PATH FROM NOTICE WHERE NO_NUM = " + num);
%>

        <div class="card2">
        <div class="card-header2">
            <h1><a href="./notice.jsp">공지사항</a></h1>
        </div>
        <form action="./noticeUpdate.jsp" method="post" id="form1" onSubmit="return false" enctype="multipart/form-data">
        	<div class = "in"><input type="hidden" name="num" value="<%= num %>"></div>
	        <div class="card-write2">
	            <div class="title-w2">
	                <div class ="card_t"><%= title %></div>
	            </div>
	            <div class="msg2">
	                <div class ="con_2"><%= content %></div>
	                <div  class ="con_3">등록된 첨부파일1 -> <a href="./fileDownload.jsp?filename=<%= fileName1 %>"><%= fileName1 %></a></div>
	                <div  class ="con_3">등록된 첨부파일2 -> <a href="./fileDownload.jsp?filename=<%= fileName2 %>"><%= fileName2 %></a></div>
	            </div>
	        </div>
        </form>
        <div class="btn-w2">
	        	<input type="submit" value="수정" class="input-btn-w" onClick="location.href='./noticeUpdateForm.jsp?num=<%= noNum %>'" />
        </div>
    </div>
    <%
    } catch(Exception e) {
        System.out.println("오라클 접속 오류: " + e);
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ex) {}
        if (stmt != null) try { stmt.close(); } catch (SQLException ex) {}
        if (pstmt1 != null) try { pstmt1.close(); } catch (SQLException ex) {}
        if (conn != null) try { conn.close(); } catch (SQLException ex) {}
    }
	%>


    
    <!-- footer -->
    <footer>
		<ul class="company_infojo">
			<li class="cInfo">주소: 회사 주소</li>
			<li class="cInfo">이메일: info@company.com</li>
			<li class="cInfo">전화번호: 123-456-7890</li>
    </ul>
   </footer>
    
    <script>
    	function prevCheckTextBox() {
    		if (!$('#korname').val()) {	
    			alert('이름을 입력하세요.');	
    			$('#korname').focus();		
    			
    			return;
    		}
    		if ($('#korname').val().length > 5) { 
    			alert('이름을 5자 이내로 입력해 주세요.');	
    			$('#korname').focus();		
    			
    			return;
    		}
    		if (!$('#title').val()) {	
    			alert('제목을 입력하세요.');
    			$('#title').focus();		
    			
    			return;
    		}
    		if (!$('#content').val()) {	
    			alert('내용을 입력하세요.');	
    			$('#content').focus();		
    			
    			return;
    		}
    		
    		// 실제 form의 action의 값으로 전송
   			document.getElementById('form1').submit();
    	}
    	
    	function noticeDelete(noticeNum) {
        	if (confirm('정말 삭제하시겠습니까?')) {
        		location.href = "./noticeDelete.jsp?num=" + noticeNum;
        		}
        	}
    			
    	
    </script>
</body>
</html>