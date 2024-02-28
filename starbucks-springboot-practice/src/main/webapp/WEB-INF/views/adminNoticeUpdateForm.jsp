<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.lang.Exception, java.sql.SQLException" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/style.css">
    <script src="/resources/js/jquery-3.7.1.min.js"></script>
    <title>공지사항 수정</title>
</head>
<body>
    <div class="card">
        <div class="card-header1">
            <h1><a href="/adminNoticeList">스타벅스 공지사항 글 수정</a></h1>
        </div>
        <form action="/adminNoticeUpdate" method="post" id="form1" onSubmit="return false" enctype="multipart/form-data">
        	<input type="hidden" name="num" value='<c:out value="${freeBoard.num}" />'>
	        <div class="card-write">
	            <div class="myinfo">
	                이름<input type="text" id="korname" name="korname" placeholder="이름을 입력하세요." value='<c:out value="${freeBoard.name}" />'>
	            </div>
	            <div class="title-w">
	                제목<input type="text" name="title" id="title" placeholder="제목을 입력하세요."  value='<c:out value="${freeBoard.subject}" />'>
	            </div>
	            <div class="msg">
	                내용<textarea placeholder="내용을 입력하세요." name="content" id="content"><c:out value="${freeBoard.content}" /></textarea>
	                <div><div>1. <input type="file" name="fileContent" id="filecontent1"><input type="checkbox" name="filecheck" value="1" /><span style="font-size:12px;"> 1번파일 삭제</span></div><div style="font-size:13px;">※ 파일 선택하고 저장시 아래 업로드 파일 목록의 1번의 파일이 없어지거나 대체됨</div></div>
	                <div><div>2. <input type="file" name="fileContent" id="filecontent2"><input type="checkbox" name="filecheck" value="2" /><span style="font-size:12px;"> 2번파일 삭제</span></div><div style="font-size:13px;">※ 파일 선택하고 저장시 아래 업로드 파일 목록의 2번의 파일이 없어지거나 대체됨</div></div>
	            </div>
	            <br>
	            <div>
                    업로드 파일 목록<br>
                    <ul>
                        <li style="list-style-type: none;">
                            1. <a href='/fileDownload?filename=<c:out value="${freeBoard.file1Path}" />'><c:out value="${freeBoard.file1Path}" /></a>
                            <input type="hidden" name="file1Name" value='<c:out value="${freeBoard.file1Path}" />'>
                            <button onClick='javascript: deleteUploadFile(<c:out value="${freeBoard.num}" />, 1, "<c:out value="${freeBoard.file1Path}" />")'>삭제</button>
                        </li>
                        <li style="list-style-type: none;">
                            2. <a href='/fileDownload?filename=<c:out value="${freeBoard.file2Path}" />'><c:out value="${freeBoard.file2Path}" /></a>
                            <input type="hidden" name="file2Name" value='<c:out value="${freeBoard.file2Path}" />'>
                            <button onClick='javascript: deleteUploadFile(<c:out value="${freeBoard.num}" />, 2, "<c:out value="${freeBoard.file2Path}" />")'>삭제</button>
                        </li>
                    </ul>
	            </div>
	        </div>
	        <div class="btn-w">
	        	<input type="submit" value="수정" class="input-btn-w" onClick="javascript: prevCheckTextBox();" />
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
    	
    	function deleteUploadFile(noticeNum, fileNum, fileName) {
    		if (confirm('정말 해당 파일을 삭제하시겠습니까?')) {
                location.href = '/fileDelete?noticeNum=' + noticeNum + '&fileNum=' + fileNum + '&fileName=' + fileName;
    		}
    	}
    </script>
    <%
    	// 캐시 만료를 통한 뒤로가기 방지
	    response.setHeader("Expires", "Thu, 27 Jul 2023 09:00:00 GMT"); // 현재시각보다 이전으로만 만료시간을 설정
	    response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, post-check=0, pre-check=0"); // str 로 "" 으로 넣는것보단, 상수형으로 넣어주는게 좋다. 
	    response.setHeader("Pragma", "no-cache"); 
    %>
</body>
</html>