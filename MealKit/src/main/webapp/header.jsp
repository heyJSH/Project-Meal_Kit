<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키트 관리 시스템</title>
	<!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	
	<!-- reset.css 연결 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
	<!-- main.css 연결 -->
	<link rel="stylesheet" href="./css/main.css" />
	
</head>
<body>	

	<header>
		<div class="inner">
			<!-- 로고 이미지 -->
			<a href="./index.jsp" class="logo">
				<img src="./css/images/logo.png" alt="starbucks_logo">
			</a>
			
			<!-- 위에 있는 서브 메뉴 부분 -->
			<div class="sub-menu">
				<ul class="menu">
					<li>
						<!-- 마이페이지 링크 연결할 것 -->
						<a href="./myPage.jsp">My Page</a>	
					</li>
					<li>
						<!-- 로그아웃 링크 연결할 것 -->
						<a href="./logout.jsp">Log Out</a>
					</li>
				</ul>
			</div>
			
		<!-- 밑에 있는 서브 메뉴 부분 -->
		<ul class="main-menu">
		<% String depNm = (String)session.getAttribute("depNm"); %>
			
		<!-- 재고 현황은 여기서 수정할 것 -->
		<!-- 재고현황 메뉴는 모든 부서가 접근 가능 -->
   	 	<% if("관리팀".equals(depNm) || "구매팀".equals(depNm) || "생산팀".equals(depNm) || "영업팀".equals(depNm)) { %>
        <li class="item">
          <div class="item__name">재고현황</div>
          <div class="item__contents">
            <div class="contents__menu">
              <ul class="inner">
                <li>
                  <h4><a href="./inventoryStatus.jsp">재고 현황</a></h4>
                </li>
              </ul>
            </div>
          </div>
        </li>
          <% } %>
          
        <!-- 구매관리는 여기서 수정할 것 -->
        <!-- 구매관리 메뉴, 구매팀과 관리팀만 접근 가능 -->
   	    <% if("구매팀".equals(depNm) || "관리팀".equals(depNm)) { %>
        <li class="item">
          <div class="item__name">구매관리</div>
          <div class="item__contents">
            <div class="contents__menu">
              <ul class="inner">
                <li>
                  <h4>원자재 DB관리</h4>
                  <ul>
                    <li>
                    	<a href="./modifymaterial.jsp">원자재</a>
                    </li>
                    <li>
                    	<a href="./modifysup.jsp">구매 업체</a>
                    </li>
                  </ul>
                </li>
                <li>
                  <h4>원자재 구매</h4>
                  <ul>
                    <li>
                    	<a href="./firstFinal.jsp">구매</a>
                    </li>
                  </ul>
                </li>
                <li>
                  <h4>계약 현황</h4>
                  <ul>
                    <li>
                    	<a href="./showingPurchase.jsp">계약 현황</a>
                    </li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </li>
        <% } %> 
        
        <!-- 제조관리 수정은 여기서 할 것 -->
        <!-- 제조관리 메뉴, 생산팀과 관리팀만 접근 가능 -->
        <% if("생산팀".equals(depNm) || "관리팀".equals(depNm)) { %>
        <li class="item">
          <div class="item__name">제조관리</div>
          <div class="item__contents">
            <div class="contents__menu">
              <ul class="inner">
                <li>
                  <h4>BOM</h4>
                  <ul>
                    <li>
                    	<a href="./BomList.jsp">BOM 현황</a>
                    </li>
                    <li>
                    	<a href="./bomInsertForm.jsp">BOM 등록</a>
                    </li>
                  </ul>
                </li>
                <li>
                  <h4>제조 관리</h4>
                  <ul>
                    <li>
                    	<a href="./instruction.jsp">제조 지시</a>
                    </li>
                    <li>
                    	<a href="./manufacturing.jsp">제조 수행</a>
                    </li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </li>
        <% } %>
        
        
        <!-- 판매 관리는 여기서 수정할 것 -->
        <!-- 판매관리 메뉴, 영업팀과 관리팀만 접근 가능 -->
        <% if("영업팀".equals(depNm) || "관리팀".equals(depNm)) { %>
        <li class="item">
          <div class="item__name">판매관리</div>
          <div class="item__contents">
            <div class="contents__menu">
              <ul class="inner">
                <li>
                  <h4>Sales order</h4>
                  <ul>
                    <li>
                    	<a href="./salesOrder_main.jsp">주문서 메인</a>
                    </li>
                    <li>
                    	<a href="./salesOrder_insertForm.jsp">주문서 작성</a>
                    </li>
                  </ul>
                </li>
                <li>
                  <h4>주문서 조회</h4>
                  <ul>
                    <li>
                    	<a href="./salesOrder_select.jsp">조회화면</a>
                    </li>
                    <li>
                    	<a href="./salesOrder_updateForm.jsp">주문서 수정</a>
                    </li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </li>
        <% } %> 
			</ul>
		</div>
  </header>
</body>
</html>