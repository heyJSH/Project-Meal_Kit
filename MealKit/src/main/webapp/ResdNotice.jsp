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
    
    <title>공지사항 읽기 </title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/noticeS.css">
    <link rel="icon" href="images/favicon.ico">
    <script defer src="js/jquery-3.7.1.min.js"></script>
    <script defer src="js/main.js"></script>
    
<title>공지사항 읽기</title>
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
	
	
  try {
		// DB연결
	 	conn=DBConfig.getConnection();
		
		stmt = conn.createStatement();	// 2-1. Statement 생성
	 	rs = stmt.executeQuery("SELECT NO_NUM, EMP_NM, TITLE, CONTENT FROM NOTICE WHERE NO_NUM = " + num); 
		
		if (rs.next()) {
	 		name = rs.getString("EMP_NM");
	 		title = rs.getString("TITLE");
	 		content = rs.getString("CONTENT");
	
	 	  }
		  } catch(Exception e) {
			  System.out.println("오라클 접속 오류: " + e);
		  } finally {
			  if (stmt != null) try { stmt.close(); } catch (SQLException ex) {}
			  if (conn != null) try { conn.close(); } catch (SQLException ex) {}
		  }
	%>



<div class="card">
        <div class="card-header1">
            <h1><a href="./notice.jsp">공지사항</a></h1>
        </div>
        <form action="./noticeUpdate.jsp" method="post" id="form1" onSubmit="return false" enctype="multipart/form-data">
        	<input type="hidden" name="num" value="<%= num %>">
        	<input type="hidden" name="file1Prev" value="<%= fileName1 == null ? "" : fileName1 %>">
        	<input type="hidden" name="file2Prev" value="<%= fileName2 == null ? "" : fileName2 %>">
	        <div class="card-write">
	            <div class="myinfo">
	                이름<input type="text" id="korname" name="korname" placeholder="이름을 입력하세요." value="<%= name %>">
	            </div>
	            <div class="title-w">
	                제목<input type="text" name="title" id="title" placeholder="제목을 입력하세요."  value="<%= title %>">
	            </div>
	            <div class="msg">
	                내용<textarea placeholder="내용을 입력하세요." name="content" id="content"><%= content %></textarea>
	                <div><div></div><div>등록된 첨부파일1 -> <a href="./fileDownload.jsp?filename=<%= fileName1 %>"><%= fileName1 %></a></div></div>
	                <div><div></div><div>등록된 첨부파일2 -> <a href="./fileDownload.jsp?filename=<%= fileName2 %>"><%= fileName2 %></a></div></div>
	            </div>
	        </div>
	        <div class="btn-w">
	        	<input type="submit" value="수정" class="input-btn-w" onClick="javascript: prevCheckTextBox();" />
        	</div>
        </form>
    </div>
    
    <!-- footer -->
    <footer>
		<ul class="company_infojo">
			<li class="cInfo">주소: 회사 주소</li>
			<li class="cInfo">이메일: info@company.com</li>
			<li class="cInfo">전화번호: 123-456-7890</li>
    </ul>
   </footer>
    
 
</body>
</html>