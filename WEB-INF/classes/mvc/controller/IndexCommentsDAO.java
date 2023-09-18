package mvc.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import vo.ChildIndexCommentsVO;
import vo.IndexCommentsVO;

public class IndexCommentsDAO {
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

	public IndexCommentsDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}

	}

	public static IndexCommentsDAO getInstance() {
		return instance;
	}
	
	
	public ArrayList<IndexCommentsVO> selectComments(String desertionNo) {
		ArrayList<IndexCommentsVO> dataList = new ArrayList<IndexCommentsVO>();
	    String sql = "SELECT indc.indexComments" + " , indc.comment" + " , indc.boardNum" + " , indc.userID"
	            + " , indc.regist_date" + " , mem.nickname" + " , mem.profile" + " FROM throwsgg.boardindexcomments AS indc"
	            + " INNER JOIN throwsgg.member AS mem" + " ON indc.userID = mem.id" + " where boardNum = ?";
		ResultSet rs = null;
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, desertionNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				IndexCommentsVO vo = new IndexCommentsVO(rs.getInt(1), rs.getString(2), rs.getString(3),
						rs.getString(4), rs.getString(5), rs.getString(6),rs.getString(7));
				dataList.add(vo);
			}

		} catch (Exception e) {
			System.out.println("연결 실패!");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					rs.close();
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dataList;

	}

	public void insertComments(String comments, String userID, String desertionNo, String nickname) {
		String sql = "INSERT INTO throwsgg.boardindexcomments (comment, boardNum,userID) "
				+ "VALUES (?, ?, ?)";
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, comments);
			pstmt.setString(2, desertionNo);
			pstmt.setString(3, userID);
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

	
	
	public void childInsertComments(String comments, String userID, String desertionNo, int groupNum, String nickname) {
		String sql = "INSERT INTO throwsgg.boardchildcomments (comment, boardNum,userID,groupNum) "
				+ "VALUES (?, ?, ?,?)";
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, comments);
			pstmt.setString(2, desertionNo);
			pstmt.setString(3, userID);
			pstmt.setInt(4, groupNum);
//			pstmt.setString(5, nickname);
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

	public void deleteComments(int indexComments) {
		String sql = "DELETE FROM throwsgg.boardindexcomments WHERE (indexComments = ?)";
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, indexComments);
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

	public void ModifyComments(String comments, String indexComments) {
		String sql = "UPDATE throwsgg.boardindexcomments SET comment = ? WHERE (indexComments = ?)";
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, comments);
			pstmt.setInt(2, Integer.parseInt(indexComments));
			pstmt.executeUpdate();
			System.out.println("indexComments 수정 완료");
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
    
    
    
	public ArrayList<ChildIndexCommentsVO> childSelectComments(String desertionNo) {
		ArrayList<ChildIndexCommentsVO> dataList = new ArrayList<ChildIndexCommentsVO>();
		String sql = "SELECT indc.childIndex" + " , indc.comment" + " , indc.boardNum" + " , indc.userID"
	            + " , indc.regist_date" + " , indc.groupNum" + " , mem.nickname" + " , mem.profile"
	            + " FROM throwsgg.boardchildcomments AS indc" + " INNER JOIN throwsgg.member AS mem"
	            + " ON indc.userID = mem.id" + " where boardNum = ?";
		ResultSet rs = null;
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, desertionNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ChildIndexCommentsVO vo = new ChildIndexCommentsVO(rs.getInt(1), rs.getString(2), rs.getString(3),
						rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7),rs.getString(8));
				System.out.println("199line_child list : " + vo.toString());
				dataList.add(vo);
			}

		} catch (Exception e) {
			System.out.println("연결 실패!");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					rs.close();
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dataList;

	}

	public void childdeleteComments(int indexComments) {
		String sql = "DELETE FROM throwsgg.boardchildcomments WHERE (childIndex = ?)";
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, indexComments);
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

	public void childModifyComments(String comments, String indexComments) {
		String sql = "UPDATE throwsgg.boardchildcomments SET comment = ? WHERE (childIndex = ?)";
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, comments);
			pstmt.setInt(2, Integer.parseInt(indexComments));
			pstmt.executeUpdate();
			System.out.println("indexComments 수정 완료");
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
