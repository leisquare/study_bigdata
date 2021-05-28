package com.lec.ex0_conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnOracle {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";

		Connection conn = null;
		// 1단계: 드라이버 로드
		try {
			Class.forName(driver);
			System.out.println("DB로드성공");
			// 2. DB와 연결 객체 생성
			conn = DriverManager.getConnection(url, "scott", "tiger");
			System.out.println("DB연결성공");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage() + ":드라이버 오류");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + ":conn 객체 생성 못함");
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage() + " 닫기오류");
			}
		}

	}

}
