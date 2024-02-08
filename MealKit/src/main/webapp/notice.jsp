<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="utils.DBConfig"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>2
<head>
    <meta charset="UTF-8">    
    <title>공지사항</title>
    <link rel="stylesheet" href="css/reset.css">  
    <link rel="icon" href="images/favicon.ico">
    <script defer src="js/jquery-3.7.1.min.js"></script>
    <script defer src="js/main.js"></script>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/notice.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    
  </head>
<body>
	<%@ include file="header.jsp" %>	
	
	<%
	String searchText = request.getParameter("search");
	if (searchText == null) {
		searchText = "";
	}
	%>	
	
     <section class ="inner_jo">
	  <div class="inner sub_tit_wrap">
		  <div class="sub_tit_inner">
	      <h2><img src="https://www.starbucks.co.kr/common/img/whatsnew/notice_tit.jpg" alt="공지사항"></h2>
		  </div>
		  <div class="news_sch_wrap">
		  	<div class="sch_items">
	      	<input type="search" name="sch_bar" id="sch_bar" placeholder="검색어를 입력해 주세요. "value="<%= searchText %>"><a class="search" href="javascript: searchText();">검색</a>
      	</div>
      </div>
	  </div>
  </section>
  
  <!-- notice list -->
  <section>
	  <div class="inner notice__list">
	  	<div class="notice__header">
	  		<div class="notice__no">NO</div>
	  		<div class="notice__title">제목</div>
	  		<div class="notice__regdate">날짜</div>
	  		<div class="notice__hit">조회수</div>

	  	</div>
	  	<div class="notice__list__itmes">
        		
        		<%
        			//1.JSDB로 Oracle연결 ->java - DBConfig.java
        			Connection conn = null; //디비 접속 성공시 접속 정보 저장
					Statement stmt = null; //쿼리를 실행하기 객체 정보
					ResultSet rs = null;
					
					try{
						conn=DBConfig.getConnection();
						System.out.println("접속 성공");
						
						//2.테이블에서 SQL로 데이터 가져오기
							stmt = conn.createStatement();	// 2-1. Statement 생성
	 						rs = stmt.executeQuery("SELECT NO_NUM, TITLE, HIT, REGDATE FROM NOTICE WHERE TITLE LIKE '%" + searchText + "%' ORDER BY NO_NUM DESC fetch first 5 rows only"); // 2-2. SQL 쿼리 실행
		
								
						
						//3. rs로 데이터 가져온 걸 웹에 보여주기 => 쿼리 실행 결과 출력
						while(rs.next()){
				%>			
							<div class="content-box">
				                <div class ="jo_num"><%= rs.getInt("NO_NUM") %></div>
				                <div class="title_no"><a href="./noticeUpdateForm.jsp?num=<%= rs.getInt("NO_NUM") %>"><%= rs.getString("TITLE") %></a></div>
				                <div class ="jo_date"><%= rs.getDate("REGDATE") %></div>
				                <div class ="jo_hit"><%= rs.getInt("HIT") %></div>
				                <div class="delete"><button style="cursor: pointer;" onClick="javascript: noticeDelete(<%= rs.getInt("NO_NUM") %>);">X</button></div>
				            </div>
				<% 
						}
						
					}catch(SQLException e){
						System.out.println("에러 로그:"+e.getMessage());
					}
        		%>
        				
        </div>
        	  <!-- 1-3. 글쓰기 버튼은 class="btn"로 <div>로 구역 설정 -->
       		  <div class="wr_btn">
              <a href="./noticeInsertForm.jsp">글쓰기</a>
        </div>
   	</div>
   	
  </section>
  	 <!-- footer -->
    <footer>
		<ul class="company_infojo">
			<li class="cInfo">주소: 회사 주소</li>
			<li class="cInfo">이메일: info@company.com</li>
			<li class="cInfo">전화번호: 123-456-7890</li>
    </ul>
   </footer>
  
  
    	
    <script>
    	function searchText() {
    		location.href = "./notice.jsp?search=" + $('#search-text').val();
    	}
    	
    	function noticeDelete(noticeNum) {
    		if (confirm('정말 삭제하시겠습니까?')) {
    			location.href = "./noticeDelete.jsp?num=" + noticeNum;
    		}
    	}
    </script>
        	
       

</body>
</html>