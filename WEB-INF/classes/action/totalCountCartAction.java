package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import vo.ActionForward;

public class totalCountCartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("SelectCartAction start");
		PrintWriter out = response.getWriter();
		int totalCountCart = 0;
		ProductDAO instance = ProductDAO.getInstance();
		String userid = request.getParameter("userid");
		if(userid != null)
			totalCountCart = instance.totalCountCart(userid);
		out.print(totalCountCart);
		out.close();
		return null;
	}

}
