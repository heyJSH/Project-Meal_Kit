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
			<!-- 로고 이미지 수정할 것 -->
			<a href="./index.jsp" class="logo">
				<img src="./css/images/logo.png" alt="starbucks_logo">
			</a>
			
			<!-- 위에 있는 서브 메뉴 부분 -->
			<div class="sub-menu">
				<ul class="menu">
					<li>
						<!-- 마이페이지 링크 연결할 것 -->
						<a href="#">My Page</a>	
					</li>
					<li>
						<!-- 로그아웃 링크 연결할 것 -->
						<a href="./login.jsp">Log Out</a>
					</li>
				</ul>
			</div>
			
			<!-- 밑에 있는 서브 메뉴 부분 -->
			<ul class="main-menu">
			
				<!-- 재고 현황은 여기서 수정할 것 -->
        <li class="item">
          <div class="item__name">재고현황</div>
          <div class="item__contents">
            <div class="contents__menu">
              <ul class="inner">
                <li>
                  <h4>재고현황 메뉴1</h4>
                  <ul>
                    <li>
                    	<a href="#">서브메뉴1</a>
                    </li>
                    <li>
                    	<a href="#">서브메뉴2</a>
                    </li>
                  </ul>
                </li>
                <li>
                  <h4>재고현황 메뉴2</h4>
                  <ul>
                  	<li>
                    	<a href="#">서브메뉴1</a>
                    </li>
                    <li>
                    	<a href="#">서브메뉴2</a>
                    </li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </li>
        <!-- 구매관리는 여기서 수정할 것 -->
        <li class="item">
          <div class="item__name">구매관리</div>
          <div class="item__contents">
            <div class="contents__menu">
              <ul class="inner">
                <li>
                  <h4>전체 재고</h4>
                  <ul>
                    <li>
                    	<a href="#">서브메뉴1</a>
                    </li>
                    <li>
                    	<a href="#">서브메뉴2</a>
                    </li>
                  </ul>
                </li>
                <li>
                  <h4>자재 구매</h4>
                  <ul>
                    <li>
                    	<a href="#">서브메뉴1</a>
                    </li>
                    <li>
                    	<a href="#">서브메뉴2</a>
                    </li>
                  </ul>
                </li>
                <li>
                  <h4>계약 현황</h4>
                  <ul>
                    <li>
                    	<a href="#">서브메뉴1</a>
                    </li>
                    <li>
                    	<a href="#">서브메뉴2</a>
                    </li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </li>
        
        <!-- 제조관리 수정은 여기서 할 것 -->
        <li class="item">
          <div class="item__name">제조관리</div>
          <div class="item__contents">
            <div class="contents__menu">
              <ul class="inner">
                <li>
                  <h4>BOM</h4>
                  <ul>
                    <li>
                    	<a href="#">서브메뉴1</a>
                    </li>
                    <li>
                    	<a href="#">서브메뉴2</a>
                    </li>
                  </ul>
                </li>
                <li>
                  <h4>제조관리 메뉴2</h4>
                  <ul>
                    <li>
                    	<a href="#">서브메뉴1</a>
                    </li>
                    <li>
                    	<a href="#">서브메뉴2</a>
                    </li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </li>
        
        
        <!-- 판매 관리는 여기서 수정할 것 -->
        <li class="item">
          <div class="item__name">판매관리</div>
          <div class="item__contents">
            <div class="contents__menu">
              <ul class="inner">
                <li>
                  <h4>판매관리 메뉴1</h4>
                  <ul>
                    <li>
                    	<a href="#">서브메뉴1</a>
                    </li>
                    <li>
                    	<a href="#">서브메뉴2</a>
                    </li>
                  </ul>
                </li>
                <li>
                  <h4>판매관리 메뉴2</h4>
                  <ul>
                    <li>
                    	<a href="#">서브메뉴1</a>
                    </li>
                    <li>
                    	<a href="#">서브메뉴2</a>
                    </li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </li>
            
			</ul>
		</div>
  </header>
</body>
</html>