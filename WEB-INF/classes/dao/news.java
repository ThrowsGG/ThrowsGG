package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.NewsVO;

public class news {
	private Connection con;
	public news() {
		// TODO Auto-generated constructor stub
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
	
	public List getNews() {
		List<NewsVO> newslist = new ArrayList<NewsVO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String SQL = "select * from news order by num desc limit 6 ;";

		System.out.println("SQL : " + SQL);

		try {
			pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				NewsVO news = new NewsVO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4));
				newslist.add(news);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return newslist;
	}

}
