<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp" %>
    <div class="col-lg-7">
        <div class="p-5">
            <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">게시판 등록</h1>
            </div>
            <form action="/board/register" method="post">
                <div class="form-group">
                    <label>제목</label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="제목">
                </div>
                <div class="form-group">
                    <label>내용</label>
                    <textarea rows="5" class="form-control" id="content"  name="content"></textarea>
                </div>
                <div class="form-group">
                    <label>작성자</label>
                    <input type="text" class="form-control" id="writer"  name="writer" placeholder="작성자">
                </div>
                <button type="submit" class="btn btn-primary" type="button">
                    등록하기
                </button>
            </form>
        </div>
    </div>
</div>
<%@ include file="../includes/footer.jsp" %>