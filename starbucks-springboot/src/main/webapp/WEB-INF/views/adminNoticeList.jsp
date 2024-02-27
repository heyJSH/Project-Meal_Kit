<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.Exception "%>
<%@ page import="java.net.http.* "%>
<%@ page import="java.time.*" %>
<%@ page import="java.time.format.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/style.css">
<script src="/resources/js/jquery-3.7.1.min.js"></script>
<title>스타벅스 공지사항 어드민</title>
</head>
<body>
	<!-- 1. 게시판의 화면은 class="card"로 적용 -->
	<div class="card">
		<!-- 1-1. 게시판 이름은 class="card-header"로  <div>로 구역 설정 -->
		<div class="card-header">
			<a href="#"><h1>스타벅스 공지사항 어드민</h1></a>
		</div>
		<!-- 1-2. 내용은 class="card-body"로 <div>로 구역 설정 -->
		<div class="card-body">
			<!-- 검색어 입력하기 -->
			<input type="search" name="search-text" id="search-text"
				placeholder="검색어를 입력하세요." value='<c:out value="${search}" />'><a
				class="search" href="javascript: searchText();">검색</a>
			<!-- 내용을 HTML로 작성하기 -->
            <c:forEach items="${freeBoardVOList}" var="freeBoard">
                <div class="content-box">
                    <div><c:out value="${freeBoard.num}" /></div>
                    <div class="title">
                        <a href='/adminNoticeUpdateForm?num=<c:out value="${freeBoard.num}" />'>
                            <c:out value="${freeBoard.subject}" />
                        </a>
                    </div>
                    <div><c:out value="${freeBoard.hit}" /></div>
                    <div class="delete">
                        <button style="cursor: pointer;"
                            onClick='javascript: noticeDelete(<c:out value="${freeBoard.num}" />);'>X</button>
                    </div>
                </div>
            </c:forEach>
		</div>

		<!-- 1-3. 글쓰기 버튼은 class="btn"로 <div>로 구역 설정 -->
		<div class="btn">
			<a href="./adminNoticeInsertForm">글쓰기</a>
		</div>
	</div>

	<script>
	    const insertSuccessCount = '<c:out value="${insertSuccessCount}" />'
        if(insertSuccessCount) {
            alert('글이 성공적으로 등록되었습니다.');
        }

        const deleteSuccessCount = '<c:out value="${deleteSuccessCount}" />'
        if(deleteSuccessCount) {
            alert('글이 성공적으로 삭제되었습니다.');
        }

    	function searchText() {
    		location.href = "./adminNoticeList?search=" + $('#search-text').val();
    	}
    	
    	function noticeDelete(noticeNum) {
    		if (confirm('정말 삭제하시겠습니까?')) {
    		    // GET method
    			// location.href = "/adminNoticeDelete?num=" + noticeNum;

                // POST method
                var newForm = $('<form name="newForm" method="post" action="/adminNoticeDelete"></form>');
                newForm.append($('<input/>', {type: 'hidden', name: 'num', value: noticeNum }));
                newForm.appendTo('body');

                // submit form
                newForm.submit();
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