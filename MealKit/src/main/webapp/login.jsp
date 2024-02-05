<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loginform</title>
	<link rel="stylesheet" href="./css/login.css" />
</head>
<body>
<div class="container">
  <!-- Header -->
  <h1>Log in</h1>
  <form class="login"  action="loginpro.jsp" method="post">
  	<span>ID</span>
  	<input type = "text" id="Id" name ="empId" placeholder="id" required>
  	<span>Password</span>
  	<input type = "password" id="password" name ="empPw"placeholder="password" required>
  	<p>
  		<label>
  			<input type = "checkbox">아이디 저장
  		</label>
  		<a href ="#none" class ="btn-forgot">비밀번호 찾기</a>
  	</p>
  	<button type="submit">Log in</button>
  </form>
  
  
 </div>
</body>
</html>