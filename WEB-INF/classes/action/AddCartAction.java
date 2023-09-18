package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import vo.ActionForward;

public class AddCartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AddCartAction start");
		ProductDAO instance = ProductDAO.getInstance();
		int productID = Integer.parseInt(request.getParameter("product_id"));
		String userid = request.getParameter("userid");
		int amount = Integer.parseInt(request.getParameter("amount"));
//		System.out.println("AddCartActio => productID : "+productID+" userid : "+userid+" amount : "+amount);
		instance.insertCart(productID,userid,amount);
		
		return null;
	}

}
