function login() {
    // 로그인 로직을 여기에 추가
    // 백엔드와의 통신 등
    alert('로그인 성공');
}

// 필요한 기능에 따라 추가적인 JavaScript 코드 작성

//공지사항 
function searchText_jo() {
    		location.href = "./adminNoticeList.jsp?search=" + $('#search_text_jo').val();
    	}
function noticeDelete(noticeNum) {
 	if (confirm('정말 삭제하시겠습니까?')) {
        location.href = "./adminNoticeDelete.jsp?num=" + noticeNum;
    	}
    }
    
// inputbox 포커스를 잃을 때
$('input').blur(function() {
  $('input .main__search').attr('placeholder', '');
});


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