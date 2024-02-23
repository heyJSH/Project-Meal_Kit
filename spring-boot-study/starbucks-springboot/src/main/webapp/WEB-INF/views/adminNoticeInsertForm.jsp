<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/style.css">
    <script src="/resources/js/jquery-3.7.1.min.js"></script>
    <title>공지사항 쓰기</title>
</head>
<body>
    <div class="card">
        <div class="card-header1">
            <h1><a href="/adminNoticeList">스타벅스 공지사항 글 등록</a></h1>
        </div>
        <form action="/adminNoticeInsert" method="post" id="form1" onSubmit="return false" enctype="multipart/form-data">
	        <div class="card-write">
	            <div class="myinfo">
	                이름<input type="text" id="korname" name="korname" placeholder="이름을 입력하세요.">
	                <!-- 
	                비밀번호<input type="password" placeholder="비밀번호를 입력하세요.">
	                -->
	            </div>
	            <div class="title-w">
	                제목<input type="text" name="title" id="title" placeholder="제목을 입력하세요.">
	            </div>
	            <div class="msg">
	                내용<textarea placeholder="내용을 입력하세요." name="content" id="content"></textarea>
	                <input type="file" name="filecontent1" id="filecontent1">
	                <input type="file" name="filecontent2" id="filecontent2">
	            </div>
	        </div>
	        <div class="btn-w">
	        	<input type="submit" value="작성" class="input-btn-w" onClick="javascript: prevCheckTextBox();" />
        	</div>
        </form>
    </div>
    
    <script>
    	function prevCheckTextBox() {
    		if (!$('#korname').val()) {	// 이름 관련 dom
    			alert('이름을 입력하세요.');	// 이름 입력하라고 팝업 뜸.
    			$('#korname').focus();		// 이름 입력 칸으로 포커스 이동
    			
    			return;
    		}
    		if ($('#korname').val().length > 5) { // 이름 관련 dom	
    			alert('이름을 5자 이내로 입력해 주세요.');	// 이름 5자 이내로 입력하라고 팝업 뜸.
    			$('#korname').focus();		// 이름 입력 칸으로 포커스 이동
    			
    			return;
    		}
    		if (!$('#title').val()) {	// 제목 관련 dom
    			alert('제목을 입력하세요.');	// 제목 입력하라고 팝업 뜸.
    			$('#title').focus();		// 제목 입력 칸으로 포커스 이동
    			
    			return;
    		}
    		if (!$('#content').val()) {	// 내용 관련 dom
    			alert('내용을 입력하세요.');	// 내용 입력하라고 팝업 뜸.
    			$('#content').focus();		// 내용 입력 칸으로 포커스 이동
    			
    			return;
    		}
    			
    		// 실제 form의 action의 값으로 전송
   			document.getElementById('form1').submit();
    	}
    </script>
    <%
    	// 캐시 만료를 통한 뒤로가기 방지
	    response.setHeader("Expires", "Thu, 27 Jul 2023 09:00:00 GMT"); // 현재시각보다 이전으로 만료시간을 설정
	    response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, post-check=0, pre-check=0"); // str 로 "" 으로 넣는것보단, 상수형으로 넣어주는게 좋다. 
	    response.setHeader("Pragma", "no-cache"); 
    %>
</body>
</html>