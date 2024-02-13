package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;	// 3. DB 쿼리문 사용
import java.sql.ResultSet;			// 4. DB 쿼리문 수행 결과
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.BomListVo;
import utils.DBManager;

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

public class BomDao {

	public static void main(String[] args) {
		// 실행 내용
		/* BOM_list(); */
		BomDao bDao = new BomDao();
	}
	
	// 검색한 BOM 목록을 조회하는 함수
	public List<BomListVo> readBomList(HttpServletRequest request) {
		// BOM_list.jsp에서 넘어온 값들
		String searchProdNm = request.getParameter("search-ProdNm");
		String searchProdDiv = request.getParameter("search-prodDiv");
		String searchMatNm = request.getParameter("search-matNm");
		
		String sql = null;
		
		// 커넥션 생성
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// 인터페이스 구현 객체 생성
		List<BomListVo> list = new ArrayList<>();
		
		try {
			sql = "SELECT b.BOM_ID, b.PRODUCT_ID, fp.PRODUCT_NM, fp.PRODUCT_DIV, fp.PRODUCT_SPEC"
					+ "		, i.LOT_SIZE"
					+ "		, m.MATERIAL_CLASSIFICATION, b.MATERIAL_ID, m.MATERIAL_NM"
					+ "		, b.QUANTITY_UNITS, b.BOM_PROD_QUANTITY"
					+ "	FROM BOM b, FINISHED_PRODUCT fp, MATERIAL m, INSTRUCTION i"
					+ "	WHERE b.PRODUCT_ID = fp.PRODUCT_ID "
					+ "		AND b.MATERIAL_ID = m.MATERIAL_ID"
					+ "		AND b.LOT_ID = i.LOT_ID ";
			
			// 검색목록 선택을 했다면, sql문에 추가해줄 것
			if(searchProdNm != null && searchProdNm != "") {
				sql += "AND fp.PRODUCT_NM LIKE '%" + searchProdNm + "%'";
			}
			if(searchProdDiv != null && searchProdDiv != "") {
				sql += "AND fp.PRODUCT_DIV LIKE '%" + searchProdDiv + "%'";
			}
			if(searchMatNm != null && searchMatNm != "") {
				sql += "AND m.MATERIAL_NM  LIKE '%" + searchMatNm + "%'";
			} 
			sql += "ORDER BY b.BOM_ID, b.PRODUCT_ID, m.MATERIAL_CLASSIFICATION";
			
			conn = DBManager.getConnection();
			System.out.println("오라클 접속 성공");
			
			pstmt = conn.prepareStatement(sql);	// 쿼리문 실행
			rs = pstmt.executeQuery();			// 쿼리문 결과 처리
			
			while(rs.next()) {
				BomListVo bVo = new BomListVo();
				int size = list.size();
				
				bVo.setBom_id(rs.getInt("bom_id"));	// bom_id에 데이터 저장
				bVo.setProduct_id(rs.getInt("product_id"));
				bVo.setProduct_nm(rs.getString("product_nm"));
				bVo.setProduct_div(rs.getString("product_div"));
				bVo.setProduct_spec(rs.getString("product_spec"));
				bVo.setLot_size(rs.getInt("lot_size"));
				bVo.setMaterial_classification(rs.getString("material_classification"));
				bVo.setMaterial_id(rs.getInt("material_id"));
				bVo.setMaterial_nm(rs.getString("material_nm"));
				bVo.setQuantity_units(rs.getString("quantity_units"));
				bVo.setBom_prod_quantity(rs.getInt("bom_prod_quantity"));
				bVo.setList_seq(size + 1);
				list.add(bVo);		// 데이터 객체 추가
//				System.out.println(bVo);
				System.out.println(list.size());
				
				// 객체 리스트에 담은 값들을 조회
//				int size = list.size();
//				BomListVo bVo1 = null;
//				for(int i=0; i<size; i++) {
//					bVo1 = new BomListVo();
//					bVo1 = (BomListVo)list.get(i);
//				}
//				System.out.println(bVo1);
				
			}
			
		} catch (Exception e) {
			System.out.println("오라클 접속 오류: " + e);
		}
		
		DBManager.close(conn, pstmt, rs); // DB 닫기
		return list;
	}
	
	
	// checkbox 선택 후, 삭제 버튼 click => 해당 bom_id=?, material_id=?의 데이터 삭제
	/*
	 * public List<BomListVo> deleteBomList(HttpServletRequest request) { //
	 * BOM_list.jsp에서 넘어온 값들 // ★★★ 넘어오는 값을 수정할 것 String checkBomId =
	 * request.getParameter(""); String checkMatId = request.getParameter("");
	 * 
	 * String sql = null;
	 * 
	 * // 커넥션 생성 Connection conn = null; PreparedStatement pstmt = null;
	 * 
	 * // 인터페이스 구현 객체 생성 List<BomListVo> list = new ArrayList<>();
	 * 
	 * try { sql = "DELETE * FROM BOM b " + "	WHERE bom_id = " + checkBomId +
	 * "	AND b.material_id = " + checkMatId;
	 * 
	 * conn = DBManager.getConnection(); System.out.println("오라클 접속 성공");
	 * 
	 * pstmt = conn.prepareStatement(sql); // 쿼리문 실행 pstmt.executeUpdate(); // 쿼리문
	 * 결과 처리
	 * 
	 * // BomList 삭제 성공할 경우, alert("성공적으로 삭제되었습니다."); 보여준 후, // 적용된 BomList 현황 조회하는
	 * 화면으로 넘어갈 것.
	 * 
	 * } catch (Exception e) { System.out.println("오라클 접속 오류: " + e); }
	 * 
	 * DBManager.close(conn, pstmt); return list; }
	 */

}
