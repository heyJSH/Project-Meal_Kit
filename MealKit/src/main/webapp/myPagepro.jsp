<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="utils.DBConfig"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정 업데이트 처리</title>

	<!-- 사용자 정보 업데이트 처리 -->
	
	<%
	// 폼에서 전송된 데이터 수집
	String empId = request.getParameter("myid");
	String empNm = request.getParameter("myname");
	String empPw = request.getParameter("pwd");
	String empContact = request.getParameter("con_nm");
	System.out.println(empId);
	System.out.println(empNm);
	System.out.println(empPw);
	System.out.println(empContact);
	

	try {
	    Connection conn = DBConfig.getConnection();
	    String sql = "UPDATE EMPLOYEES SET EMP_PW=?, EMP_CONTACT=? WHERE EMP_ID=?";
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, empPw);
	    pstmt.setString(2, empContact);
	    pstmt.setString(3, empId); 
	    System.out.println("1");
	    
	    int updated = pstmt.executeUpdate();
	    if(updated > 0) {
	    	System.out.println("2");
	     // 업데이트 성공 시, myPage.jsp로 이동
	     %>
	     <script type="text/javascript">
	    	alert("정보가 수정되었습니다.");
	    	window.location.href="index.jsp"; 
	    </script>
	     <% 
	    } else {
	          // 실패 처리
	          System.out.println("3");
	    	 out.println("<script>alert('정보 수정에 실패하였습니다.'); location.href='myPage.jsp';</script>");
	    }
		}catch(Exception e) {
	    e.printStackTrace();
		}
		%>

 </body>
</html>
