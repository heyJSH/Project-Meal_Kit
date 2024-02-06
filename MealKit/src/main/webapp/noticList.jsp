<%@page import="utils.DBConfig"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<!-- DB와 연결 -->
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.lang.Exception, java.sql.SQLException" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 list 폼</title>
	<!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<!-- reset.css 연결 -->
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
	<!-- main.css 연결 -->
	<link rel="stylesheet" href="./css/main.css" />
	<link rel="stylesheet" href="./css/mainjo.css" />
	<link rel="stylesheet" href="./css/noticeForm.css" />
	
    <!-- google font & google material icon -->
    <!-- Google 나눔고딕 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	
	<!-- jQuery 연결 -->
	<script src="./js/jquery-3.7.1.min.js"></script>
	<script src="./js/script.js"></script>
	
</head>
<body>
	<!-- header 공통 부분 연결 -->
	<%@ include file="header.jsp" %>

	<!--main -->
	<!-- 로그인이 안되어 있을때 다시 로그인 창으로 이동 -->
	<% if(session.getAttribute("empId") == null) { 
    response.sendRedirect("login.jsp"); // 로그인 페이지로 리다이렉션
	}
	%>
	
	<!-- 사용자로부터 검색어를 입력받는 부분을 처리하는 코드 -->
	<%
	String searchText_jo = request.getParameter("searchjo");
	if (searchText_jo == null) {
		searchText_jo = "";
	}
	%>
	
	
    <div class="noticeboard">
        <div class ="board_header">
        	<h1><a href="notic_list.jsp">공지사항</a></h1>
        </div>
        <div class="board_body"> 
        	<input type="search" name="search_text_jo" id="search_text_jo" placeholder="검색어를 입력하세요." value="<%= searchText_jo %>">
        	<a class="searchjo" href="javascript: searchText();">검색</a>
        	
	  	<div class="re_header">
	  		 <div class="re_no">NO</div>
	  		 <div class="re_title">제목</div>
	  		 <div class="re_regdate">날짜</div>
	  		 <div class="re_hit">조회수</div>
	  	</div>
          
    <%
		Connection conn = null; // 디비 접속 성공시 접속 정보 저장
		Statement stmt = null;  // 쿼리를 실행하기 객체 정보
		ResultSet rs = null;
	
		try {
			 conn = DBConfig.getConnection();
			 System.out.println("접속성공");
	   } catch(SQLException se) {
			 System.out.println("접속실패");
	   } try {
	 	 stmt = conn.createStatement();	
	  	 rs = stmt.executeQuery("SELECT NO_NUM, TITLE, HIT, REGDATE FROM NOTICE WHERE TITLE LIKE '%" + searchText_jo + "%' ORDER BY NO_NUM DESC fetch first 5 rows only");
	 	 while(rs.next()) {
	 		
	%>      
		<div>
            <div class="content_boxjo">
                <div><%= rs.getInt("NO_NUM") %></div>
                <div class="title_jo"><a href="./noticeUpdateForm.jsp?num=<%= rs.getInt("NO_NUM") %>"><%= rs.getString("TITLE") %></a></div>
                <div><%= rs.getDate("REGDATE") %></div>
                <div class="delete_jo"><button style="cursor: pointer;" onClick="javascript: noticeDelete(<%= rs.getInt("NO_NUM") %>);">X</button></div>
            </div>
         </div>      
	<% 		 		
		}
	  } catch(Exception e) {
		  System.out.println("오라클 접속 오류: " + e);
	  } finally {
		  if (rs != null) try { rs.close(); } catch (SQLException ex) {}
		  if (stmt != null) try { stmt.close(); } catch (SQLException ex) {}
		  if (conn != null) try { conn.close(); } catch (SQLException ex) {}
	  }
	%>	
	  </div>	
	   <div class="btn">
            <a href="./noticeInsetForm.jsp">글쓰기</a>
        </div>
    </div>
    

	<!-- footer 공통 부분 연결 -->
	<!-- footer 높이 혹은 content 높이 조정필요
			 best는 position: relative 설정 잘하면 좋음 -->
	<%@ include file="footer.jsp" %>
	
	</body>
</html>

