<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
    <div class="col-lg-7">
        <div class="p-5">
            <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">게시판 상세조회</h1>
            </div>
            <form action="/board/remove" method="post" id="form1" onSubmit="return false">
                <div class="form-group">
                    <label>Bno</label>
                    <input type="text" class="form-control" id="bno" name="bno" value='<c:out value="${board.bno}" />' readonly />
                </div>
                <div class="form-group">
                    <label>제목</label>
                    <input type="text" class="form-control" id="title" name="title" value='<c:out value="${board.title}" />' />
                </div>
                <div class="form-group">
                    <label>내용</label>
                    <textarea rows="5" class="form-control" id="content"  name="content" /><c:out value="${board.content}" /></textarea>
                </div>
                <div class="form-group">
                    <label>작성자</label>
                    <input type="text" class="form-control" id="writer"  name="writer" value='<c:out value="${board.writer}" />' readonly />
                </div>
                <!--
                <button class="btn btn-primary" type="button" onClick='location.href="/board/modify?bno=<c:out value="${board.bno}" />"'>
                -->
                <button class="btn btn-primary" type="button" onClick='javascript: boardModify();'>
                    수정하기
                </button>
                <button class="btn btn-info" type="button" onClick='location.href="/board/list"'>
                    목록
                </button>
                <button class="btn btn-danger" type="button" onClick='javascript: boardDelete();'>
                    삭제하기
                </button>
            </form>
            <!-- reply -->
            <hr>
            <div>댓글 </div>
            <hr>
            <form id="replyForm">
                  <div class="panel panel-default">
                      <div class="panel-body">
                          <ul class="chat"></ul>
                      </div>
                      <div class="panel-heading">
                          <i class="fa fa-comments fa-fw"></i> Reply
                          <input type="text" name="reply" id="reply" style="width:60%;" />
                          <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
                      </div>
                      <div class="panel-footer"></div>
            	</div>
            </form>
        </div>

    </div>
</div>

<script>
    function boardModify() {
        const form1 = document.getElementById('form1');
        form1.action = "/board/modify";

        form1.submit();
    }

    function boardDelete() {
        const form1 = document.getElementById('form1');
        form1.action = "/board/remove";

        form1.submit();
    }
</script>
<%@ include file="../includes/footer.jsp" %>