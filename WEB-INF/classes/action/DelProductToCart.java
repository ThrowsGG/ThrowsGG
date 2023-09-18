package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import vo.ActionForward;

public class DelProductToCart implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("DelProductToCart start");
		ProductDAO instance = ProductDAO.getInstance();
		instance.delProductToCart(Integer.parseInt(request.getParameter("cart_ID")));
		return null;
	}
}
