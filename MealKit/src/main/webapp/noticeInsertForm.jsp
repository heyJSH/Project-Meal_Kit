<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="utils.DBConfig"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
 
    <title>공지사항 글쓰기폼</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/noticeS.css">
    <link rel="icon" href="images/favicon.ico">
    <script defer src="js/jquery-3.7.1.min.js"></script>
    <script defer src="js/main.js"></script>
  
  </head>
<body>
	<%@ include file="header.jsp" %>
	
	 <div class="card">
        <div class="card-header1">
            <h1><a href="./notice.jsp">글쓰기</a></h1>
        </div>
        <form action="./noticeInsert.jsp" method="post" id="form1" onSubmit="return false" enctype="multipart/form-data">
	        <div class="card-write">
	            <div class="myinfo">
	                이름<input type="text" id="korname" name="korname" placeholder="이름을 입력하세요.">
	            </div>
	            <div class="title-w">
	                제목<input type="text" name="title" id="title" placeholder="제목을 입력하세요.">
	            </div>
	            <div class="msg">
	                내용<textarea placeholder="내용을 입력하세요." name="content" id="content"></textarea>
	                <div><div>1. <input type="file" name="filecontent1" id="filecontent1"></div></div>
	                <div><div>2. <input type="file" name="filecontent2" id="filecontent2"></div>
	            </div>
	        </div>
	        <div class="btn-w">
	        	<input type="submit" value="작성" class="input-btn-w" onClick="javascript: prevCheckTextBox();" />
        	</div>
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
    		if  (!$('#content').val()) {	
    			alert('내용을 입력하세요.');	
    			$('#content').focus();		
    			
    			return;
    		}
    			
    		// 실제 form의 action의 값으로 전송
   			document.getElementById('form1').submit();
    	}
    </script>
</body>
</html>