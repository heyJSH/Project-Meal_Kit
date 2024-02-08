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
<title>밀키트 관리 시스템</title>
	 <!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<!-- reset.css 연결 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
	<!-- main.css 연결 -->
	<link rel="stylesheet" href="./css/main.css" />
	<!-- footer.css 연결 -->
	<!-- <link rel="stylesheet" href="./css/footer.css" /> -->
	
	<!-- google font & google material icon -->
  <!-- Google 나눔고딕 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" />
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	
	<!-- jQuery 연결 -->
	<script defer src="./js/jquery-3.7.1.min.js"></script>
	<script defer src="./js/main.js"></script>
</head>
<body>
	<!-- header 공통 부분 연결 -->
	<%@ include file="header.jsp" %>
	
	<!-- 대표사진 -->
	<section class="visual">
		<div class="inner">
			<div class="title fade-in">
				<div class="fade-in">
					<img alt="./css/images/sample.png" src="sample image">
				</div>
			</div>
		</div>
	</section>
	
	<!-- 공지사항 -->
	<section class="notice">
		<div class="inner">
			<h2>공지사항</h2>
			<div class="container">
				<div class="wrapper">
<%
	// DB 정보 불러오기 => 공지사항 제목, 내용
	// ※ 공지사항 CRUD 할거면 테이블이 필요
	
	// String title = request.getParameter("title");
	// String content = request.getParameter("content");
	
	Connection conn = null;		// 디비 접속 성공시 접속 정보 저장
	PreparedStatement pstmt = null;		// 쿼리를 실행하기 위한 객체 정보
	ResultSet rs = null; 			// select 결과를 저장하는 정보
	Exception ex = null;
	
	
%>
				</div>
			</div>
		</div>
	</section>
	
	<!-- footer 공통 부분 연결 -->
	<!-- footer 높이 혹은 content 높이 조정필요
			 best는 position: relative 설정 잘하면 좋음 -->
	<%@ include file="footer.jsp" %>
</body>
</html>