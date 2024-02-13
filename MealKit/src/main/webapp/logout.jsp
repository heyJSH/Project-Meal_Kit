<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!-- 로그아웃 세션 -->

<script type="text/javascript">
    // 페이지가 로드되자마자 로그아웃 처리를 진행
    window.onload = function() {
    // 로그아웃 알림
    alert('로그아웃 되었습니다.');
    // 로그인 페이지로 리다이렉션
    window.location.href = "login.jsp";
    }
</script>

<%
    // 세션 가져오기
    HttpSession sess = request.getSession(false);
    if (sess != null) {
        // 세션 종료
        session.invalidate();
    }
%>
