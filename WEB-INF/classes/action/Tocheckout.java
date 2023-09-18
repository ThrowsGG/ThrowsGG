package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDAO;
import vo.ActionForward;
import vo.CartVO;

public class Tocheckout implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Tocheckout start");
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		forward.setPath("/store/checkout.jsp");
		ProductDAO instance = ProductDAO.getInstance();
		ArrayList<CartVO> carVoList = instance.selectCartAll((String)session.getAttribute("id"));
		int totalMoney = 0;
		for (int i = 0; i < carVoList.size(); i++) {
			totalMoney += carVoList.get(i).getTotalPrice();
		}
		request.setAttribute("carVoList", carVoList);
		request.setAttribute("totalMoney", totalMoney);
		return forward;
	}

}
