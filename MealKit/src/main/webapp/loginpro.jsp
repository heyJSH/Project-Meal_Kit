<%@page import="javax.swing.JOptionPane"%>
<%@page import="javax.script.ScriptContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- import -->
<%@ page import="utils.*"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 인증 처리</title>
</head>
<body>
<h2>사용자 인증 처리</h2>

<!-- 로그인 사용자 인증처리 -->
<%
    String empId = request.getParameter("empId");
    String empPw = request.getParameter("empPw");

    try (Connection conn = DBConfig.getConnection()) {
        String sql = "SELECT EMP_ID, DEP_NM FROM EMPLOYEES WHERE EMP_ID=? AND EMP_PW=?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, empId);
            pstmt.setString(2, empPw);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String depNm = rs.getString("DEP_NM");
                    session.setAttribute("empId", empId);
                    session.setAttribute("depNm", depNm); // 부서 정보를 세션에 저장
                    response.sendRedirect("index.jsp");
                } else {
                    out.println("<script>alert('아이디 또는 비밀번호가 잘못되었습니다.'); location.href='login.jsp';</script>");
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("login.jsp");
    }
%>

   </body>
</html>