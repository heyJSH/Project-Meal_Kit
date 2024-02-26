/*
// vanilla js
const searchEl = document.querySelector('.search');
const searchInputEl = document.querySelector('input');

// input과 돋보기 아이콘을 클릭했을 때
searchEl.addEventListener('click', function() {
  searchInputEl.focus();
});
// inputbox 포커스가 될 때
searchInputEl.addEventListener('focus', function() {
  searchInputEl.setAttribute('placeholder', '통합검색');
});
// inputbox 포커스를 잃을 때
searchInputEl.addEventListener('blur', function() {
  searchInputEl.setAttribute('placeholder', '');
});
*/

// jquery js
// input과 돋보기 아이콘을 클릭했을 때
$('.search').click(function() {
  $('input .main__search').focus();
});
// inputbox 포커스가 될 때
$('input').focus(function() {
  $('input .main__search').attr('placeholder', '통합검색');
});
// inputbox 포커스를 잃을 때
$('input').blur(function() {
  $('input .main__search').attr('placeholder', '');
});

window.addEventListener('scroll', _.throttle(function () {
  console.log(window.scrollY);
  if (window.scrollY > 500) {
    // 배지 숨기기
    //$('.badges').hide();
    //gsap.to(요소, 지속시간, 옵션)
    gsap.to('header .badges', 0.4, {
      opacity: 0
    });
  } else {
    // 배지 보이기
    //$('.badges').show();
    gsap.to('header .badges', 0.4, {
      opacity: 1
    });
  }
}, 300)); // 0.3초

// visual 애니메이션
const fadeEls = document.querySelectorAll('.visual .fade-in');
fadeEls.forEach(function (value, index) {
  console.log('index: ' + index, value);
  
  //gsap.to(요소, 지속시간, 옵션)
  gsap.to(value, 1, {
    delay: (index + 1) * 0.7, // 0.7 1.4 2.1 2.8
    opacity: 1,
  })
});

// notice swpier rolling
new Swiper('.notice-line .swiper-container', {
  // Optional parameters
  direction: 'vertical',
  loop: true, // 반복재생여부
  autoplay: {
    delay: 2000,  // 단위는 ms
  }
});
// promotion swpier rolling
new Swiper('.promotion .swiper-container', {
  slidesPerView: 3, // 한번 보여줄 슬라이드 개수
  spaceBetween: 10, // 슬라이드 사이 여백
  centeredSlides: true, // 1번 슬라이드가 가운개 보이기
  autoplay: { // 자동재생여부
    delay: 3000,  // 3초마다 슬라이드 바뀜
  },
  loop: true,
  pagination: {   // 페이지 번호 사용 
    el: '.promotion .swiper-pagination', // 페이지 번호 요소 선택자
    clickable: true,  // 페이지 번호 클릭 제어 가능
  },
  navigation: {   // 슬라이드 이전/다음 버튼 사용
    prevEl: '.promotion .swiper-prev',
    nextEl: '.promotion .swiper-next',
  }
});

// vanills js
// promotion 슬라이드 토글 기능
/*
const promotionEl = document.querySelector('.promotion');
const promotionToggleBtn = document.querySelector('.toggle-promotion');
let isHidePromotion = false;
promotionToggleBtn.addEventListener('click', function() {
  isHidePromotion = !isHidePromotion

  if (isHidePromotion) {
    // 숨김 처리
    promotionEl.classList.add('hide');
  } else {
    // 보임 처리
    promotionEl.classList.remove('hide');
  }
});
*/

// jquery js
// promotion 슬라이드 토글 기능
let isHidePromotion = false;
$('.toggle-promotion').click(function() {
  isHidePromotion = !isHidePromotion

  if (isHidePromotion) {
    // 숨김 처리
    $('.promotion').attr('class', 'promotion hide');
  } else {
    // 보임 처리
    $('.promotion').attr('class', 'promotion');
  }
});