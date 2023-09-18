package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import vo.ActionForward;

public class DropCartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("DropCartAction start");
		ProductDAO instance = ProductDAO.getInstance();
		int productID = Integer.parseInt(request.getParameter("product_id"));
		String userid = request.getParameter("userid");
		instance.delCart(productID, userid);

		return null;
	}

}
