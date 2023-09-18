package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.swing.text.StyledEditorKit.BoldAction;

import mvc.model.BoardDTO;
import vo.CartVO;
import vo.IndexCommentsVO;
import vo.ItemVO;
import vo.ProductVO;
import vo.SaleorderVO;

public class ProductDAO {
	/*
	 * DAO 클래스는 단순히 DB연동만 담당하기 때문에 불필요하게 객체를 여러개 생성 할 필요가 없습니다. 그래서 싱글톤 패턴을 적용해서 객체를
	 * 1개만 생성되도록 만듭니다.
	 */
	// 1. 스스로 객체를 1개 생성합니다.
	private static ProductDAO instance = new ProductDAO();
	// 2. 외부에서 생성자를 호출할 수 없도록 생성자에 private제한을 붙임
	private Connection conn;
	private PreparedStatement pstmt;
	private DataSource ds;

	public ProductDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}

	}

	public static ProductDAO getInstance() {
		return instance;
	}

	public ArrayList<ProductVO> selectProduct(int page, int limit) {// shop.jsp의 페이징 데이터 select
		int total_record = dataTotalCount();
		int start = (page - 1) * limit;
		int index = start + 1;
		ResultSet rs = null;
		String sql = "select * from throwsgg.product ORDER BY productID DESC";
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int i = 0;
			while (rs.next()) {
				if (i >= index - 1) {
					ProductVO vo = new ProductVO();
					vo.setProductID(rs.getInt("productID"));
					vo.setCategory(rs.getString("category"));
					vo.setPname(rs.getString("pname"));
					vo.setPrice(rs.getInt("price"));
					vo.setStock(rs.getInt("stock"));
					vo.setInputdate(rs.getString("inputdate"));
					vo.setDescription(rs.getString("description"));
					vo.setFirstImg(rs.getString("firstImg"));
//					vo.setSeconImg(rs.getString("secondImg"));
//					vo.setThirldImg(rs.getString("thirldImg"));
					list.add(vo);

					if (index < (start + limit) && index <= total_record)
						index++;
					else
						break;
				}
				i++;
			}
			return list;
		} catch (Exception ex) {
			System.out.println("getBoardList()      : " + ex);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return null;
	}

	public int dataTotalCount() {// 현재 모든 데이터 레코드 개수
		String sql = "SELECT count(*) FROM throwsgg.product";
		ResultSet rs = null;
		int count = 0;
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1); // 총 레코드 개수
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
		return count;
	}

	public ProductVO productDetailSelect(int productID) {// 현재 모든 데이터 레코드 개수
		String sql = "select * from throwsgg.product where productID = ?";
		ResultSet rs = null;
		ProductVO vo = null;
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new ProductVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
						rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15),
						rs.getString(16), rs.getString(17), rs.getString(18));
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
		return vo;
	}

	public boolean checkProductInCart(String userid, int product_id) {// 카트에 해당 삼푸의 존재 여부 확인
		String sql = "select exists (SELECT * FROM throwsgg.cart where userid = ? and product_id = ?);";
		ResultSet rs = null;
		boolean flag = false;
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setInt(2, product_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				flag = rs.getBoolean(1);
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
		return flag;
	}

	public void insertCart(int productID, String userid, int amount) {// 장바구니 추가
		String sql = "INSERT INTO `throwsgg`.`cart` (`userid`, `product_id`, `amount`) VALUES (?, ?, ?);";
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setInt(2, productID);
			pstmt.setInt(3, amount);
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

	public void delCart(int productID, String userid) {// 장바구니 추가
		String sql = "DELETE FROM throwsgg.cart where userid = ? and product_id = ?;";
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setInt(2, productID);
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

	public int totalCountCart(String userid) {
		String sql = "SELECT count(*) FROM throwsgg.cart where userid = ?;";
		ResultSet rs = null;
		int count = 0;
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
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
		return count;
	}

	public ArrayList<CartVO> selectCartAll(String userid) {
		String sql = "SELECT ct.CART_ID,\r\n" + "		ct.product_id,\r\n" + "        pd.pname,\r\n"
				+ "        pd.price,\r\n" + "        ct.amount,\r\n" + "        pd.firstImg\r\n"
				+ "  FROM throwsgg.cart AS ct\r\n" + " INNER JOIN throwsgg.product AS pd\r\n"
				+ "    ON ct.product_id = pd.productID where ct.userid = ?";
		ResultSet rs = null;
		ArrayList<CartVO> carVoList = new ArrayList<>();
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				carVoList.add(new CartVO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getInt(5),
						rs.getString(6)));
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
		return carVoList;
	}

	public void psOneCart(int card_id) {
		String sql = "UPDATE `throwsgg`.`cart` SET amount = amount +1 WHERE (`CART_ID` = ?);";

		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, card_id);
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

	public void MnOneCart(int card_id) {
		String sql = "UPDATE `throwsgg`.`cart` SET amount = amount -1 WHERE (`CART_ID` = ?);";

		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, card_id);
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

	public void delProductToCart(int card_id) {
		String sql = "DELETE FROM `throwsgg`.`cart` WHERE (`CART_ID` = ?)";
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, card_id);
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

	public void delProductToCartLAll(String userid) {
		String sql = "DELETE FROM `throwsgg`.`cart` WHERE (`userid` = ?)";
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
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

	public void InsertSaleOrder(String userid, String saleID, String addr, String tel, String cardName, String cardno,
			int total, String detailLink, int prodcount, String recipient) {// 장바구니 추가
		String sql = "INSERT INTO `throwsgg`.`saleorder` (`saleID`, `useriD`, `addr`, `tel`, `cardname`, `cardno`, `prodcount`, `total`, `detailLink`, `recipient`) "
				+ "VALUES (?,?,?,?,?,?,?,?,?,?);";
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, saleID);
			pstmt.setString(2, userid);
			pstmt.setString(3, addr);
			pstmt.setString(4, tel);
			pstmt.setString(5, cardName);
			pstmt.setString(6, cardno);
			pstmt.setInt(7, prodcount);
			pstmt.setInt(8, total);
			pstmt.setString(9, detailLink);
			pstmt.setString(10, recipient);
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

	public void InsertToItem(String saleID, int product_id, String pname, int amount, int totalPrice) {
		String sql = "INSERT INTO `throwsgg`.`item` (`orderID`, `prodid`, `pname`, `quantity`, `price`) VALUES (?,?,?,?,?);";
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, saleID);
			pstmt.setInt(2, product_id);
			pstmt.setString(3, pname);
			pstmt.setInt(4, amount);
			pstmt.setInt(5, totalPrice);
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

	public SaleorderVO getSaleoderData(String saleID) {
		String sql = "select * from saleorder where saleID = ?";
		ResultSet rs3 = null;
		SaleorderVO salevo = null;
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, saleID);
			rs3 = pstmt.executeQuery();
			while (rs3.next()) {
				salevo = new SaleorderVO(rs3.getString(1), rs3.getString(2), rs3.getString(3), rs3.getString(4),
						rs3.getString(5), rs3.getString(6), rs3.getString(7), rs3.getInt(8), rs3.getInt(9),
						rs3.getString(10), rs3.getString(11), rs3.getBoolean(12));
			}

		} catch (Exception e) {
			System.out.println("연결 실패!");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					rs3.close();
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return salevo;
	}

	public ArrayList<ItemVO> getItemList(String saleID) {// 현재 모든 데이터 레코드 개수
		String sql = "SELECT * FROM throwsgg.item where orderID = ?";
		ResultSet rs = null;
		ArrayList<ItemVO> ItemList = new ArrayList<>();

		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, saleID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ItemList.add(new ItemVO(rs.getString(1), rs.getString(3), rs.getInt(2), rs.getInt(4), rs.getInt(5)));
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
		return ItemList;
	}

	public void saleorderCancle(String saleID) {
		String sql = "UPDATE `throwsgg`.`saleorder` SET `status` = '0' WHERE (`saleID` = ?);";
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, saleID);
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

	public int countSearchProduct(String text) { // 검색한 목록의 상품개수 파악
		String sql = "SELECT count(*) FROM throwsgg.product where pname like like '%" + text + "%'";
		ResultSet rs = null;
		int count = 0;
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1); // 총 레코드 개수
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
		return count;
	}

	public ArrayList<ProductVO> getSearchProduct(int page, int limit, String text) {// 검색한 목록을 가져옴
		int total_record = countSearchProduct(text);
		int start = (page - 1) * limit;
		int index = start + 1;
		ResultSet rs = null;
		String sql = "select * from throwsgg.product where pname like '%" + text + "%' ORDER BY productID DESC";
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int i = 0;
			while (rs.next()) {
//				if (i >= index - 1) {
					ProductVO vo = new ProductVO();
					vo.setProductID(rs.getInt("productID"));
					vo.setCategory(rs.getString("category"));
					vo.setPname(rs.getString("pname"));
					vo.setPrice(rs.getInt("price"));
					vo.setStock(rs.getInt("stock"));
					vo.setInputdate(rs.getString("inputdate"));
					vo.setDescription(rs.getString("description"));
					vo.setFirstImg(rs.getString("firstImg"));
//	               vo.setSeconImg(rs.getString("secondImg"));
//	               vo.setThirldImg(rs.getString("thirldImg"));
					list.add(vo);

//					if (index < (start + limit) && index <= total_record)
//						index++;
//					else
//						break;
				}
//				i++;
//			}
			return list;
		} catch (Exception ex) {
			System.out.println("getBoardList()      : " + ex);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return null;
	}

	public int countPriceFilter(String[] checkArray) { // 필터로 거른 갯수 파악
		String sql = null;
		if (checkArray.length == 1) {
			if (checkArray[0].equals("5000")) {
				sql = "SELECT count(*) FROM throwsgg.product where price <= 5000";
			} else if (checkArray[0].equals("10000")) {
				sql = "SELECT count(*) FROM throwsgg.product where price > 5000 and price <= 10000";
			} else if (checkArray[0].equals("50000")) {
				sql = "SELECT count(*) FROM throwsgg.product where price > 10000 and price <= 50000";
			} else if (checkArray[0].equals("noLimit")) {
				sql = "SELECT count(*) FROM throwsgg.product where price > 50000";
			}
		} else if (checkArray.length == 2) {
			if (checkArray[0].equals("5000") && checkArray[1].equals("10000")) {
				sql = "SELECT count(*) FROM throwsgg.product where price <= 10000";
			} else if (checkArray[0].equals("5000") && checkArray[1].equals("50000")) {
				sql = "SELECT count(*) FROM throwsgg.product where price <= 5000 or (price > 10000 and price <= 50000)";
			} else if (checkArray[0].equals("5000") && checkArray[1].equals("noLimit")) {
				sql = "SELECT count(*) FROM throwsgg.product where price <= 5000 or price > 50000";
			} else if (checkArray[0].equals("10000") && checkArray[1].equals("50000")) {
				sql = "SELECT count(*) FROM throwsgg.product where price > 5000 and price <= 50000";
			} else if (checkArray[0].equals("10000") && checkArray[1].equals("noLimit")) {
				sql = "SELECT count(*) FROM throwsgg.product where price > 5000 and price <= 10000 or price >50000";
			} else if (checkArray[0].equals("50000") && checkArray[1].equals("noLimit")) {
				sql = "SELECT count(*) FROM throwsgg.product where price > 10000";
			}
		} else if (checkArray.length == 3) {
			if (checkArray[0].equals("5000") && checkArray[1].equals("10000") && checkArray[2].equals("50000")) {
				sql = "SELECT count(*) FROM throwsgg.product where price <= 50000 ";
			} else if (checkArray[0].equals("5000") && checkArray[1].equals("10000")
					&& checkArray[2].equals("noLimit")) {
				sql = "SELECT count(*) FROM throwsgg.product where price <= 10000 or price >50000 ";
			} else if (checkArray[0].equals("5000") && checkArray[1].equals("50000")
					&& checkArray[2].equals("noLimit")) {
				sql = "SELECT count(*) FROM throwsgg.product where price <= 5000 or price > 10000 ";
			} else if (checkArray[0].equals("10000") && checkArray[1].equals("50000")
					&& checkArray[2].equals("noLimit")) {
				sql = "SELECT count(*) FROM throwsgg.product where price > 5000";
			}
		} else if (checkArray.length == 4) {
			sql = "SELECT count(*) FROM throwsgg.product";
		}

		ResultSet rs = null;
		int count = 0;
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1); // 총 레코드 개수
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
		return count;
	}

	public ArrayList<ProductVO> getPriceFilterProduct(int page, int limit, String[] checkArray) {// 돈필터된 목록을 가져옴
		int total_record = countPriceFilter(checkArray);
		int start = (page - 1) * limit;
		int index = start + 1;
		ResultSet rs = null;
		String sql = null;
		if (checkArray.length == 1) {
			if (checkArray[0].equals("5000")) {
				sql = "SELECT * FROM throwsgg.product where price <= 5000 ORDER BY productID DESC";
			} else if (checkArray[0].equals("10000")) {
				sql = "SELECT * FROM throwsgg.product where price > 5000 and price <= 10000 ORDER BY productID DESC";
			} else if (checkArray[0].equals("50000")) {
				sql = "SELECT * FROM throwsgg.product where price > 10000 and price <= 50000 ORDER BY productID DESC";
			} else if (checkArray[0].equals("noLimit")) {
				sql = "SELECT * FROM throwsgg.product where price > 50000 ORDER BY productID DESC";
			}
		} else if (checkArray.length == 2) {
			if (checkArray[0].equals("5000") && checkArray[1].equals("10000")) {
				sql = "SELECT * FROM throwsgg.product where price <= 10000 ORDER BY productID DESC";
			} else if (checkArray[0].equals("5000") && checkArray[1].equals("50000")) {
				sql = "SELECT * FROM throwsgg.product where price <= 5000 or (price > 10000 and price <= 50000) ORDER BY productID DESC";
			} else if (checkArray[0].equals("5000") && checkArray[1].equals("noLimit")) {
				sql = "SELECT * FROM throwsgg.product where price <= 5000 or price > 50000 ORDER BY productID DESC";
			} else if (checkArray[0].equals("10000") && checkArray[1].equals("50000")) {
				sql = "SELECT * FROM throwsgg.product where price > 5000 and price <= 50000 ORDER BY productID DESC";
			} else if (checkArray[0].equals("10000") && checkArray[1].equals("noLimit")) {
				sql = "SELECT * FROM throwsgg.product where price > 5000 and price <= 10000 or price >50000 ORDER BY productID DESC";
			} else if (checkArray[0].equals("50000") && checkArray[1].equals("noLimit")) {
				sql = "SELECT * FROM throwsgg.product where price > 10000 ORDER BY productID DESC";
			}
		} else if (checkArray.length == 3) {
			if (checkArray[0].equals("5000") && checkArray[1].equals("10000") && checkArray[2].equals("50000")) {
				sql = "SELECT * FROM throwsgg.product where price <= 50000 ORDER BY productID DESC";
			} else if (checkArray[0].equals("5000") && checkArray[1].equals("10000")
					&& checkArray[2].equals("noLimit")) {
				sql = "SELECT * FROM throwsgg.product where price <= 10000 or price >50000 ORDER BY productID DESC";
			} else if (checkArray[0].equals("5000") && checkArray[1].equals("50000")
					&& checkArray[2].equals("noLimit")) {
				sql = "SELECT * FROM throwsgg.product where price <= 5000 or price > 10000 ORDER BY productID DESC";
			} else if (checkArray[0].equals("10000") && checkArray[1].equals("50000")
					&& checkArray[2].equals("noLimit")) {
				sql = "SELECT * FROM throwsgg.product where price > 5000 ORDER BY productID DESC";
			}
		} else if (checkArray.length == 4) {
			sql = "SELECT * FROM throwsgg.product ORDER BY productID DESC";
		}
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int i = 0;
			while (rs.next()) {
				if (i >= index - 1) {
					ProductVO vo = new ProductVO();
					vo.setProductID(rs.getInt("productID"));
					vo.setCategory(rs.getString("category"));
					vo.setPname(rs.getString("pname"));
					vo.setPrice(rs.getInt("price"));
					vo.setStock(rs.getInt("stock"));
					vo.setInputdate(rs.getString("inputdate"));
					vo.setDescription(rs.getString("description"));
					vo.setFirstImg(rs.getString("firstImg"));
//	               vo.setSeconImg(rs.getString("secondImg"));
//	               vo.setThirldImg(rs.getString("thirldImg"));
					list.add(vo);

					if (index < (start + limit) && index <= total_record)
						index++;
					else
						break;
				}
				i++;
			}
			return list;
		} catch (Exception ex) {
			System.out.println("getBoardList()      : " + ex);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return null;
	}

	public int countCateFilter(String[] checkArray) { // 필터로 거른 갯수 파악
		String sql = null;
		if (checkArray.length == 1) {
			if (checkArray[0].equals("food")) {
				sql = "SELECT count(*) FROM throwsgg.product where category = '사료'";
			} else if (checkArray[0].equals("health")) {
				sql = "SELECT count(*) FROM throwsgg.product where category = '건강'";
			} else if (checkArray[0].equals("hygiene")) {
				sql = "SELECT count(*) FROM throwsgg.product where category = '위생'";
			} else if (checkArray[0].equals("salon")) {
				sql = "SELECT count(*) FROM throwsgg.product where category = '미용'";
			}
		} else if (checkArray.length == 2) {
			if (checkArray[0].equals("food") && checkArray[1].equals("health")) {
				sql = "SELECT count(*) FROM throwsgg.product where category = '사료' or category = '건강' ";
			} else if (checkArray[0].equals("food") && checkArray[1].equals("hygiene")) {
				sql = "SELECT count(*) FROM throwsgg.product where category = '사료' or category = '위생'";
			} else if (checkArray[0].equals("food") && checkArray[1].equals("salon")) {
				sql = "SELECT count(*) FROM throwsgg.product where category = '사료' or category = '미용'";
			} else if (checkArray[0].equals("health") && checkArray[1].equals("hygiene")) {
				sql = "SELECT count(*) FROM throwsgg.product where category = '건강' or category = '위생'";
			} else if (checkArray[0].equals("health") && checkArray[1].equals("salon")) {
				sql = "SELECT count(*) FROM throwsgg.product where category = '건강' or category = '미용'";
			} else if (checkArray[0].equals("hygiene") && checkArray[1].equals("salon")) {
				sql = "SELECT count(*) FROM throwsgg.product where category = '위생' or category = '미용'";
			}
		} else if (checkArray.length == 3) {
			if (checkArray[0].equals("food") && checkArray[1].equals("health") && checkArray[2].equals("hygiene")) {
				sql = "SELECT count(*) FROM throwsgg.product where category = '건강' or category = '위생' or category = '사료' ";
			} else if (checkArray[0].equals("food") && checkArray[1].equals("health")
					&& checkArray[2].equals("salon")) {
				sql = "SELECT count(*) FROM throwsgg.product where category = '건강' or category = '미용' or category = '사료'";
			} else if (checkArray[0].equals("food") && checkArray[1].equals("hygiene")
					&& checkArray[2].equals("salon")) {
				sql = "SELECT count(*) FROM throwsgg.product where category = '미용' or category = '위생' or category = '사료'";
			} else if (checkArray[0].equals("health") && checkArray[1].equals("hygiene")
					&& checkArray[2].equals("salon")) {
				sql = "SELECT count(*) FROM throwsgg.product where category = '건강' or category = '위생' or category = '미용'";
			}
		} else if (checkArray.length == 4) {
			sql = "SELECT count(*) FROM throwsgg.product";
		}

		ResultSet rs = null;
		int count = 0;
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1); // 총 레코드 개수
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
		return count;
	}

	public ArrayList<ProductVO> getCateFilterProduct(int page, int limit, String[] checkArray) {// 돈필터된 목록을 가져옴
		int total_record = countCateFilter(checkArray);
		int start = (page - 1) * limit;
		int index = start + 1;
		ResultSet rs = null;
		String sql = null;
		if (checkArray.length == 1) {
			if (checkArray[0].equals("food")) {
				sql = "SELECT * FROM throwsgg.product where category = '사료'";
			} else if (checkArray[0].equals("health")) {
				sql = "SELECT * FROM throwsgg.product where category = '건강'";
			} else if (checkArray[0].equals("hygiene")) {
				sql = "SELECT * FROM throwsgg.product where category = '위생'";
			} else if (checkArray[0].equals("salon")) {
				sql = "SELECT * FROM throwsgg.product where category = '미용'";
			}
		} else if (checkArray.length == 2) {
			if (checkArray[0].equals("food") && checkArray[1].equals("health")) {
				sql = "SELECT * FROM throwsgg.product where category = '사료' or category = '건강' ";
			} else if (checkArray[0].equals("food") && checkArray[1].equals("hygiene")) {
				sql = "SELECT * FROM throwsgg.product where category = '사료' or category = '위생'";
			} else if (checkArray[0].equals("food") && checkArray[1].equals("salon")) {
				sql = "SELECT * FROM throwsgg.product where category = '사료' or category = '미용'";
			} else if (checkArray[0].equals("health") && checkArray[1].equals("hygiene")) {
				sql = "SELECT * FROM throwsgg.product where category = '건강' or category = '위생'";
			} else if (checkArray[0].equals("health") && checkArray[1].equals("salon")) {
				sql = "SELECT * FROM throwsgg.product where category = '건강' or category = '미용'";
			} else if (checkArray[0].equals("hygiene") && checkArray[1].equals("salon")) {
				sql = "SELECT * FROM throwsgg.product where category = '위생' or category = '미용'";
			}
		} else if (checkArray.length == 3) {
			if (checkArray[0].equals("food") && checkArray[1].equals("health") && checkArray[2].equals("hygiene")) {
				sql = "SELECT * FROM throwsgg.product where category = '건강' or category = '위생' or category = '사료' ";
			} else if (checkArray[0].equals("food") && checkArray[1].equals("health")
					&& checkArray[2].equals("salon")) {
				sql = "SELECT * FROM throwsgg.product where category = '건강' or category = '미용' or category = '사료'";
			} else if (checkArray[0].equals("food") && checkArray[1].equals("hygiene")
					&& checkArray[2].equals("salon")) {
				sql = "SELECT * FROM throwsgg.product where category = '미용' or category = '위생' or category = '사료'";
			} else if (checkArray[0].equals("health") && checkArray[1].equals("hygiene")
					&& checkArray[2].equals("salon")) {
				sql = "SELECT * FROM throwsgg.product where category = '건강' or category = '위생' or category = '미용'";
			}
		} else if (checkArray.length == 4) {
			sql = "SELECT * FROM throwsgg.product";
		}
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int i = 0;
			while (rs.next()) {
				if (i >= index - 1) {
					ProductVO vo = new ProductVO();
					vo.setProductID(rs.getInt("productID"));
					vo.setCategory(rs.getString("category"));
					vo.setPname(rs.getString("pname"));
					vo.setPrice(rs.getInt("price"));
					vo.setStock(rs.getInt("stock"));
					vo.setInputdate(rs.getString("inputdate"));
					vo.setDescription(rs.getString("description"));
					vo.setFirstImg(rs.getString("firstImg"));
//	               vo.setSeconImg(rs.getString("secondImg"));
//	               vo.setThirldImg(rs.getString("thirldImg"));
					list.add(vo);

					if (index < (start + limit) && index <= total_record)
						index++;
					else
						break;
				}
				i++;
			}
			return list;
		} catch (Exception ex) {
			System.out.println("getBoardList()      : " + ex);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return null;
	}
}
