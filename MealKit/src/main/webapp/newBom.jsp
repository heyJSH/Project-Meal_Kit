<%@page import="dto.BomListVo"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="dto.MaterialVo"%>
<%@page import="java.security.interfaces.RSAKey"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!-- DB와 연결 -->
<%@ page import="utils.DBManager" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.lang.Exception, java.sql.SQLException" %>
<!-- 부트스트랩 연결 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<!-- reset.css 연결 -->
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
<!-- newBom.css 연결 -->
<link rel="stylesheet" href="./css/newBom.css" />

<script defer src="./js/insertBom.js"></script>
	
<div class="formbold-main-wrapper">
  <!-- Author: FormBold Team -->
  <!-- Learn More: https://formbold.com -->
  <div class="formbold-form-wrapper" >
    <form action="https://formbold.com/s/FORM_ID" method="POST" onsubmit="return false;">
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
        	<div class="inputProdInfo infoTitle">제품 등록</div>
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
        	<!-- 입력한 제품 정보 확인하면서 재료 등록 -->
        	<div class="watchProdInfo">
	        	<div class="watchProdInfo infoTitle">입력한 제품 정보</div>
	        	<div class="formbold-input-flex">
	        	 <div>
	        	 	<label for="watchProdNm" class="formbold-form-label">제품명</label>
	        	 	<input
	        	 		type="text"
	        	 		name="watchProdNm"
	        	 		placeholder="제품명"
	        	 		id="watchProdNm"
	        	 		class="formbold-form-input"
	        	 		readonly
	        	 	/>
	        	 </div>
	        	 <div>
	        	 	<label for="watchProdDiv" class="formbold-form-label">제품 종류</label>
	        	 	<input
	        	 		type="text"
	        	 		name="watchProdDiv"
	        	 		placeholder="국/탕/찌개"
	        	 		id="watchProdDiv"
	        	 		class="formbold-form-input"
	        	 		readonly
	        	 	/>
	        	 </div>
	        	 <div>
	        	 	<label for="watchProdSpec" class="formbold-form-label">제품 규격</label>
	        	 	<input
	        	 		type="text"
	        	 		name="watchProdSpec"
	        	 		placeholder="2인"
	        	 		id="watchProdSpec"
	        	 		class="formbold-form-input"
	        	 		readonly
	        	 	/>
	        	 </div>
	        	 <div>
	        	 	<label for="watchProdPrice" class="formbold-form-label">제품 가격</label>
	        	 	<input
	        	 		type="text"
	        	 		name="watchProdPrice"
	        	 		placeholder="8,900원"
	        	 		id="watchProdPrice"
	        	 		class="formbold-form-input"
	        	 		readonly
	        	 	/>
	        	 </div>
	        	</div>
	        </div>
	        
	        <!-- 재료 목록 -->
	        <div class="newMatLists">
	       		<div class="MatListTitle">재료 목록</div>
	       		<table class="table newMatTable">
						  <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col">재료명</th>
						      <th scope="col">종류</th>
						      <th scope="col">수량</th>
						      <th scope="col">단위</th>
						    </tr>
						  </thead>
						  <tbody>
						    <!-- 입력한 데이터 추가 -->
						    
						    
						  </tbody>
						</table>
	        </div>
        	
        	<!-- 재료 등록 Form -->
        	<div class="inputMatInfo">
        		<div class="inputMatInfo infoTitle">재료 등록</div>
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
		              <label for="inputMatDiv" class="formbold-form-label"> 종류 </label>
		              <input
		              type="text"
		              name="inputMatDiv"
		              placeholder="재료 or 포장재"
		              id="inputMatDiv"
		              class="formbold-form-input"
		              />
		          </div>
	          </div>
	          
	          <div class="formbold-input-flex">
		          <div>
		              <label for="inputMatQuantityForBom" class="formbold-form-label"> 수량 </label>
		              <input
		              type="text"
		              name="inputMatQuantityForBom"
		              placeholder="1ea 생산 시 필요한 수량"
		              id="inputMatQuantityForBom"
		              class="formbold-form-input"
		              />
		          </div>
		          <div>
		              <label for="inputMatUnitsForBom" class="formbold-form-label"> 단위 </label>
		              <input
		              type="text"
		              name="inputMatUnitsForBom"
		              placeholder="kg, EA 등"
		              id="inputMatUnitsForBom"
		              class="formbold-form-input"
		              />
		          </div>
	          </div>
	      	</div>
        </div>
        
        <!-- 공급업체 등록 -->
        <!-- 업체명, 연락처, 주소, 이메일, 판매목록 -->
        <div class="formbold-form-step-3">
        	<!-- 재료 목록 -->
	        <div class="newMatLists">
	       		<div class="MatListTitle">재료 목록</div>
	       		<table class="table matTable">
						  <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col">재료명</th>
						      <th scope="col">종류</th>
						      <th scope="col">수량</th>
						      <th scope="col">단위</th>
						    </tr>
						  </thead>
						  <tbody>
						  	<!-- 입력한 데이터 추가 -->
						  
						  </tbody>
						</table>
	        </div>
	        
	        <!-- 업체 등록 Form -->
	        <div class="inputSupInfo">
		        <div class="inputSupInfo infoTitle">공급업체 등록</div>
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
          
        </div>

        <div class="formbold-form-step-4">
          <div class="formbold-form-confirm">
          	
            <p>
              BOM 목록을 등록하시겠습니까?
            </p>

            <div>
              <button class="formbold-confirm-btn active allConfirmBtn" id="allConfirmBtn">
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
                동의
              </button>

              <button class="formbold-confirm-btn allDenyBtn" id="allDenyBtn">
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
                비동의
              </button>
              <!-- hidden Form -->
              
            </div>
          </div>
        </div>
				
        <div class="formbold-form-btn-wrapper">
        	<!-- 뒤로 가기 btn -->
          <button class="formbold-back-btn">
            Back
          </button>
					
					<!-- form2에서만 사용하는 "재료 추가용 버튼" -->
          <button class="formbold-plusMat-btn" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
          <!-- <button class="formbold-plusMat-btn"> -->
          	재료 추가
          	<span class="material-symbols-outlined">
							add_circle
						</span>
          </button>
          
          <!-- 재료 추가 확인용 모달 -->
          <!-- Modal -->
					<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="staticBackdropLabel">재료 등록</h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        재료를 등록하시겠습니까?
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					        <button type="button" class="btn btn-primary newMaterialConfirm" data-bs-dismiss="modal" onclick="javascript: showNewMatList();">확인</button>
					      </div>
					    </div>
					  </div>
					</div>
					
					<!-- form3에서만 사용하는 "업체 추가용 버튼" -->
          <button class="formbold-plusSup-btn" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">
          	업체 추가
          	<span class="material-symbols-outlined">
							add_circle
						</span>
          </button>
          
          <!-- 재료 추가 확인용 모달 -->
          <!-- Modal -->
					<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="staticBackdropLabel">업체 등록</h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        업체를 등록하시겠습니까?
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					        <button type="button" class="btn btn-primary newSupplierConfirm" data-bs-dismiss="modal" onclick="javascript: showNewSupList();">확인</button>
					      </div>
					    </div>
					  </div>
					</div>
          
					<!-- 다음 btn -->
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
        <!-- 공급업체 목록 -->
        <div class="newSupLists">
       		<div class="SupListTitle">공급업체 목록</div>
       		<table class="table newSupTable">
					  <thead>
					    <tr>
					      <th scope="col">#</th>
					      <th scope="col">업체명</th>
					      <th scope="col">연락처</th>
					      <th scope="col">이메일</th>
					      <th scope="col">주소</th>
					      <th scope="col">판매목록</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					    	<!-- 입력한 데이터 추가 -->
					    
					    </tr>
					  </tbody>
					</table>
        </div>
        
    </form>
  </div>
</div>