package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;	// 3. DB 쿼리문 사용
import java.sql.ResultSet;			// 4. DB 쿼리문 수행 결과
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.swing.plaf.synth.SynthOptionPaneUI;

import dto.FinishedProductVo;
import utils.DBManager;

public class Prod_select {

	public static void main(String[] args) {
		Prod_select ps = new Prod_select();
		// 제품명만 모두 조회
		/* ps.getProd_nm(); */
		// 제품 규격만 모두 조회
		/* ps.getProd_div(); */
		// 모든 컬럼 조회
		ps.getProd_all();

	}
	
	// 모든 제품명 조회 => BOM 현황 검색에 사용
	public List<String> getProd_nm() {
		String sql = null;
		String product_nm = null;
		
		PreparedStatement pstmt = null;
		/* Statement stmt = null; */
		ResultSet rs = null;
		Connection conn = null;
		
		/* FinishedProductVo pVo = new FinishedProductVo(); */
		
	    List<String> list = new ArrayList<>();
		try {
			/* sql = "SELECT DISTINCT product_nm FROM Finished_Product"; */
			sql = "SELECT DISTINCT product_nm FROM Finished_Product ORDER BY product_nm";
			
			conn = DBManager.getConnection();		// DB 연결
			System.out.println("오라클 접속 성공");
			
			pstmt = conn.prepareStatement(sql); 	// 쿼리문 실행 
			rs = pstmt.executeQuery(sql);		// 쿼리문 결과 처리
			
			while(rs.next()) {
				product_nm = rs.getString("product_nm");
				list.add(product_nm);		// List에 조회된 prod_nm을 넣어줌

				/* System.out.println(product_nm); */
			}
			
		} catch (Exception e) {
			System.out.println("오라클 접속 오류: " + e);
		}
		DBManager.close(conn, pstmt, rs);		// DB 닫기
		return list;
	}
	
	// 모든 제품규격 조회 => BOM 현황 검색에 사용
	public List<String> getProd_div() {
		String sql = null;
		String prod_div = null;
		
		PreparedStatement pstmt = null;
		/* Statement stmt = null; */
		ResultSet rs = null;
		Connection conn = null;
		
		/* FinishedProductVo pVo = new FinishedProductVo(); */
		
	    List<String> list = new ArrayList<>();
		try {
			sql = "SELECT DISTINCT product_div FROM Finished_Product ORDER BY product_div";
			
			conn = DBManager.getConnection();		// DB 연결
			System.out.println("오라클 접속 성공");
			
			pstmt = conn.prepareStatement(sql); 	// 쿼리문 실행 
			rs = pstmt.executeQuery(sql);		// 쿼리문 결과 처리
			
			while(rs.next()) {
				prod_div = rs.getString("product_div");
				list.add(prod_div);		// List에 조회된 prod_div을 넣어줌

				/* System.out.println(prod_div); */
			}
			
		} catch (Exception e) {
			System.out.println("오라클 접속 오류: " + e);
		}
		DBManager.close(conn, pstmt, rs);		// DB 닫기
		return list;
	}
	
	// 완제품 모든 컬럼 조회 => BOM 현황 검색에 사용
	public List<String> getProd_all() {
		String sql = null;
		String prod_id, 
				prod_nm, 
				prod_quantity, 
				prod_price,
				prod_div,
				prod_spec = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = null;
		
		List<String> list = new ArrayList<>();
		FinishedProductVo pVo = null;
		
		try {
			sql = "SELECT product_id, product_nm, product_div, product_spec, product_quantity, product_price FROM Finished_Product ORDER BY product_nm";
			
			conn = DBManager.getConnection();		// DB 연결
			System.out.println("오라클 접속 성공");
			
			pstmt = conn.prepareStatement(sql); 	// 쿼리문 실행 
			rs = pstmt.executeQuery(sql);		// 쿼리문 결과 처리
			
			while(rs.next()) {
				pVo = new FinishedProductVo();
				prod_id = Integer.toString(rs.getInt("product_id"));
				prod_nm = rs.getString("product_nm");
				prod_quantity = Integer.toString(rs.getInt("product_quantity"));
				prod_price = Integer.toString(rs.getInt("product_price"));
				prod_div = rs.getString("product_div");
				prod_spec = rs.getString("product_spec");
				
				// List에 조회된 컬럼을 넣어줌
				list.add(prod_id);		
				list.add(prod_nm);
				list.add(prod_quantity);
				list.add(prod_price);
				list.add(prod_div);
				list.add(prod_spec);
				
			}
		} catch (Exception e) {
			System.out.println("오라클 접속 오류: " + e);
		}
		DBManager.close(conn, pstmt, rs);		// DB 닫기
		return list;
	}

}
