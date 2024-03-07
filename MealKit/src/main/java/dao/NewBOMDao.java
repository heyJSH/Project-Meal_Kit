package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.FinishedProductVo;
import dto.MaterialVo;
import utils.DBManager;

public class NewBOMDao {

	public static void main(String[] args) {
		// 실행 내용

	}
	
	// 생성자
	private String sql = null;
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	
	// 제품 등록
//	public List<FinishedProductVo> insertNewProd(HttpServletRequest request) {
	public void insertNewProd(HttpServletRequest request) {
		// Form에서 받아온 파라미터들
		String newProdNm = request.getParameter("inputProdNm");
		String newProdDiv = request.getParameter("inputProdDiv");
		String newProdSpec = request.getParameter("inputProdSpec");
		String newProdPrice = request.getParameter("inputProdPrice");
		
		sql = null;
		
		// 커넥션 생성
		conn = null;
		pstmt = null;
		
		// 인터페이스 구현 객체 생성
//		List<FinishedProductVo> newProdList = new ArrayList<>();
//		FinishedProductVo prodVo = new FinishedProductVo();
		
		try {
			sql ="INSERT INTO FINISHED_PRODUCT(PRODUCT_NM, PRODUCT_DIV, PRODUCT_SPEC, PRODUCT_PRICE)"
					+ "	VALUES (?, ?, ?, ?);";
			
			conn = DBManager.getConnection();	// DB 연결
			
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);		// 쿼리문 실행
			pstmt.setString(1, newProdNm);
			pstmt.setString(2, newProdDiv);
			pstmt.setString(3, newProdSpec);
			pstmt.setString(4, newProdPrice);
			
			// SQL문 실행 결과 처리
			pstmt.execute();		// insert/update/delete 쿼리문 결과 처리
			
		} catch (Exception e) {
			System.out.println("오라클 접속 오류: " + e);
		}
		DBManager.close(conn, pstmt);	// DB 닫기
//		return newProdList;		// List 반환
	}
	
	// 재료 등록
	public void insertNewMat(HttpServletRequest request) {
		// Form에서 받아온 파라미터들
		String newMatNm = request.getParameter("inputMatNm");
		String newMatDiv = request.getParameter("inputMatDiv");
		String newMatQuantity = request.getParameter("inputMatQuantityForBom");
		String newMatUnits = request.getParameter("inputMatUnitsForBom");
		
		sql = null;
		
		// 커넥션 생성
		conn = null;
		pstmt = null;
		
		try {
			sql = "";
		} catch(Exception e) {
			System.out.println("오라클 접속 오류: " + e);
		}
		DBManager.close(conn, pstmt);	// DB 닫기
		
	}

}
