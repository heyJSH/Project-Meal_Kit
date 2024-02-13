package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/*import dto.MaterialVo;*/
import utils.DBManager;

public class Material_select {

	public static void main(String[] args) {
		Material_select ms = new Material_select();
		// 재료명만 조회
		/* ms.getMat_nm(); */
	}
	
	// 자재(재료명)만 모두 조회
	public List<String> getMat_nm() {
		String sql = null;
		String material_nm = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = null;

		List<String> list = new ArrayList<>();
		
		try {
			sql = "SELECT material_nm FROM material ORDER BY material_nm";

			conn = DBManager.getConnection(); // DB 연결
			System.out.println("오라클 접속 성공");

			pstmt = conn.prepareStatement(sql); // 쿼리문 실행
			rs = pstmt.executeQuery(sql); // 쿼리문 결과 처리

			while (rs.next()) {
				/* mVo = new MaterialVo(); */
				material_nm = rs.getString("material_nm"); 
				list.add(material_nm);		// List에 조회된 컬럼을 넣어줌
				/* System.out.println(material_nm); */
			}
		} catch (Exception e) {
			System.out.println("오라클 접속 오류: " + e);
		}
		DBManager.close(conn, pstmt, rs); // DB 닫기
		return list;
	}
	
	
	// 자재(재료) 모든 컬럼 조회 => BOM 현황 검색에 사용
	// 이건 List<MaterialVo>로 만들어서 Map 사용해서 하면 가능함(머리 아파서 다음에 시도하자)
	public List<String> getMat_all() {
		String sql = null;
		String material_id, material_nm, material_classification, material_quantity = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = null;

		List<String> list = new ArrayList<>();
		/* MaterialVo mVo = null; */

		try {
			sql = "SELECT material_id, material_nm, material_quantity FROM material ORDER BY material_nm";

			conn = DBManager.getConnection(); // DB 연결
			System.out.println("오라클 접속 성공");

			pstmt = conn.prepareStatement(sql); // 쿼리문 실행
			rs = pstmt.executeQuery(sql); // 쿼리문 결과 처리

			while (rs.next()) {
				/* mVo = new MaterialVo(); */

				material_id = Integer.toString(rs.getInt("material_id")); 
				material_nm = rs.getString("material_nm"); 
				material_classification = rs.getString("material_classification"); 
				material_quantity = Integer.toString(rs.getInt("material_quantity"));

				// List에 조회된 컬럼을 넣어줌
				list.add(material_id);
				list.add(material_nm);
				list.add(material_classification);
				list.add(material_quantity);

			}
		} catch (Exception e) {
			System.out.println("오라클 접속 오류: " + e);
		}
		DBManager.close(conn, pstmt, rs); // DB 닫기
		return list;
	}

}
