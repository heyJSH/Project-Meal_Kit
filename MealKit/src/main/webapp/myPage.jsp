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
	<link rel="stylesheet" href="./css/mainjo.css" />
	<link rel="stylesheet" href="./css/myPage.css" />
	

	
	<!-- footer.css 연결 -->
	<!-- <link rel="stylesheet" href="./css/footer.css" /> -->
	
	<!-- google font & google material icon -->
  <!-- Google 나눔고딕 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" />
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	
	<!-- jQuery 연결 -->
	<script src="./js/jquery-3.7.1.min.js"></script>
	
</head>
<body>
	<!-- header 공통 부분 연결 -->
	<%@ include file="header.jsp" %>

  <form method="post" action="">
 
      <div class="container">
       
    <div class="insert">
    <h1>직원 정보 수정</h1>
	 <div class ="insertjo"></div>
     <table>
	
    <tr>
        <td class="col1">이름</td>
        <td class="col2"><input type="text" name="name" maxlength="5"></td>
    </tr>
    <tr>
        <td class="col1">아이디</td>
        <td class="col2">
            <input type="text" name="id" maxlength="10">
        </td>
    </tr>
    <tr>
        <td class="col1">비밀번호</td>
        <td class="col2">
            <input type="password" name="pwd"  maxlength="16"><br></br>
            <p>※비밀번호는 <span class="num">문자, 숫자, 특수문자(~!@#$%^&*)의 조합
            10 ~ 16자리</span>로 입력이 가능합니다.</p>
        </td>
    </tr>
    <tr>
        <td class="col1">비밀번호 확인</td>
        <td class="col2"><input type="password" name="pwdCheck" maxlength="16"></td>
    </tr>
    <tr> 
    </tr>
    </table>
    
  </div>
 
  <div class="create">
        <input class="but3" type="button" value="정보수정" onclick="">
    
  </div>
  </div>
  </form>
 </body>
</html>
