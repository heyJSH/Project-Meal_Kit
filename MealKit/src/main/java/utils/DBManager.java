package utils;

import java.sql.DriverManager;		// 1. DB 관리
import java.sql.Connection;			// 2. DB 연결
import java.sql.PreparedStatement;	// 3. DB 쿼리문 사용
import java.sql.ResultSet;			// 4. DB 쿼리문 수행 결과

//DB관리(1.DB 연결 / 2.DB 닫기)
public class DBManager {
	// 메서드: DB관리(1.DB 연결)
	public static Connection getConnection() {
		Connection conn = null;
//			try{}: 예외 발생이 우려되는 블록을 시도할 때 
		try {
//				(1단계) JDBC 드라이버(클래스) 로드
			Class.forName("oracle.jdbc.OracleDriver");				// 예외 발생 가능1
			
//				(2단계) 데이터베이스 연결 객체 생성
			// 데이터베이스 연결 정보
			// 집에서 할 때는 아래의 url로 연결
			/* String url = "jdbc:oracle:thin:@localhost:1521:orcl"; */
			
			// 학원에서 할 때는 아래의 url로 연결
			String url = "jdbc:oracle:thin:@1.220.247.78:1522:orcl";
			String uid = "semi_project1";
			String pass = "123451";
			conn = DriverManager.getConnection(url, uid, pass);		// 예외 발생 가능2
			System.out.println("DB 연결 성공!");
//			catch(){}: 예외가 발생했을 때 처리 과정 
		} catch(Exception e) {
			System.out.println("예외 발생시 처리할 코드: DB 연결");
		}
		return conn;
	}
	// 메서드: DB관리(2.DB 닫기)- DB를 조회(select)한 경우, 
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			//(5 단계) 사용한 리소스 해제
			if(rs != null) {
				rs.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		} catch(Exception e) {
			System.out.println("예외 발생시 처리할 코드: DB 닫기(select)");
		}
	}
	// 메서드: DB관리(2.DB 닫기)- DB를 삽입/수정/삭제(insert, update, delete)한 경우,
	public static void close(Connection conn, PreparedStatement pstmt) {
		try {
			if(pstmt != null) {
				pstmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		} catch(Exception e) {
			System.out.println("예외 발생시 처리할 코드: DB 닫기(insert,update,delete)");
		}
	}
}
