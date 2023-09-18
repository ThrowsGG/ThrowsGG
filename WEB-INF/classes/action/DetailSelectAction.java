package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDAO;
import vo.ActionForward;
import vo.ProductVO;

public class DetailSelectAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("DetailSelectAction start");
		HttpSession session = request.getSession();
		boolean checkCart = false;
		ActionForward forward = new ActionForward();
		forward.setPath("/store/detail.jsp");
		ProductDAO instance = ProductDAO.getInstance();
		int productID = Integer.parseInt(request.getParameter("productID"));
		String userid = (String) session.getAttribute("id");
		ProductVO vo = instance.productDetailSelect(productID);
		if (userid != null)
			checkCart = instance.checkProductInCart(userid, productID);
		request.setAttribute("productVO", vo);
		request.setAttribute("checkCart", checkCart);
		System.out.println("DetailSelectAction : " + vo.toString());

		return forward;
	}

}
