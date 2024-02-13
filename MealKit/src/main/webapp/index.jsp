<%@ page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="utils.DBConfig"%>
<!-- DB와 연결 -->
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.lang.Exception, java.sql.SQLException" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키트 관리 시스템</title>
	<!-- reset.css 연결 -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
	<!-- main.css 연결 -->
	<link rel="stylesheet" href="./css/main.css" />
	<link rel="stylesheet" href="./css/mainjo.css" />
	<link rel="stylesheet" href="./css/noitcejo.css" />

	
  <!-- footer.css 연결 -->
  <!-- <link rel="stylesheet" href="./css/footer.css" /> -->
	
  <!-- google font & google material icon -->
  <!-- Google 나눔고딕 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" />
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	
	<!-- jQuery 연결 -->
	<script src="./js/jquery-3.7.1.min.js"></script>
	
</head>
 <body>
	<!-- header 공통 부분 연결 -->
	<%@ include file="header.jsp" %>

	<!--main -->
	<!-- 로그인이 안되어 있을때 다시 로그인 창으로 이동 -->
	<% if(session.getAttribute("empId") == null) { 
	    response.sendRedirect("login.jsp"); // 로그인 페이지로 리다이렉션
	}
	%>
		<!-- 메인에 있는 호버 사진 -->
	    <article class="photo">
	        <section>
	            <div></div>
	            <h4>innovation</h4>
	        </section>
	        <section>
	            <div></div>
	            <h4>communication</h4>
	        </section>
	        <section>
	            <div></div>
	            <h4>health</h4>
	        </section>
	        <section>
	            <div></div>
	            <h4>confidence</h4>
	        </section>
	    </article>
	     
	     <!-- NEW CONTENTS box -->
	     <div class  ="new_contentjo">
	     	<h1>NEW CONTENTS</h1>
	     </div>
	     
	   <!-- 공지사항 -->    
	   <article class="notice_jo">
	     <div class="notice-section">
         	<div class ="no_img">
 				<a href="notice.jsp"><img src="https://cdn4.iconfinder.com/data/icons/wirecons-free-vector-icons/32/add-512.png" alt=""></a>         
 		   </div>
         
        <% 
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                conn = DBConfig.getConnection();
                String sql = "SELECT ROWNUM, no_num, emp_nm, title, regdate FROM Notice  WHERE ROWNUM <=3 ORDER BY no_num DESC ";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();

                while(rs.next()) {
                    String noNum = rs.getString("no_num");
                    String empNm = rs.getString("emp_nm");
                    String title = rs.getString("title");
                    String regdate = rs.getString("regdate").substring(0, 10); 
        %>
                    <div class="notice-item">
                        <span class="notice-title"><p>[공지]</p> <%= title %></span>
                        <span class="notice-date"><p><%= regdate %></p></span>
                    </div>
        <% 
                }
            } catch(Exception e) {
                e.printStackTrace();
            } finally {
                if(rs != null) try { rs.close(); } catch(Exception e) {}
                if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
                if(conn != null) try { conn.close(); } catch(Exception e) {}
            }
        %>
    </div>
    
    	<!-- 뉴스 css -->
	    </article>
	    
	 <article class="news1">
        <h2>관련 소식</h2>
          <div>
        <section>
            <div></div>
            <div>
              <h4>(주) 파리크라상</h4>
            </div>
        </section>
        <section>
            <div></div>
            <div>
              <h4>(주) 롯데웰푸드</h4>
            </div>
        </section>
        <section>
            <div></div>
            <div>
               <h4>(주) 동원F&B</h4>
            </div>
        </section>
        </div>
    </article>


		
	<!-- footer 공통 부분 연결 -->
	<%@ include file="footer.jsp" %>
   
   </body>	
</html>