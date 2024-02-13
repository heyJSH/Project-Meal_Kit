package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConfig {

	// Oracle 데이터베이스 연결 정보 설정
	// "jdbc:oracle:thin:@ip주소:포트번호:orcl"
	private static final String JDBC_URL = "jdbc:oracle:thin:@1.220.247.78:1522:orcl";
	private static final String USER = "semi_project1";
	private static final String PASSWORD = "123451";
	
	// 데이터베이스 연결을 반환하는 메서드
	public static Connection getConnection() throws SQLException {
	    return DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
	}
}