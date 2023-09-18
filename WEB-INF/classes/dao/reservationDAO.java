package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import vo.reservationVO;

public class reservationDAO {
	/*
	 * DAO 클래스는 단순히 DB연동만 담당하기 때문에 불필요하게 객체를 여러개 생성 할 필요가 없습니다. 그래서 싱글톤 패턴을 적용해서 객체를
	 * 1개만 생성되도록 만듭니다.
	 */
	// 1. 스스로 객체를 1개 생성합니다.
	private static IndexCommentsDAO instance = new IndexCommentsDAO();
	// 2. 외부에서 생성자를 호출할 수 없도록 생성자에 private제한을 붙임
	private Connection conn;
	private PreparedStatement pstmt;
	private DataSource ds;

	public reservationDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public void reservationInsert(reservationVO vo) {
		String sql = "INSERT INTO throwsgg.reservationtable (phonNumber, resTime, resDate, resComment, userId,"
				+ "name, opt, resdesertionNo) " + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPhonNumber());
			pstmt.setString(2, vo.getResTime());
			pstmt.setString(3, vo.getResDate());
			pstmt.setString(4, vo.getResComment());
			pstmt.setString(5, vo.getUserId());
			pstmt.setString(6, vo.getUsername());
			pstmt.setString(7, vo.getOpt());
			pstmt.setString(8, vo.getDesertionNo());
			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("연결 실패!");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void reservationSelect(reservationVO vo) {
		String sql = "INSERT INTO throwsgg.reservationtable (phonNumber, resTime,resDate,resComment,userId,"
				+ "name, opt,resdesertionNo) " + "VALUES (?, ?, ?, ?, ?, ?, ?,?)";
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPhonNumber());
			pstmt.setString(2, vo.getResTime());
			pstmt.setString(3, vo.getResDate());
			pstmt.setString(4, vo.getResComment());
			pstmt.setString(5, vo.getUserId());
			pstmt.setString(6, vo.getUsername());
			pstmt.setString(7, vo.getOpt());
			pstmt.setString(8, vo.getDesertionNo());
			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("연결 실패!");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
