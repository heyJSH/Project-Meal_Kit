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

<!-- java 연결 -->
<%@ page import = "dao.*" %>

<% 
	//BOM_list.jsp에서 넘어온 값들
	// ★★★ 넘어오는 값을 수정할 것
	String checkBomId = request.getParameter("");
	String checkMatId = request.getParameter("");
	String sql = null;
	
	// 커넥션 생성
	Connection conn = null;
	PreparedStatement pstmt = null;
	Exception exception = null;
	
	try {
		sql = "DELETE * FROM BOM b "
				+ "	WHERE bom_id = " + checkBomId
				+ "	AND b.material_id = " + checkMatId;
		
		conn = DBManager.getConnection();
		System.out.println("오라클 접속 성공");
		
		pstmt = conn.prepareStatement(sql);	// 쿼리문 실행
		pstmt.executeUpdate();			// 쿼리문 결과 처리
		
		// BomList 삭제 성공할 경우, alert("성공적으로 삭제되었습니다."); 보여준 후,
		// 적용된 BomList 현황 조회하는 화면으로 넘어갈 것.
	} catch (Exception e) {
		System.out.println("오라클 접속 오류: " + e);
	}
	
	// DB 닫기
	DBManager.close(conn, pstmt);
	
	// BomList 삭제 성공할 경우
	if(exception == null) {
%>
			<!-- 성공 케이스 -->
			<script>
				alert("성공적으로 삭제되었습니다.");		// 1
				location.href = '<%= request.getContextPath() %>/BomList.jsp';
			</script>
<% 
	} else {
%>
			<!-- 실패 케이스 -->
			BomList 삭제가 실패했습니다. 시스템 관리자에게 문의하세요 <br>
			오류내용: <%= exception.getMessage() %>
<% 
	}
%>