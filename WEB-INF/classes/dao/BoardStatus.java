package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BoardStatus {
	private Connection con;
	public BoardStatus() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("DRIVER LOADING.....");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/throwsgg?user=root&password=1234");
			System.out.println("Connection success!");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean changeStatus(int num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String find = "find";
		String SQL = "UPDATE board SET status = ? WHERE num = ?";
		System.out.println(SQL);
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, find);
			pstmt.setInt(2, num); // ?에 들어갈 것
			
			
			pstmt.executeUpdate();
			System.out.println("Udate!!");
			return true;
		} catch (Exception e) {
			System.out.println("Udate fail!!");
			return false;
		}
	}

}
