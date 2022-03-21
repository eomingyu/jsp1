package day1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class OracleConnectUtil { // 오라클 연결이 필요할 떄 사용될 클래스
	// 연결메소드
	public static Connection connect() { // 주석은 JDBCConnectionTest 를 참고하세요.
		String url = "jdbc:oracle:thin:@//localhost:1521/xe";
		String user = "idev";
		String password = "1234";
		String driver = "oracle.jdbc.driver.OracleDriver";
		Connection conn = null;
		try {
			Class.forName(driver);

			conn = DriverManager.getConnection(url, user, password);
			if (conn == null)
				System.out.println("데이터 베이스 서버에 연결하지 못했습니다.");

			System.out.println("연결상태 확인 : " + conn);
		} catch (ClassNotFoundException e) {
			System.out.println("클래스 로드 오류 : " + e.getMessage());
		} catch (SQLException e2) {
			System.out.println("연결 URL, 사용자 계정정보 오류 : " + e2.getMessage());
		}
		
		return conn;
	} // connect 메소드 끝
	
	// 연결 종료 메소드
	public static void close(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				System.out.println("데이터베이스 연결 종료에 문제가 있습니다. -" + e.getMessage());
			}
		}
	}

}
