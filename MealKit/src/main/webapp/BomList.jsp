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
								<a href="javascript:submitReadBomForm();">Search</a>
							</span>
						</div>
					</div>
					<div class="search_header search_body">
					<!-- form 태그는 여기다 ============================== -->
						<form action="" method="get" class="searchBom" name="searchBom" id="searchBom">
							<div class="search_body prodNm_search">
								<h3>제품명</h3>
									<select class="form-select" aria-label="Default select example" name="search-ProdNm" id="search-ProdNm">
										<option value="">제품명 선택</option>
<% 
	//완제품 객체 생성
	Prod_select prod_s = new Prod_select();
	List<String> prod_divs = prod_s.getProd_div();
	List<String> prod_nms = prod_s.getProd_nm();
	String categoryProdNm = request.getParameter("search-ProdNm");

	for(String prod_nm : prod_nms) {
%>
									<option value="<%= prod_nm %>"
										<%-- <%= prod_nm == null ? "selected" : (prod_nm.equals(categoryProdNm) ? "selected" : "") %>> --%>
										<%= prod_nm.equals(categoryProdNm) ? "selected" : "" %>>
											<%= prod_nm %>
<%
	}
%>
									</option>
								</select>
							</div>
							<div class="search_body prodSpec_search">
								<h3>제품종류</h3>
									<select class="form-select" aria-label="Default select example" name="search-prodDiv" id="search-prodDiv">
										<option value="">제품종류 선택</option>
<%
	String categoryProdDiv = request.getParameter("search-prodDiv");
	for(String prod_div : prod_divs) {
%>
									  <option value="<%= prod_div %>"
									  	<%= prod_div.equals(categoryProdDiv) ? "selected" : "" %>>
									  		<%= prod_div %>
									  </option>
<%

	}
%>
									</select>
							</div>
							<div class="search_body matNm_search">
								<h3>재료명</h3>
									<select class="form-select" aria-label="Default select example" name="search-matNm" id="search-matNm">
									  <option value="">재료명 선택</option>
<%
	// 자재(재료) 객체 생성
	Material_select mat_s = new Material_select();
	List<String> mat_nms = mat_s.getMat_nm();
	
	String categoryMatNm = request.getParameter("search-matNm");
	for(String material_nm : mat_nms) {
		
%>
									  <option value="<%= material_nm %>"
									  	<%= material_nm.equals(categoryMatNm) ? "selected" : "" %>>
									  		<%= material_nm %>
<%
	}
%>
								  	</option>
									</select>
							</div>
						</form>
					</div>
				</div>
			</div>
			
			<!-- BOM 목록 -->
			<form action="./bomDelete.jsp" method="post" id="container-all">
				<div class="inner list_container">
	    		<div class="inner BOM_list">
	        	<div class="BOM_list bom_delete">
	            <a href="javascript: submitDeleteRow();">
	        	    <button type="button" class="btn btn-secondary btn-sm btn-delete">삭제</button>
	            </a>
	       		</div>
	        	<div class="BOM_list list_box">
	          <table class="table" id="table">
	          	<thead class="table-dark">
						    <tr>
						    	<th>
						    		<div class="form-check">
										  <input class="form-check-input" type="checkbox" value="" id="checkAll" onclick="javascript: checkBox();">
										  <label class="form-check-label" for="checkAll"></label>
										</div>
						    	</th>
						    	<th>#</th>
						    	<th>BOM코드</th>
						    	<th>제품코드</th>
						    	<th>제품명</th>
						    	<th>종류</th>
						    	<th>규격</th>
						    	<th>LOT사이즈</th>
						    	<th>종류</th>
						    	<th>재료코드</th>
						    	<th>재료명</th>
						    	<th>단위</th>
						    	<th>수량</th>
						    	<th>수정</th>
						    </tr>
						  </thead>
						  <tbody id="tBody">
	<%
	//BOM 현황 객체 생성
	BomDao bDao = new BomDao();
	List<BomListVo> lists = bDao.readBomList(request);
		for(BomListVo list : lists) {
	%>
						  	<tr data-row-id="<%= list.getList_seq() %>">
						    	<th>
						    		<div class="form-check">
						    			<!-- delete 쿼리문에 필요한 값인 bomId, matId를 넘겨야 함 => value 값에 넣기 -->
										  <input class="form-check-input chk" type="checkbox" value="<%= list.getBom_id() %>,<%=list.getMaterial_id() %>" id="flexCheckDefault" name="deleteCheckBox">
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
						    		<!-- ★★★ 메소드 링크할 것 -->
										<button type="button" class="btn btn-secondary btn-sm btn-update" onclick="editRow(<%= list.getList_seq() %>)">
	                  	수정
	                  </button>
						    	</th>
						    </tr>
						    <!-- 수정 Form이 들어갈 빈 행 추가 -->
	             	<tr id="modifyRow_<%= list.getList_seq() %>" style="display: none;">
	              	<td colspan="14"></td>
	              </tr>
	<%
		}
	%>
							  </tbody>
							</table>
						</div>
						
						<!-- 페이지 버튼 -->
						<!-- #에 페이지 넘어가는 링크 연결할 것 -->
						<!-- <div class="BOM_list page">
							<nav aria-label="Page navigation example">
							  <ul class="pagination">
							    <li class="page-item">
							      <a class="page-link" href="./bomDelete.jsp" aria-label="Previous">
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
						</div> -->
					</div>
				</div>
			</form>
	</section>
	
	
	<!-- ============================================================================== -->
	<!-- footer 공통 부분 연결 -->
	<%@ include file="footer.jsp" %>

</body>
</html>