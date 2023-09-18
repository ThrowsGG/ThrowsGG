package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import vo.ActionForward;
import vo.CartVO;

public class DetailViewCartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("DetailViewCartAction start");
		ActionForward forward = new ActionForward();
		forward.setPath("/store/cart.jsp");
		int totalMoney = 0;
		ProductDAO instance = ProductDAO.getInstance();
		ArrayList<CartVO> carVoList = instance.selectCartAll(request.getParameter("userid"));
		for (int i = 0; i < carVoList.size(); i++) {
			totalMoney+= carVoList.get(i).getTotalPrice();
		}
		request.setAttribute("carVoList", carVoList);
		request.setAttribute("totalMoney", totalMoney);
		return forward;
	}

}
