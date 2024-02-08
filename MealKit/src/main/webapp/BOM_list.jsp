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

<!DOCTYPE html>
<!-- java 연결 -->
<%@ page import = "dao.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>밀키트 관리 시스템</title>
	<!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	<!-- reset.css 연결 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
	<!-- main.css 연결 -->
	<link rel="stylesheet" href="./css/main.css" />
	<!-- bomList.css 연결 -->
	<link rel="stylesheet" href="./css/bomList.css" />
	
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
	<!-- header 공통 부분 연결 -->
	<%@ include file="header.jsp" %>
	
	<!-- ============================================================================== -->
<%
	/* JSP에서는 DB 연결하는 코드를 입력했으나, 
	utils에 java 파일 만들었으니, 그것을 사용할 것 */
	/* 메소드도 만들어서 그 파일을 사용해볼 것 */
	/* 키워드 검색 순서
		1. DB 접속 => java - utils폴더 - DBManager.java 사용
		2. user가 키워드를 선택 후, 검색 icon을 누르면 그 값과 동일한 목록을 조회해야 함
			1) 제품코드, 제품명, 재료코드, 재료명 中 1개라도 있어야 select 함
			2) 4가지 모두 선택하지 않았을 때, icon 누르면 alert('선택된 키워드가 없습니다.');
			3) 2개 이상 선택하면, && 조건으로 조회 가능하도록 할 것
			4) 위의 조건에 해당하지 않지만, 검색된 결과가 없는 경우,
				 alert('검색된 결과가 없습니다.');
	*/
	
	// 완제품 객체 생성
	Prod_select prod_s = new Prod_select();
	List<String> prod_nms = prod_s.getProd_nm();
	List<String> prod_divs = prod_s.getProd_div();
	
	// 자재(재료) 객체 생성
	Material_select mat_s = new Material_select();
	List<String> mat_nms = mat_s.getMat_nm();
%>
	<!-- BOM 현황 -->
	<section>
		<div class="main_wrap">
			<div class="blank"></div>
			<!-- 제품 검색 -->
			<div class="inner search_container">
				<div class="BOM_list_tit">
					<h1>BOM 현황</h1>
				</div>
				<div class="search_header">
					<div class="search_header search_tit">
						<div class="search_tit search_detail_tit">
							제품검색
						</div>
						<div class="search_tit search">
							<span class="material-symbols-outlined">
								<!-- ★★★ # 에 검색 메소드 연결할 것 -->
								<a href="#">Search</a>
							</span>
						</div>
					</div>
					<div class="search_header search_body">
						<div class="search_body prodNm_search">
							<h3>제품명</h3>
							<!-- ★★★ value에 검색값 링크할 것★★★ -->
							<form class="select-prod_nm">
								<select class="form-select" aria-label="Default select example">
								  <option selected>제품명 선택</option>
<% 
	for(String prod_nm : prod_nms) {
		
%>
									  <option value="<%= prod_nm %>">
											<%= prod_nm %>
										</option>
<%
	}
%>						  	
									</select>
								</form>
						</div>
						<div class="search_body prodSpec_search">
							<h3>제품구분</h3>
							<form class="select-prod_div">
								<select class="form-select" aria-label="Default select example" name="prod_div" id="prod_div" class="prod_div" onchange="ch_prodDiv()">
								  <option selected>제품구분 선택</option>
<%
	for(String prod_div : prod_divs) {

%>
								  <option value="<%= prod_div %>">
								  	<%= prod_div %>
								  </option>
<%
	}
%>
								</select>
							</form>
						</div>
						<div class="search_body matNm_search">
							<h3>재료명</h3>
							<form class="select-mat_nm">
								<select class="form-select" aria-label="Default select example">
								  <option selected>재료명 선택</option>
<%
	for(String material_nm : mat_nms) {
		
%>
								  <option value="<%= material_nm %>">
								  	<%= material_nm %>
<%
	}
%>
							  	</option>
								</select>
							</form>
						</div>
					</div>
				</div>
			</div>
			
			<!-- BOM 목록 -->
			<div class="inner list_container">
				<div class="inner BOM_list">
					<div class="BOM_list bom_delete">
						<!-- ★★★ #에 삭제 메소드 링크할 것 -->
						<a href="#">
							<button type="button" class="btn btn-secondary btn-sm btn-delete">삭제</button>
						</a>
					</div>
					<div class="BOM_list list_box">
						<table class="table">
						  <thead class="table-dark">
						    <tr>
						    	<th>
						    		<div class="form-check">
										  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
										  <label class="form-check-label" for="flexCheckDefault"></label>
										</div>
						    	</th>
						    	<th>#</th>
						    	<th>BOM코드</th>
						    	<th>제품코드</th>
						    	<th>제품명</th>
						    	<th>종류</th>
						    	<th>규격</th>
						    	<th>LOT사이즈</th>
						    	<th>구분</th>
						    	<th>재료코드</th>
						    	<th>재료명</th>
						    	<th>단위</th>
						    	<th>수량</th>
						    	<th>수정</th>
						    </tr>
						  </thead>
<%
//BOM 현황 객체 생성
	BomDao bDao = new BomDao();
	List<BomListVo> lists = bDao.selectBomAll();
	for(BomListVo list : lists) {
%>
						  <tbody>
						  	<tr>
						    	<th>
						    		<div class="form-check">
										  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
										  <label class="form-check-label" for="flexCheckDefault"></label>
										</div>
						    	</th>
						    	<th><%= list.getList_seq() %></th>
						    	<th><%= list.getBom_id() %></th>
						    	<th><%= list.getProduct_id() %></th>
						    	<th><%= list.getProduct_nm() %></th>
						    	<th><%= list.getProduct_div() %></th>
						    	<th><%= list.getProduct_spec() %></th>
						    	<th><%= list.getLot_size() %></th>
						    	<th><%= list.getMaterial_classification() %></th>
						    	<th><%= list.getMaterial_id() %></th>
						    	<th><%= list.getMaterial_nm() %></th>
						    	<th><%= list.getQuantity_units() %></th>
						    	<th><%= list.getBom_prod_quantity() %></th>
						    	<th>
						    		<!-- ★★★ #에 수정 메소드 링크할 것 -->
										<a href="#">
											<button type="button" class="btn btn-secondary btn-sm btn-update">수정</button>
										</a>
						    	</th>
						    </tr>
						  </tbody>
<%
	}
%>
						</table>
					</div>
					
					<!-- 페이지 버튼 -->
					<!-- #에 페이지 넘어가는 링크 연결할 것 -->
					<div class="BOM_list page">
						<nav aria-label="Page navigation example">
						  <ul class="pagination">
						    <li class="page-item">
						      <a class="page-link" href="#" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						    <li class="page-item"><a class="page-link" href="#">1</a></li>
						    <li class="page-item"><a class="page-link" href="#">2</a></li>
						    <li class="page-item"><a class="page-link" href="#">3</a></li>
						    <li class="page-item">
						      <a class="page-link" href="#" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
						  </ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	<!-- ============================================================================== -->
	
	<!-- footer 공통 부분 연결 -->
	<%@ include file="footer.jsp" %>

</body>
</html>