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
	<div class="blank"></div>
	 <div class="insert_noticform">
        <div class="insert_no_jo">
            <h1><a href="./noticList.jsp">글쓰기</a></h1>
        </div>
        <form action="./adminNoticeInsert.jsp" method="post" id="form1_jo" onSubmit="return false" enctype="multipart/form-data">
	        <div class="write_jo">
	            <div class="titlejo">
	                제목<input type="text" name="title_cho" id="title_cho" placeholder="제목을 입력하세요.">
	            </div>
	            <div class="msg_jo">
	                <div class ="msg_jo1">내용</div><textarea placeholder="내용을 입력하세요." name="content_jo" id="content_jo"></textarea>
	                <div><div>1. <input type="file" name="filecontent1" id="filecontent1"></div></div>
	                <div><div>2. <input type="file" name="filecontent2" id="filecontent2"></div>
	            </div>
	        </div>
	        </div>
	        <div class="btn_cho">
	        	<input type="submit" value="작성" class="input_btn_cho" onClick="javascript: prevCheckTextBox();" />
        	</div>
        </form>
    </div>
   
    <script>
    	function prevCheckTextBox() {
    		if (!$('#choname').val()) {	// 이름 관련 dom
    			alert('이름을 입력하세요.');	// 이름 입력하라고 팝업 뜸.
    			$('#choname').focus();		// 이름 입력 칸으로 포커스 이동
    			
    			return;
    		}
    		if ($('#choname').val().length > 5) { // 이름 관련 dom	
    			alert('이름을 5자 이내로 입력해 주세요.');	// 이름 5자 이내로 입력하라고 팝업 뜸.
    			$('#choname').focus();		// 이름 입력 칸으로 포커스 이동
    			
    			return;
    		}
    		if (!$('#title_cho').val()) {	// 제목 관련 dom
    			alert('제목을 입력하세요.');	// 제목 입력하라고 팝업 뜸.
    			$('#title_cho').focus();		// 제목 입력 칸으로 포커스 이동
    			
    			return;
    		}
    		if (!$('#content_jo').val()) {	// 내용 관련 dom
    			alert('내용을 입력하세요.');	// 내용 입력하라고 팝업 뜸.
    			$('#content_jo').focus();		// 내용 입력 칸으로 포커스 이동
    			
    			return;
    		}
    			
    		// 실제 form의 action의 값으로 전송
   			document.getElementById('form1_jo').submit();
    	}
    </script>
    

	<!-- footer 공통 부분 연결 -->
	<!-- footer 높이 혹은 content 높이 조정필요
			 best는 position: relative 설정 잘하면 좋음 -->
	<%@ include file="footer.jsp" %>
	
	</body>
</html>

