<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="utils.DBConfig"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">    
    <title>공지사항</title>
    <link rel="stylesheet" href="css/reset.css">  
    <link rel="icon" href="images/favicon.ico">
    <script defer src="js/jquery-3.7.1.min.js"></script>
    <script defer src="js/main.js"></script>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/notice.css">
    
  </head>
<body>

<%@ include file="header.jsp" %>	
	
<%
	String searchText = request.getParameter("search") == null ? "" : request.getParameter("search");
%>	
	<section class ="inner_jo">
	  <div class="inner sub_tit_wrap">
		  <div class="sub_tit_inner">
	      <h2><img src="https://www.starbucks.co.kr/common/img/whatsnew/notice_tit.jpg" alt="공지사항"></h2>
		  </div>
		  <div class="news_sch_wrap">
	    <div class="sch_items">
	        <input type="search" name="sch_bar" id="sch_bar" placeholder="검색어를 입력해 주세요. " value="<%= searchText %>">
	        <!-- 검색 버튼 클릭 시 searchText 함수 호출 -->
	        <button type="button" onclick="searchText();">검색</button>
	    </div>
      </div>
	 </div>
  </section>
  
 <% 
    int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
    int pageSize = 5;
    int totalRecordCount = 0;
    int totalPage = 0;
    int start = (currentPage - 1) * pageSize + 1;
    int end = currentPage * pageSize;
 %>

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
        try {
            Connection conn = DBConfig.getConnection();
            // 전체 레코드 수를 구하는 쿼리
            String sqlTotalCount = "SELECT COUNT(*) AS total FROM NOTICE WHERE TITLE LIKE ?";
            PreparedStatement pstmtTotalCount = conn.prepareStatement(sqlTotalCount);
            pstmtTotalCount.setString(1, "%" + searchText + "%");
            ResultSet rsTotalCount = pstmtTotalCount.executeQuery();
            
            if(rsTotalCount.next()) {
                totalRecordCount = rsTotalCount.getInt("total");
                totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);
            }

            // 페이징 처리 쿼리 
            String sql = "SELECT * FROM ( SELECT row_.*, ROWNUM rownum_ FROM ( SELECT * FROM NOTICE WHERE TITLE LIKE ? ORDER BY NO_NUM DESC ) row_ ) WHERE rownum_ >= ? AND rownum_ <= ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + searchText + "%");
            pstmt.setInt(2, start);
            pstmt.setInt(3, end);
            ResultSet rs = pstmt.executeQuery();

            while(rs.next()) {
%>			
			<div class="content-box">
				 <div class ="jo_num"><%= rs.getInt("NO_NUM") %></div>
				 <div class="title_no"><a href="./noticeView.jsp?num=<%= rs.getInt("NO_NUM") %>"><%= rs.getString("TITLE") %></a></div>
				 <div class ="jo_date"><%= rs.getDate("REGDATE") %></div>
				 <div class ="jo_hit"><%= rs.getInt("HIT") %></div>
			</div>
<% 
            }
            rs.close();
            pstmt.close();
            conn.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
 %>
        		
 <!-- 페이징 버튼 구현 -->
 <div class="paging">
    <% if(currentPage > 1) { %>
        <a href="notice.jsp?page=1&search=<%=searchText%>">[처음]</a>
        <a href="notice.jsp?page=<%=currentPage-1%>&search=<%=searchText%>">[이전]</a>
    <% } else { %>
        <!-- '처음'과 '이전' 버튼이 비활성화된 상태로 표시될 수 있도록 처리-->
        <span>[처음]</span>
        <span>[이전]</span>
    <% } %>
    
    <% for(int i=1; i<=totalPage; i++) { %>
        <% if(i == currentPage) { %>
            <b><%=i%></b>
        <% } else { %>
            <a href="notice.jsp?page=<%=i%>&search=<%=searchText%>"><%=i%></a>
        <% } %>
    <% } %>
    
    <% if(currentPage < totalPage) { %>
        <a href="notice.jsp?page=<%=currentPage+1%>&search=<%=searchText%>">[다음]</a>
        <a href="notice.jsp?page=<%=totalPage%>&search=<%=searchText%>">[마지막]</a>
    <% } else { %>
        <!-- '다음'과 '마지막' 버튼이 비활성화된 상태로 표시될 수 있도록 처리-->
        <span>[다음]</span>
        <span>[마지막]</span>
    <% } %>
</div>

        </div>
        	  <!-- 글쓰기 버튼은 class="btn"로 <div>로 구역 설정 -->
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
    	 // 검색 버튼 클릭 시 실행되는 함수
        function searchText() {
            // 사용자가 입력한 검색어를 가져옴
            var searchQuery = $('#sch_bar').val();
            // 검색어를 포함하여 현재 페이지를 요청
            location.href = "./notice.jsp?search=" + encodeURIComponent(searchQuery);
        } 	
    </script>
        	
       

</body>
</html>