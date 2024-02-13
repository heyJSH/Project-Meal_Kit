<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DB와 연결 -->
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.lang.Exception, java.sql.SQLException" %>
<%@ page import="utils.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제조 지시</title>
	 <!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<!-- reset.css 연결 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
	<!-- main.css 연결 -->
	<link rel="stylesheet" href="./css/main.css" />
	<!-- format.css 연결 -->
	<link rel="stylesheet" href="./css/employees.css" />
	
	<!-- google font & google material icon -->
  <!-- Google 나눔고딕 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" />
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	
	<!-- jQuery 연결 -->
	<script defer src="./js/jquery-3.7.1.min.js"></script>
</head>
<body>
	<!-- header 공통 부분 연결 -->
	<%@ include file="header.jsp" %>	
	
	<!-- ============================================================================== -->
	
	<!-- 본인 컨텐츠는 여기서 쓰면 됩니다 -->
	<div class="subject">
		<p>사원 관리</p>
	</div>
	<div class="employees">
		<%
		Connection connection = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			connection = DBConfig.getConnection();
			System.out.println("접속성공");
		} catch(SQLException se) {
			System.out.println("접속실패");
		}
		%>
		<div class="table">
			<div class="sub_table">
				<table>
					<tr>
						<th class="t1">사원번호</th>
						<th class="t2">비밀번호</th>
						<th class="t3">사원명</th>
						<th class="t4">연락처</th>
						<th class="t5">부서번호</th>
						<th class="t6">부서명</th>
						<th class="t7">직책</th>
						<th class="t8">완료버튼</th>
					</tr>
					<form action="employees_btn.jsp" method="post">
						<tr>
							<td class="t1"><input type="text" class="inputField" name="empId" placeholder="사원번호"></td>
							<td class="t2"></td>
							<td class="t3"><input type="text" class="inputField" name="empNm" placeholder="사원명"></td>
							<td class="t4"><input type="text" class="inputField" name="empContact" placeholder="연락처"></td>
							<td class="t5"><input type="text" class="inputField" name="depId" placeholder="부서번호"></td>
							<td class="t6"><input type="text" class="inputField" name="depNm" placeholder="부서명"></td>
							<td class="t7"><input type="text" class="inputField" name="empRole" placeholder="직책"></td>
							<td class="t8"><button id="addBtn">사원추가</button></td>
						</tr>
					</form>
				</table>
			</div>
			<div class="content">
				<table>
					<%
					try{
						String sql = "SELECT EMP_ID, EMP_PW, EMP_NM, EMP_CONTACT, DEP_ID, DEP_NM, EMP_ROLE FROM EMPLOYEES ORDER BY EMP_ID ASC";
						stmt = connection.createStatement();
						rs = stmt.executeQuery(sql);
						
						while(rs.next()) {
							int Emp_id = rs.getInt("EMP_ID");
							String Emp_pw = rs.getString("EMP_PW");
							String Emp_nm = rs.getString("EMP_NM");
							String Emp_contact = rs.getString("EMP_CONTACT");
							int Dep_id = rs.getInt("DEP_ID");
							String Dep_nm = rs.getString("DEP_NM");
							String Emp_role = rs.getString("EMP_ROLE");
							%>
							<tr>
								<td class="t1"><%= Emp_id %></td>
								<td class="t2"><%= Emp_pw %></td>
								<td class="t3"><%= Emp_nm %></td>
								<td class="t4"><%= Emp_contact %></td>
								<td class="t5"><%= Dep_id %></td>
								<td class="t6"><%= Dep_nm %></td>
								<td class="t7"><%= Emp_role %></td>
								<td class="t8"></td>
							</tr>
							<%
								}
							rs.close();
							stmt.close();
							} catch(Exception e){
								
							}
				%>
				</table>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#addBtn').prop('disabled', true);
			function checkInputFields() {
				var allFilled = true;
				$('.inputField').each(function() {
					if ($(this).val() === '') {
						allFilled = false;
						return false;
					}
				});
				$('#addBtn').prop('disabled', !allFilled);
			}
			$('.inputField').keyup(function() {
				checkInputFields();
			});
		});
		window.onload = function() {
			var status = new URL(window.location.href).searchParams.get('status');
			switch(status) {
      	case 'success':
        	break;
        case 'error':
          alert('사원 추가가 실패했습니다.');
          break;
        default:
         	break;
        }
			window.history.replaceState({}, document.title, window.location.pathname);
		};
	</script>
		<!-- ============================================================================== -->
	
	<!-- footer 공통 부분 연결 -->
	<%@ include file="footer.jsp" %>
</body>
</html>
