package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import vo.ActionForward;

public class PsOneCartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("PsOneCartAction start");
		int card_id = Integer.parseInt(request.getParameter("card_id"));
		ProductDAO instance = ProductDAO.getInstance();
		instance.psOneCart(card_id);
		return null;
	}

}
