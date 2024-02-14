<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	<!-- reset.css 연결 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
	<!-- bomSample.css 연결 -->
	<link rel="stylesheet" href="./css/bomSample.css" />
	
	<!-- google font & google material icon -->
  <!-- Google 나눔고딕 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" />
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	
	<!-- Google material 아이콘 -->
  <!-- 아이콘을 이미지가 아닌, 폰트처럼 사용 가능함 -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  
	<!-- jQuery 연결 -->
	<script defer src="./js/jquery-3.7.1.min.js"></script>
	<script defer src="./js/readBom.js"></script>
</head>
<body>
	<div class="formbold-main-wrapper">
  <!-- Author: FormBold Team -->
  <!-- Learn More: https://formbold.com -->
  <div class="formbold-form-wrapper">
    <form action="https://formbold.com/s/FORM_ID" method="POST">
        <div class="formbold-steps">
            <ul>
                <li class="formbold-step-menu1 active">
                    <span>1</span>
                    제품 등록
                </li>
                <li class="formbold-step-menu2">
                    <span>2</span>
                    재료 등록
                </li>
                <li class="formbold-step-menu3">
                    <span>3</span>
                    공급업체 등록
                </li>
                <li class="formbold-step-menu4">
                    <span>4</span>
                    Confirm
                </li>
            </ul>
        </div>
				
				<!-- 제품 등록 -->
        <div class="formbold-form-step-1 active">
          <div class="formbold-input-flex">
            <div>
                <label for="inputProdNm" class="formbold-form-label"> 제품명 </label>
                <input
                type="text"
                name="inputProdNm"
                placeholder="밀키트 제품명"
                id="inputProdNm"
                class="formbold-form-input"
                />
            </div>
            <div>
                <label for="inputProdDiv" class="formbold-form-label"> 제품 종류 </label>
                <input
                type="text"
                name="inputProdDiv"
                placeholder="국/탕/찌개"
                id="inputProdDiv"
                class="formbold-form-input"
                />
            </div>
          </div>
  
          <div class="formbold-input-flex">
              <div>
              	<label for="inputProdSpec" class="formbold-form-label">제품 규격</label>
              	<input
              	type="text"
              	name="inputProdSpec"
              	placeholder="2인"
              	id="inputProdSpec"
              	class="formbold-form-input"
              	/>
              </div>
              <div>
                  <label for="inputProdPrice" class="formbold-form-label"> 제품 가격 </label>
                  <input
                  type="email"
                  name="inputProdPrice"
                  placeholder="숫자만 입력할 것"
                  id="inputProdPrice"
                  class="formbold-form-input"
                  />
              </div>
          </div>
        </div>
				
				<!-- 재료 등록 -->
        <div class="formbold-form-step-2">
        	<div class="formbold-input-flex">
	          <div>
	              <label for="inputMatNm" class="formbold-form-label"> 재료명 </label>
	              <input
	              type="text"
	              name="inputMatNm"
	              placeholder="밀키트에 들어가는 재료명"
	              id="inputMatNm"
	              class="formbold-form-input"
	              />
	          </div>
	          <div>
	              <label for="inputProdDiv" class="formbold-form-label"> 재료 종류 </label>
	              <input
	              type="text"
	              name="inputProdDiv"
	              placeholder="국/탕/찌개"
	              id="inputProdDiv"
	              class="formbold-form-input"
	              />
	          </div>
          </div>
          
          <div class="formbold-input-flex">
	          <div>
	              <label for="inputMatNm" class="formbold-form-label"> 재료명 </label>
	              <input
	              type="text"
	              name="inputMatNm"
	              placeholder="밀키트에 들어가는 재료명"
	              id="inputMatNm"
	              class="formbold-form-input"
	              />
	          </div>
	          <div>
	              <label for="inputProdDiv" class="formbold-form-label"> 재료 종류 </label>
	              <input
	              type="text"
	              name="inputProdDiv"
	              placeholder="국/탕/찌개"
	              id="inputProdDiv"
	              class="formbold-form-input"
	              />
	          </div>
          </div>
          <!-- <div>
            <label for="message" class="formbold-form-label"> Message </label>
            <textarea
              rows="6"
              name="message"
              id="message"
              placeholder="Type your message"
              class="formbold-form-input"
            ></textarea>
          </div> -->
        </div>
        
        <!-- 공급업체 등록 -->
        <!-- 업체명, 연락처, 주소, 이메일, 판매목록 -->
        <div class="formbold-form-step-3">
          <div class="formbold-input-flex">
            <div>
                <label for="inputSupNm" class="formbold-form-label"> 업체명 </label>
                <input
                type="text"
                name="inputSupNm"
                placeholder="휴먼교육센터"
                id="inputSupNm"
                class="formbold-form-input"
                />
            </div>
            <div>
                <label for="inputSupContact" class="formbold-form-label"> 연락처 </label>
                <input
                type="tel"
                name="inputSupContact"
                placeholder="010-0000-0001"
                id="inputSupContact"
                class="formbold-form-input"
                />
            </div>
          </div>
  
          <div class="formbold-input-flex">
	          <div>
	              <label for="inputSubEmail" class="formbold-form-label"> 이메일 </label>
	              <input
	              type="email"
	              name="inputSubEmail"
	              placeholder="smile12@human.co.kr"
	              id="inputSubEmail"
	              class="formbold-form-input"
	              />
	          </div>
	          <div>
			         	<label for="inputSupAddress" class="formbold-form-label"> 주소 </label>
			         	<input
			         	type="text"
			         	name="inputSupAddress"
			         	placeholder="경기도 수원시 xx구 xx로"
			         	id="inputSupAddress"
			         	class="formbold-form-input"
			         	/>
	         	</div>
          </div>
          
          <div>
            <label for="inputSalesMatList" class="formbold-form-label"> 판매목록 </label>
            <textarea
              rows="6"
              name="inputSalesMatList"
              id="inputSalesMatList"
              placeholder="재료1, 재료2, 재료3 ..."
              class="formbold-form-input"
            ></textarea>
          </div>
          
        </div>

        <div class="formbold-form-step-4">
          <div class="formbold-form-confirm">
            <p>
              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.
            </p>

            <div>
              <button class="formbold-confirm-btn active">
                <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                <circle cx="11" cy="11" r="10.5" fill="white" stroke="#DDE3EC"/>
                <g clip-path="url(#clip0_1667_1314)">
                <path d="M9.83343 12.8509L15.1954 7.48828L16.0208 8.31311L9.83343 14.5005L6.12109 10.7882L6.94593 9.96336L9.83343 12.8509Z" fill="#536387"/>
                </g>
                <defs>
                <clipPath id="clip0_1667_1314">
                <rect width="14" height="14" fill="white" transform="translate(4 4)"/>
                </clipPath>
                </defs>
                </svg>
                Yes! I want it.
              </button>

              <button class="formbold-confirm-btn">
                <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                <circle cx="11" cy="11" r="10.5" fill="white" stroke="#DDE3EC"/>
                <g clip-path="url(#clip0_1667_1314)">
                <path d="M9.83343 12.8509L15.1954 7.48828L16.0208 8.31311L9.83343 14.5005L6.12109 10.7882L6.94593 9.96336L9.83343 12.8509Z" fill="#536387"/>
                </g>
                <defs>
                <clipPath id="clip0_1667_1314">
                <rect width="14" height="14" fill="white" transform="translate(4 4)"/>
                </clipPath>
                </defs>
                </svg>
                No! I don’t want it.
              </button>
            </div>
          </div>
        </div>
        
        

        <div class="formbold-form-btn-wrapper">
          <button class="formbold-back-btn">
            Back
          </button>

          <button class="formbold-btn">
              Next Step
              <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
              <g clip-path="url(#clip0_1675_1807)">
              <path d="M10.7814 7.33312L7.20541 3.75712L8.14808 2.81445L13.3334 7.99979L8.14808 13.1851L7.20541 12.2425L10.7814 8.66645H2.66675V7.33312H10.7814Z" fill="white"/>
              </g>
              <defs>
              <clipPath id="clip0_1675_1807">
              <rect width="16" height="16" fill="white"/>
              </clipPath>
              </defs>
              </svg>
          </button>
        </div>
    </form>
  </div>
</div>
<script>
  const stepMenuOne = document.querySelector('.formbold-step-menu1');
  const stepMenuTwo = document.querySelector('.formbold-step-menu2');
  const stepMenuThree = document.querySelector('.formbold-step-menu3');
  const stepMenuFour = document.querySelector('.formbold-step-menu4');

  const stepOne = document.querySelector('.formbold-form-step-1');
  const stepTwo = document.querySelector('.formbold-form-step-2');
  const stepThree = document.querySelector('.formbold-form-step-3');
  const stepFour = document.querySelector('.formbold-form-step-4');

  const formSubmitBtn = document.querySelector('.formbold-btn')
  const formBackBtn = document.querySelector('.formbold-back-btn')

  formSubmitBtn.addEventListener("click", function(event){
    event.preventDefault()
    if(stepMenuOne.className == 'formbold-step-menu1 active') {
        event.preventDefault()

        stepMenuOne.classList.remove('active')
        stepMenuTwo.classList.add('active')

        stepOne.classList.remove('active')
        stepTwo.classList.add('active')

        formBackBtn.classList.add('active')
        formBackBtn.addEventListener("click", function (event) {
          event.preventDefault()

          stepMenuOne.classList.add('active')
          stepMenuTwo.classList.remove('active')

          stepOne.classList.add('active')
          stepTwo.classList.remove('active')

          formBackBtn.classList.remove('active')

        })

      } else if(stepMenuTwo.className == 'formbold-step-menu2 active') {
        event.preventDefault()

        stepMenuTwo.classList.remove('active')
        stepMenuThree.classList.add('active')

        stepTwo.classList.remove('active')
        stepThree.classList.add('active')

        formBackBtn.addEventListener("click", function (event) {
          event.preventDefault()
					
          stepMenuOne.classList.remove('active')
          stepMenuTwo.classList.add('active')
          stepMenuThree.classList.remove('active')

          stepTwo.classList.add('active')
          stepThree.classList.remove('active')

          formBackBtn.classList.add('active')

        })
        
      } else if(stepMenuThree.className == 'formbold-step-menu3 active') {
    	  event.preventDefault()

        stepMenuThree.classList.remove('active')
        stepMenuFour.classList.add('active')

        stepThree.classList.remove('active')
        stepFour.classList.add('active')

        formBackBtn.classList.remove('active')
        formSubmitBtn.textContent = 'Submit'
        
        	formBackBtn.addEventListener("click", function (event) {
            event.preventDefault()
  					
            stepMenuOne.classList.remove('active')
            stepMenuTwo.classList.remove('active')
            stepMenuThree.classList.add('active')
            stepMenuFour.classList.remove('active')

            stepThree.classList.add('active')
            stepFour.classList.remove('active')

            formBackBtn.classList.add('active')
            formBackBtn.classList.remove('active')

          })
              
      } else if(stepMenuThree.className == 'formbold-step-menu4 active') {
        document.querySelector('form').submit()
      }
  })
    

  
</script>
</body>
</html>