<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Starbucks Korea Coffee</title>
  <!-- 파비콘 -->
  <link rel="icon" href="/resources/images/favicon.ico" />
  <!-- reset.css -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
  <!-- google font & google material icon -->
  <!-- Google 나눔고딕 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
  <!-- Google 매트리얼 아이콘 -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

  <link rel="stylesheet" href="/resources/css/main.css" />
  
  <script defer src="/resources/js/jquery-3.7.1.min.js"></script>
  <!-- lodash -->
  <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
  <!-- gsap -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js"></script>
  <!-- gsap_scrolltoplugin -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/ScrollToPlugin.min.js"></script>
  <!-- swiper -->
  <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
  <script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>

  <script defer src="/resources/js/main.js"></script>
</head>

<body>
  <header>
    <div class="inner">
      <!-- 로고 이미지 부분 -->
      <a href="/" class="logo">
        <img src="/resources/images/starbucks_logo.png" alt="starbucks_logo" />
      </a>

      <!-- 위에 있는 서브 메뉴 부분 -->
      <div class="sub-menu">
        <ul class="menu">
          <li>
            <a href="#">Sign In</a>
          </li>
          <li>
            <a href="#">My Starbucks</a>
          </li>
          <li>
            <a href="#">Customer & Service & Ideas</a>
          </li>
          <li>
            <a href="#">Find a Store</a>
          </li>
        </ul>
        <div class="search">
          <input type="text" />
          <span class="material-symbols-outlined">Search</span>
        </div>
      </div>

      <!-- 밑에 있는 메인 메뉴 부분 -->
      <ul class="main-menu">
        <li class="item">
          <div class="item__name">COFFEE</div>
          <div class="item__contents">
            <div class="contents__menu">
              <ul class="inner">
                <li>
                  <h4>커피</h4>
                  <ul>
                    <li>스타벅스 원두</li>
                    <li>스타벅스 비아</li>
                    <li>스타벅스 오리가미</li>
                  </ul>
                </li>
                <li>
                  <h4>에스프레소 음료</h4>
                  <ul>
                    <li>도피오</li>
                    <li>에스프레소 마키아또</li>
                    <li>아메리카노</li>
                    <li>마키아또</li>
                    <li>카푸치노</li>
                    <li>라떼</li>
                    <li>모카</li>
                    <li>리스트레또 비안코</li>
                  </ul>
                </li>
                <li>
                  <h4>커피 이야기</h4>
                  <ul>
                    <li>스타벅스 로스트 스팩트럼</li>
                    <li>최상의 아라비카 원두</li>
                    <li>한 잔의 커피가 완성되기까지</li>
                    <li>클로버® 커피 추출 시스템</li>
                  </ul>
                </li>
                <li>
                  <h4>최상의 커피를 즐기는 법</h4>
                  <ul>
                    <li>커피 프레스</li>
                    <li>푸어 오버</li>
                    <li>아이스 푸어 오버</li>
                    <li>커피 메이커</li>
                    <li>리저브를 매장에서 다양하게 즐기는 법</li>
                  </ul>
                </li>
              </ul>
            </div>
            <div class="contents__texture">
              <div class="inner">
                <h4>나와 어울리는 커피 찾기</h4>
                <p>스타벅스가 여러분에게 어울리는 커피를 찾아드립니다.</p>
                <h4>최상의 커피를 즐기는 법</h4>
                <p>여러가지 방법을 통해 다양한 풍미의 커피를 즐겨보세요.</p>
              </div>
            </div>
          </div>
        </li>
        <li class="item">
          <div class="item__name">MENU</div>
          <div class="item__contents">
            <div class="contents__menu">
              <ul class="inner">
                <li>
                  <h4>음료</h4>
                  <ul>
                    <li>콜드 브루</li>
                    <li>브루드 커피</li>
                    <li>에스프레소</li>
                    <li>프라푸치노</li>
                    <li>블렌디드 음료</li>
                    <li>스타벅스 피지오</li>
                    <li>티(티바나)</li>
                    <li>기타 제조 음료</li>
                    <li>스타벅스 주스(병음료)</li>
                  </ul>
                </li>
                <li>
                  <h4>푸드</h4>
                  <ul>
                    <li>베이커리</li>
                    <li>케익</li>
                    <li>샌드위치 & 샐러드</li>
                    <li>따뜻한 푸드</li>
                    <li>과일 & 요거트</li>
                    <li>스낵 & 미니 디저트</li>
                    <li>아이스크림</li>
                  </ul>
                </li>
                <li>
                  <h4>상품</h4>
                  <ul>
                    <li>머그</li>
                    <li>글라스</li>
                    <li>플라스틱 텀블러</li>
                    <li>스테인리스 텀블러</li>
                    <li>보온병</li>
                    <li>액세서리</li>
                    <li>커피 용품</li>
                    <li>패키지 티(티바나)</li>
                  </ul>
                </li>
                <li>
                  <h4>카드</h4>
                  <ul>
                    <li>실물카드</li>
                    <li>e-Gift 카드</li>
                  </ul>
                </li>
                <li>
                  <h4>메뉴 이야기</h4>
                  <ul>
                    <li>콜드 브루</li>
                    <li>스타벅스 티바나</li>
                  </ul>
                </li>
              </ul>
            </div>
            <div class="contents__texture">
              <div class="inner">
                <h4>스타벅스 티바나</h4>
                <p>다양한 찻잎과 향신료 등 개성있는 재료로 새로운 맛과 향의 티를 선보입니다.</p>
              </div>
            </div>
          </div>
        </li>
        <li class="item">
          <div class="item__name">STORE</div>
          <div class="item__contents">
            <div class="contents__menu">
              <ul class="inner">
                <li>
                  <h4>매장 찾기</h4>
                  <ul>
                    <li>퀵 검색</li>
                    <li>지역 검색</li>
                    <li>My 매장</li>
                  </ul>
                </li>
                <li>
                  <h4>매장 이야기</h4>
                  <ul>
                    <li>청담스타</li>
                    <li>티바나 인스파이어드 매장</li>
                    <li>파미에파크</li>
                  </ul>
                </li>
              </ul>
            </div>
            <div class="contents__texture">
              
            </div>
          </div>
        </li>
        <li class="item">
          <div class="item__name">RESPONSIBILITY</div>
          <div class="item__contents">
            <div class="contents__menu">

            </div>
            <div class="contents__texture">
              
            </div>
          </div>
        </li>
        <li class="item">
          <div class="item__name">MY STARBUCKS REWARDS</div>
          <div class="item__contents">
            <div class="contents__menu">

            </div>
            <div class="contents__texture">
              
            </div>
          </div>
        </li>
        <li class="item">
          <div class="item__name">WHAT'S NEW</div>
          <div class="item__contents">
            <div class="contents__menu">

            </div>
            <div class="contents__texture">
              
            </div>
          </div>
        </li>
      </ul>
    </div>

    <!-- badges -->
    <div class="badges">
      <div class="badge">
        <img src="/resources/images/badge1.jpg" alt="badge1" />
      </div>
      <div class="badge">
        <img src="/resources/images/badge2.jpg" alt="badge2" />
      </div>
    </div>
  </header>

  <!-- visual -->  
  <section class="visual">
    <div class="inner">
      <div class="title fade-in">
        <img src="/resources/images/visual_title.png" alt="starbucks delightful" />
        <a href="javascript:void(0);" class="btn btn--brown">자세히 보기</a>
      </div>
      <div class="fade-in">
        <img src="/resources/images/visual_cup1.png" alt="new oatmeal latte" class="cup1 image" />
        <img src="/resources/images/visual_cup1_text.png" alt="new oatmeal latte text" class="cup1 text" />
      </div>
      <div class="fade-in">
        <img src="/resources/images/visual_cup2.png" alt="new" class="cup2 image" />
        <img src="/resources/images/visual_cup2_text.png" alt="new text" class="cup2 text" />
      </div>
      <div class="fade-in">
        <img src="/resources/images/visual_spoon.png" alt="spoon" class="spoon"/>
      </div>
    </div>
  </section>

  <!-- notice -->
  <section class="notice">
    <!-- notice line -->
    <div class="notice-line">
      <div class="bg-left"></div>
      <div class="bg-right"></div>
      <div class="inner">
        <div class="inner__left">
          <h2>공지사항</h2>
          <div class="swiper-container">
            
          </div>
          <a href="/notice" class="notice-line__more">
            <span class="material-symbols-outlined">
              add_circle
            </span>
          </a>
        </div>

        <div class="inner__right">
          <h2>스타벅스 프로모션</h2>
          <div class="toggle-promotion">
            <span class="material-symbols-outlined">
              upload
            </span>
          </div>
        </div>
      </div>
    </div>

    <!-- 수평 슬라이드 promotion -->  
    <div class="promotion">
      <div class="swiper-container">
        <div class="swiper-wrapper">
          <div class="swiper-slide">
            <img src="./images/promotion_slide1.jpg" alt="promotion1" />
            <a href="javascript:void(0);" class="btn btn--promotion">자세히 보기</a>
          </div>
          <div class="swiper-slide">
            <img src="./images/promotion_slide2.jpg" alt="promotion2" />
            <a href="javascript:void(0);" class="btn btn--promotion">
              자세히 보기
            </a>
          </div>
          <div class="swiper-slide">
            <img src="./images/promotion_slide3.jpg" alt="promotion3" />
            <a href="javascript:void(0);" class="btn btn--promotion">자세히 보기</a>
          </div>
          <div class="swiper-slide">
            <img src="./images/promotion_slide4.jpg" alt="promotion4" />
            <a href="javascript:void(0);" class="btn btn--promotion">자세히 보기</a>
          </div>
          <div class="swiper-slide">
            <img src="./images/promotion_slide5.jpg" alt="promotion5" />
            <a href="javascript:void(0);" class="btn btn--promotion">자세히 보기</a>
          </div>
        </div>
      </div>
      <!-- If we need pagination -->
      <div class="swiper-pagination"></div>
      <!-- If we need navigation buttons -->
      <div class="swiper-prev">
        <span class="material-symbols-outlined">
          arrow_back
        </span>
      </div>
      <div class="swiper-next">
        <span class="material-symbols-outlined">
          arrow_forward
        </span>
      </div>
    </div>
  </section>

  <!-- Rewards -->
  <section class="rewards">

  </section>
  
</body>
</html>