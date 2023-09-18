package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Copy {
	private Connection con;
	int count = 0;
	
	public Copy() {
		System.out.println("it me!");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("DRIVER LOADING.....");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/throwsgg?user=root&password=1234");
			System.out.println("Connection success!");

		} catch (Exception e) {
			e.printStackTrace();
		}
	} // 생성자



	public int countCheck() {

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String SQL = "select id from member";

		System.out.println("SQL : " + SQL);

		try {
			pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();

			while(rs.next())
			{
				count++;
			}


		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	



}
