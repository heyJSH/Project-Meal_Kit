// 각 단계의 메뉴와 폼을 배열로 저장
const stepMenus = [
  document.querySelector('.formbold-step-menu1'),
  document.querySelector('.formbold-step-menu2'),
  document.querySelector('.formbold-step-menu3'),
  document.querySelector('.formbold-step-menu4')
];

const formSteps = [
  document.querySelector('.formbold-form-step-1'),
  document.querySelector('.formbold-form-step-2'),
  document.querySelector('.formbold-form-step-3'),
  document.querySelector('.formbold-form-step-4')
];

const formSubmitBtn = document.querySelector('.formbold-btn');
const formBackBtn = document.querySelector('.formbold-back-btn');

// 각 단계를 활성화시키는 함수
function activateStep(currentIndex, nextIndex) {
  stepMenus[currentIndex].classList.remove('active');
  stepMenus[nextIndex].classList.add('active');
  formSteps[currentIndex].classList.remove('active');
  formSteps[nextIndex].classList.add('active');
}

// "다음" 버튼 클릭 시 실행되는 함수
formSubmitBtn.addEventListener("click", function(event){
  event.preventDefault();

  // 현재 활성화된 메뉴에 따라 작동여부 설정
  if(stepMenus[0].classList.contains('active')) {
    // 첫 번째 단계에서 두 번째 단계로 이동
    activateStep(0, 1);
    formBackBtn.classList.add('active'); // 뒤로 가기 버튼 활성화
  } else if(stepMenus[1].classList.contains('active')) {
    // 두 번째 단계에서 세 번째 단계로 이동
    activateStep(1, 2);
  } else if(stepMenus[2].classList.contains('active')) {
    // 세 번째 단계에서 네 번째 단계로 이동
    activateStep(2, 3);
    formBackBtn.classList.remove('active'); // 뒤로 가기 버튼 비활성화
    formSubmitBtn.textContent = 'Submit'; // "다음" 버튼 텍스트 변경
  } else if(stepMenus[3].classList.contains('active')) {
    // 네 번째 단계에서 폼 제출
    document.querySelector('form').submit();
  }
});

// "뒤로" 버튼 클릭 시 실행되는 함수
formBackBtn.addEventListener("click", function(event){
  event.preventDefault();

  // 현재 활성화된 메뉴에 따라 이전 단계로 이동
  for (let i = 1; i < stepMenus.length; i++) {
    if (stepMenus[i].classList.contains('active')) {
      activateStep(i, i - 1);
      break;
    }
  }

  // 첫 번째 단계에서는 뒤로 가기 버튼 비활성화
  if (stepMenus[0].classList.contains('active')) {
    formBackBtn.classList.remove('active');
  }
});