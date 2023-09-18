package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import vo.ActionForward;

public class MnOneCartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MnOneCartAction start");
		int card_id = Integer.parseInt(request.getParameter("card_id"));
		ProductDAO instance = ProductDAO.getInstance();
		instance.MnOneCart(card_id);
		return null;
	}

}
