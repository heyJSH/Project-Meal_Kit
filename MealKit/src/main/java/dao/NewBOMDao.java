package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.BomListVo;
import dto.FinishedProductVo;
import dto.SupplierVo;
import utils.DBManager;

public class NewBOMDao {

	public static void main(String[] args) {
		// 실행 내용

	}
	
	// 제품 등록(Form1)
    public List<FinishedProductVo> insertNewProd(HttpServletRequest request) {
        String newProdNm = request.getParameter("inputProdNm");
        String newProdDiv = request.getParameter("inputProdDiv");
        String newProdSpec = request.getParameter("inputProdSpec");
        String newProdPrice = request.getParameter("inputProdPrice");

        String sql = null;

        // 커넥션 생성
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        List<FinishedProductVo> newProdList = new ArrayList<>();

        try {
            sql = "INSERT INTO FINISHED_PRODUCT(PRODUCT_NM, PRODUCT_DIV, PRODUCT_SPEC, PRODUCT_PRICE)"
                    + "	VALUES (?, ?, ?, ?) RETURNING * INTO ?";

            conn = DBManager.getConnection(); // DB 연결

            // PreparedStatement 객체 생성
            pstmt = conn.prepareStatement(sql); // 쿼리문 실행
            pstmt.setString(1, newProdNm);
            pstmt.setString(2, newProdDiv);
            pstmt.setString(3, newProdSpec);
            pstmt.setString(4, newProdPrice);

            // SQL문 실행 결과 처리
            pstmt.execute(); // insert/update/delete 쿼리문 결과 처리

            // 반환된 결과셋을 확인
            while (rs.next()) {
                FinishedProductVo prodData = new FinishedProductVo();
                prodData.setProduct_nm("inputProdNm");
                prodData.setProduct_div("inputProdDiv");
                prodData.setProduct_spec("inputProdSpec");
                prodData.setProduct_price(Integer.parseInt("inputProdPrice"));
                newProdList.add(prodData);
            }

        } catch (SQLException e) {
            System.out.println("오라클 접속 오류: " + e);
        } finally {
            DBManager.close(conn, pstmt, rs); // DB 닫기
        }
        return newProdList; // List 반환
    }
	
	// 재료 등록(Form2)
	public List<BomListVo> insertNewMat(HttpServletRequest request) {
		// Form에서 받아온 파라미터들
		String newMatNm = request.getParameter("inputMatNm");
		String newMatDiv = request.getParameter("inputMatDiv");
//		String newMatQuantity = request.getParameter("inputMatQuantityForBom");
//		String newMatUnits = request.getParameter("inputMatUnitsForBom");
		
		String sql = null;
		
		// 커넥션 생성
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        List<BomListVo> newBomLists = new ArrayList<>();
		
		try {
			sql = "INSERT INTO MATERIAL(MATERIAL_NM, MATERIAL_CLASSIFICATION)"
					+ "	VALUES (?, ?);";
			
			conn = DBManager.getConnection(); 	// DB 연결

            // PreparedStatement 객체 생성
            pstmt = conn.prepareStatement(sql); // 쿼리문 실행
            pstmt.setString(1, newMatNm);
            pstmt.setString(2, newMatDiv);
            
            pstmt.execute();					// SQL문 실행 결과 처리
            
            // 반환된 결과셋을 확인
            while(rs.next()) {
            	BomListVo bomData = new BomListVo();
            	bomData.setMaterial_nm("inputMatNm");
            	bomData.setMaterial_classification("inputMatDiv");
            	newBomLists.add(bomData);
            }
			
		} catch(Exception e) {
			System.out.println("오라클 접속 오류: " + e);
		}
		DBManager.close(conn, pstmt);	// DB 닫기
		return newBomLists;
	}

	// BOM 등록(Form2, 재료 등록하는 form)
	public List<BomListVo> insertNewBom(HttpServletRequest request) {
		// Form에서 받아온 파라미터들
		String prodNm = request.getParameter("inputProdNm");
		String prodDiv = request.getParameter("inputProdDiv");
	    String prodSpec = request.getParameter("inputProdSpec");
	    String prodPrice = request.getParameter("inputProdPrice");
	    String matNm = request.getParameter("inputMatNm");
	    String matDiv = request.getParameter("inputMatDiv");
	    String matQuantity = request.getParameter("inputMatQuantity");
	    String matUnits = request.getParameter("inputMatUnits");
	    
	    // 커넥션 생성
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    
	    String sql = null;
	    
	    List<BomListVo> newBomLists = new ArrayList<>();
	    
	    try {
	    	conn = DBManager.getConnection();	// DB 연결
	    	
	    	// [쿼리1]. 제품명과 제품스펙에 해당하는 product_id 조회
	    	sql = "SELECT fp.PRODUCT_ID FROM FINISHED_PRODUCT fp "
	    			+ "WHERE fp.PRODUCT_NM = ? AND fp.PRODUCT_SPEC = ?";
	    	
	    	pstmt = conn.prepareStatement(sql);		// 쿼리문 실행
	    	pstmt.setString(1, prodNm);
	    	pstmt.setString(2, prodSpec);
	    	rs = pstmt.executeQuery();
	    	
	    	int productId = -1;
	    	if(rs.next()) {
	    		productId = rs.getInt("PRODUCT_ID");
	    	} else {
				// 조회된 product_id가 없는 경우, 새로운 product_id의 정보를 INSERT한다.
	    		sql = "INSERT INTO FINISHED_PRODUCT(PRODUCT_NM, PRODUCT_DIV, PRODUCT_SPEC, PRODUCT_PRICE)"
	    				+ "	VALUES (?, ?, ?, ?)";
	    		
	    		// PreparedStatement 객체 생성
	            pstmt = conn.prepareStatement(sql); // 쿼리문 실행
	            pstmt.setString(1, prodNm);
	            pstmt.setString(2, prodDiv);
	            pstmt.setString(3, prodSpec);
	            pstmt.setString(4, prodPrice);
	            
	            pstmt.execute();			// SQL문 실행 결과 처리

	            
			}
	    	
	    	// [쿼리2]. material_id 조회
	    	sql = "SELECT m.MATERIAL_ID FROM MATERIAL m WHERE m.MATERIAL_NM = ?";
	    	pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, matNm);
	        rs = pstmt.executeQuery();
	        
	        int materialId;
	        if (rs.next()) {
	            materialId = rs.getInt("MATERIAL_ID");
	        } else {
	        	// 조회된 material_id 없으면 그냥 새로 insert
	        	sql = "INSERT INTO MATERIAL(MATERIAL_NM, MATERIAL_CLASSIFICATION)"
	        			+ "	VALUES (?, ?);";
	        	pstmt = conn.prepareStatement(sql); // 쿼리문 실행
	        	pstmt.setString(1, matNm);
	        	pstmt.setString(2, matDiv);
	        	
	        	pstmt.execute();					// SQL문 실행 결과 처리
	        }

	    	
	    	// [쿼리3]. bom_id 조회 또는 시퀀스로 bom_id 삽입
	    	// product_id가 동일한 bom_id가 있으면, 해당 bom_id를 삽입, 아니면 새로운 bom_id를 삽입
	    	// 다른 조건이 많음
	    	sql = "SELECT b.BOM_ID FROM BOM b WHERE b.PRODUCT_ID = ?";
	    	
	    	pstmt = conn.prepareStatement(sql);		// 쿼리문 실행
	    	pstmt.setInt(1, productId);
	    	rs = pstmt.executeQuery();
	    	
	    	int bomId;
	    	if(rs.next()) {
	    		bomId = rs.getInt("BOM_ID");
	    	} else {
	    		// 없으면 그냥 insert
	    		sql = "INSERT INTO BOM"
	    				+ "	(PRODUCT_ID, MATERIAL_ID, BOM_PROD_QUANTITY, QUANTITY_UNITS)"
	    				+ "VALUES (prod_seq.nextval, material_seq.nextval, ? * 1000, ?)";
	    		pstmt = conn.prepareStatement(sql); // 쿼리문 실행
	        	pstmt.setString(1, matQuantity);
	        	pstmt.setString(2, matUnits);
	        	
	        	pstmt.execute();					// SQL문 실행 결과 처리
	    		
	    	}
	    	
	    } catch (Exception e) {
	    	System.out.println("오라클 접속 오류: " + e);
		}
	    DBManager.close(conn, pstmt, rs);	// DB 닫기
	    return newBomLists;
	}
	
	// -----------------------------------------------------------------------
	// BOM 등록(Form1, Form2)
	public List<BomListVo> insertNewBomList(HttpServletRequest request) {
		// Form에서 받아온 파라미터들
		String prodNm = request.getParameter("inputProdNm");
		String prodDiv = request.getParameter("inputProdDiv");
	    String prodSpec = request.getParameter("inputProdSpec");
	    String prodPrice = request.getParameter("inputProdPrice");
	    String matNm = request.getParameter("inputMatNm");
	    String matDiv = request.getParameter("inputMatDiv");
	    String matQuantity = request.getParameter("inputMatQuantity");
	    String matUnits = request.getParameter("inputMatUnits");
	    
	    // 커넥션 생성
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    
	    String sql = null;
	    
	    List<BomListVo> newBomLists = new ArrayList<>();
	    
	    try {
	    	// 제품 등록
	    	sql = "INSERT INTO FINISHED_PRODUCT(PRODUCT_NM, PRODUCT_DIV, PRODUCT_SPEC, PRODUCT_PRICE)"
                    + "	VALUES (?, ?, ?, ?) RETURNING * INTO ?";

            conn = DBManager.getConnection(); // DB 연결

            // PreparedStatement 객체 생성
            pstmt = conn.prepareStatement(sql); // 쿼리문 실행
            pstmt.setString(1, prodNm);
            pstmt.setString(2, prodDiv);
            pstmt.setString(3, prodSpec);
            pstmt.setString(4, prodPrice);

            // SQL문 실행 결과 처리
            pstmt.execute(); // insert/update/delete 쿼리문 결과 처리
            
            // 재료 등록
            sql = "INSERT INTO MATERIAL(MATERIAL_NM, MATERIAL_CLASSIFICATION)"
        			+ "	VALUES (?, ?);";
        	pstmt = conn.prepareStatement(sql); // 쿼리문 실행
        	pstmt.setString(1, matNm);
        	pstmt.setString(2, matDiv);
        	
        	pstmt.execute();					// SQL문 실행 결과 처리
        	
        	// BOM 등록
        	sql = "INSERT INTO BOM"
    				+ "	(PRODUCT_ID, MATERIAL_ID, BOM_PROD_QUANTITY, QUANTITY_UNITS)"
    				+ "VALUES (prod_seq.nextval, material_seq.nextval, ? * 1000, ?)";
    		pstmt = conn.prepareStatement(sql); // 쿼리문 실행
        	pstmt.setString(1, matQuantity);
        	pstmt.setString(2, matUnits);
        	
        	pstmt.execute();					// SQL문 실행 결과 처리
	    	
	    	
		} catch (Exception e) {
			System.out.println("오라클 접속 오류: " + e);
		}
	    DBManager.close(conn, pstmt, rs);	// DB 닫기
	    return newBomLists;
	}
	
	// -----------------------------------------------------------------------
	// 업체 등록(Form3)
	public List<SupplierVo> insertNewSup(HttpServletRequest request) {
		// Form3에서 받아온 파라미터들
		String[] newSupNms = request.getParameterValues("inputSupNm");
	    String[] supContacts = request.getParameterValues("inputSupContact");
	    String[] supAddresses = request.getParameterValues("inputSubEmail");
	    String[] supEmails = request.getParameterValues("inputSupAddress");
	    String[] supSells = request.getParameterValues("inputSalesMatList");
		
		String sql = null;
		
		// 커넥션 생성
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        List<SupplierVo> newSupLists = new ArrayList<>();
        
        try {
        	sql = "INSERT INTO SUPPLIER (sup_name, phone_num, sup_address, sup_email, sup_sell)"
        			+ "VALUES (?, ?, ?, ?, ?)";
        	
        	conn = DBManager.getConnection(); 	// DB 연결

            // PreparedStatement 객체 생성
        	// 업체 정보 반복 처리
            for (int i = 0; i < newSupNms.length; i++) {
                pstmt.setString(1, newSupNms[i]);
                pstmt.setString(2, supContacts[i]);
                pstmt.setString(3, supAddresses[i]);
                pstmt.setString(4, supEmails[i]);
                pstmt.setString(5, supSells[i]);

                // SQL문 실행 결과 처리
                pstmt.execute();

                // 반환된 결과셋을 확인
                SupplierVo supData = new SupplierVo();
                supData.setSup_name(newSupNms[i]);
                supData.setPhone_num(supContacts[i]);
                supData.setSup_address(supAddresses[i]);
                supData.setSup_email(supEmails[i]);
                supData.setSup_sell(supSells[i]);
                newSupLists.add(supData);
            }
        	
        } catch (Exception e) {
        	System.out.println("오라클 접속 오류: " + e);
		}
        DBManager.close(conn, pstmt);	// DB 닫기
		return newSupLists;
	}

}
