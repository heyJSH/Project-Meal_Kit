<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loginform</title>
	<link rel="stylesheet" href="./css/login.css" />
</head>

<style>
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0,0,0,0.4);
}

.modal-content {
  background-color: #FFFFFF;
  margin: 17% auto;
  padding: 20px;
  border: 1px solid #888;
  text-align: center;
  width: 50%;
}

#input1{
  margin-right: 1%;
}

#button1{
  background-color: #fff5ee;
  color: black;
  font-weight: bold;
}

#button1:hover {
  background-color: black;
  color: white;
  font-weight: bold;
}

.close {
  color: #555;
  float: right;
  font-size: 28px;
  cursor: pointer;
}
</style>

<body>
<div class="container">
  <!-- Header -->
  <h1>Log in</h1>
  <form class="login"  action="loginpro.jsp" method="post" autocomplete="off">
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
 
 <!-- 비밀번호 찾기  -->
<div id="forgotPasswordModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>비밀번호 찾기</h2>
    <!-- action을 findPassword.jsp로 설정 -->
    <form id="forgotPasswordForm" action="findPassword.jsp" method="post" autocomplete="off">
      <input id="input1" type="text" name="empId" placeholder="직원 번호" required>
      <input id="input1" type="text" name="empContact" placeholder="직원 전화번호" required>    

      <!-- 버튼 클릭 시 form 제출 -->
      <button id ="button1" type="submit">비밀번호 찾기</button>
    </form>
  </div>
</div>
 

 <script>
	window.onload = function() {
	  // 페이지 아이디 저장
	  var savedId = localStorage.getItem('savedId');
	  if (savedId) {
	    document.getElementById('Id').value = savedId;
	    document.querySelector('input[type="checkbox"]').checked = true;
	  }
	
	  // 로그인 폼 제출 시,아이디 저장
	  document.querySelector('.login').onsubmit = function() {
	    if (document.querySelector('input[type="checkbox"]').checked) {
	      var empId = document.getElementById('Id').value;
	      localStorage.setItem('savedId', empId);
	    } else {
	      // 체크박스가 체크되어 있지 않으면 아이디를 삭제
	      localStorage.removeItem('savedId');
	    }
	  };
	}
	
	// 비밀번호 찾기 링크를 눌렀을때 보이게 
	document.querySelector('.btn-forgot').addEventListener('click', function(event) {
	event.preventDefault();
	document.getElementById('forgotPasswordModal').style.display = 'block';
	});
		
	document.querySelector('.close').addEventListener('click', function() {
	document.getElementById('forgotPasswordModal').style.display = 'none';
	});
		
</script>
 
</body>
</html>