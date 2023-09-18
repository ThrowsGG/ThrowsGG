package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import vo.ActionForward;
import vo.CartVO;

public class InsertSaleOrderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("InsertSaleOrderAction start");
		ProductDAO instance = ProductDAO.getInstance();
		String userid = request.getParameter("userid");
		String saleID = request.getParameter("saleID");
		String recipient = request.getParameter("recipient");
		String addr = request.getParameter("addr");
		String tel = request.getParameter("tel");
		String cardName = request.getParameter("cardName");
		String cardno = request.getParameter("cardno");
		int total = Integer.parseInt(request.getParameter("total"));
		String detailLink = request.getParameter("detailLink");
		int prodcount = Integer.parseInt(request.getParameter("prodcount"));
		instance.InsertSaleOrder(userid, saleID, addr, tel, cardName, cardno, total, detailLink,prodcount,recipient);
		ArrayList<CartVO> carVoList = instance.selectCartAll(userid);// 현재 장바구니 목록 
		for (CartVO cartVO : carVoList) {
			 System.out.println(cartVO.toString());
			instance.InsertToItem(saleID,cartVO.getProduct_id(),cartVO.getPname(),cartVO.getAmount(),cartVO.getTotalPrice());//item table에 데이터 입력
			
		}		
		instance.delProductToCartLAll(userid);// 장바구니 초기화
		return null;
	}
}
