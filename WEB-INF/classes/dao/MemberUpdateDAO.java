package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberUpdateDAO {
	
	private Connection con;
	
	public MemberUpdateDAO() {
		System.out.println("it me!");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("DRIVER LOADING.....");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/throwsgg?user=root&password=1234");
			System.out.println("Connection success!");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean updateMember(String id, String nickname, String name, String email,String phone,String img) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "UPDATE member SET nickname = ? ,name = ? , phone = ? , email = ? ,profile =? WHERE id = ?";
		System.out.println(SQL);
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, nickname);
			pstmt.setString(2, name); // ?에 들어갈 것
			pstmt.setString(3, phone);
			pstmt.setString(4, email);
			pstmt.setString(5, img);
			pstmt.setString(6, id);
			
			System.out.println("Udate : " + name + " " + phone + " " + email + " " + id+ " " +nickname + " ");
			pstmt.executeUpdate();
			System.out.println("Udate!!");

			return true;
		} catch (Exception e) {
			System.out.println("Udate fail!!");
			return false;
		}
	}
	
	public boolean updatepw(String id ,String npw, String nrpw) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String key = "1234";
		String SQL = "UPDATE member SET password = HEX(AES_ENCRYPT(?,?))  WHERE id = ?";
		System.out.println(SQL);
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, npw);
			pstmt.setString(2, key); // ?에 들어갈 것
			pstmt.setString(3, id);
			
			System.out.println("Udate : " + npw + " " + id);
			pstmt.executeUpdate();
			System.out.println("Udate!!");

			return true;
		} catch (Exception e) {
			System.out.println("Udate fail!!");
			return false;
		}
		
	}
	
}
