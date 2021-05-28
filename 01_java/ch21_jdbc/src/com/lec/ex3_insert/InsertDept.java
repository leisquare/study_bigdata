package com.lec.ex3_insert;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class InsertDept {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";

		Scanner scanner = new Scanner(System.in);
		System.out.print("입력할 부서번호는?");
		int deptno = scanner.nextInt();
		System.out.print("입력할 부서이름은?");
		String dname = scanner.next();
		System.out.print("입력할 부서의 위치는?");
		scanner.nextLine(); // 버퍼 클리어
		String loc = scanner.nextLine(); // seoul korea

		Connection conn = null;
		Statement stmt = null;
		String sql = String.format("INSERT INTO DEPT VALUES (%d,'%s','%s')", deptno, dname, loc);

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "scott", "tiger");
			stmt = conn.createStatement();
			int result = stmt.executeUpdate(sql);
			System.out.println(result>0? "부서입력성공":"실패");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}
}
