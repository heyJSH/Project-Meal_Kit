<%@page import="dto.BomListVo"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="dto.MaterialVo"%>
<%@page import="java.security.interfaces.RSAKey"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!-- DB와 연결 -->
<%@ page import="utils.DBManager" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.lang.Exception, java.sql.SQLException" %>

<!DOCTYPE html>
<!-- java 연결 -->
<%@ page import = "dao.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>밀키트 관리 시스템</title>
	<!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	<!-- reset.css 연결 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
	<!-- main.css 연결 -->
	<link rel="stylesheet" href="./css/main.css" />
	<!-- bomList.css 연결 -->
	<link rel="stylesheet" href="./css/bomInsert.css" />
	
	<!-- google font & google material icon -->
  <!-- Google 나눔고딕 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" />
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	
	<!-- Google material 아이콘 -->
  <!-- 아이콘을 이미지가 아닌, 폰트처럼 사용 가능함 -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  
	<!-- jQuery 연결 -->
	<script defer src="./js/jquery-3.7.1.min.js"></script>
</head>
<body>
	<!-- header 공통 부분 연결 -->
	<%@ include file="header.jsp" %>
	<!-- ============================================================================== -->
	
	<!-- BOM 등록 -->
	<section>
		<div class="main_wrap">
			<div class="blank"></div>
			<!-- 조건 설정 -->
			<div class="inner condition_container">
				<div class="inner bomInsertList">
					<div class="bomInsertList Bom_condition_tit">
						<h1 class="Bom_condition_tit">BOM 등록</h1>
					</div>
					<div class="inner">
							<!-- BOM 등록 MultiForm 연결 -->
							<%@ include file="newBom.jsp" %>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	
	<!-- ============================================================================== -->
	<!-- footer 공통 부분 연결 -->
	<%@ include file="footer.jsp" %>

</body>
</html>