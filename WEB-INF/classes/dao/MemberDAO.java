package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
	private Connection con;

	public MemberDAO() {
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



	public String idCheck(String id) {
		if (id == null || id.length() <= 4) // 아이디가 4개 이하
			return "tooshort";

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String SQL = "select id from member where id = ?";

		System.out.println("id : " + id);
		System.out.println("SQL : " + SQL);

		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, id); // ?에 들어갈 것
			rs = pstmt.executeQuery();

			if (rs.next() || id.equals("")) { // 결과가 있다면
				return "fail"; // 이미 존재하는 아이디
			} else {
				return "success"; // 가입 가능한 아이디
			}



		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "fail";
	}
	
	public void delinfo(int index){
		System.out.println("index : "+index);
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "DELETE FROM reservationtable WHERE reservationIndex=?";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, index);
			System.out.println("SQL : " + SQL);
			pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delall(String id) {
		System.out.println("id : " + id);
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "DELETE FROM member WHERE id=?";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, id);
			System.out.println("SQL : " + SQL);
			pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void insert_review(String id, String nickname, int item, float score, String comment) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "INSERT INTO review (userid,name,item,score,comment) values (?,?,?,?,?)";
		
		System.out.println(SQL);
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, id);
			pstmt.setString(2, nickname);
			pstmt.setInt(3, item); // ?에 들어갈 것
			pstmt.setFloat(4, score);
			pstmt.setString(5, comment);
			System.out.println(id + " " + nickname + " " + item + " " + score + " " +comment);
			pstmt.executeUpdate();
			System.out.println("insert!!");

		} catch (Exception e) {
			System.out.println("insert fail!!");
		}
	}
	public void delreview(int num) {
		System.out.println("num : " + num);
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "DELETE FROM review WHERE num=?";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, num);
			System.out.println("SQL : " + SQL);
			pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
