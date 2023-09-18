package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vo.LoginUser;

public class LoginDAO {
	private Connection con;

	public LoginDAO() {
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

	public LoginUser checkInfo(String id, String pw) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String SQL = "select id,AES_DECRYPT(UNHEX(password), ?),name,email,phone,nickname,profile,date from member where id = ? AND password = HEX(AES_ENCRYPT(?,?));";
		System.out.println(SQL);
		String key = "1234";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, key);
			pstmt.setString(2, id); // ?에 들어갈 것
			pstmt.setString(3, pw);
			pstmt.setString(4, key);
			System.out.println("login : " + id + " " + pw);
			rs = pstmt.executeQuery();
			System.out.println("login!!");
			if (rs.next()) { // 결과가 있다면
				System.out.println("복호화 패스워드 : " + rs.getString(2));
				LoginUser user = new LoginUser(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6),rs.getString(7),rs.getDate(8));
				return user; // 이미 존재하는 아이디
			} else {
				return null; // 가입 가능한 아이디
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("login fail!!");
		}
		return null;
	}

	public boolean checkMail(String id, String email) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String SQL = "select email from member where id = ? AND email = ?";
		System.out.println(SQL);
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, id); // ?에 들어갈 것
			pstmt.setString(2, email);
			System.out.println("senddddd : " + id + " " + email);
			rs = pstmt.executeQuery();
			System.out.println("sendMaillllll");
			if (rs.next()) { // 결과가 있다면
				System.out.println("strue");
				return true; // 존재하는회원
			} else {
				System.out.println("senfalse");
				return false; // 존재안하는 회원
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("sendmail fail!!");
		}
		return false;
	}

	public void updateFakePw(String id, String pw) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String key = "1234";
		String SQL = "update member set password=HEX(AES_ENCRYPT( ? ,? )) where id=?";
		System.out.println(SQL);

		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, pw); // ?에 들어갈 것
			pstmt.setString(2, key);
			pstmt.setString(3, id);
			System.out.println("update : " + id + " " + pw);
			pstmt.executeUpdate();
			System.out.println("changeeee");

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateeeeee fail!!");
		}

	}
	

}
