package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import dao.paymentService;
import vo.ActionForward;

public class OrderCancleAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		System.out.println("OrderCancleAction start");
		PrintWriter out = response.getWriter();
		paymentService payment = new paymentService();
		ActionForward forward = new ActionForward();
		forward.setPath("/userinfo.jsp");
		ProductDAO instance = ProductDAO.getInstance();
		String saleID = request.getParameter("saleID");
		instance.saleorderCancle(saleID);
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		payment.payMentCancle(payment.getToken(), saleID, totalPrice, "test_cansel");
		out.println("<script>alert('주문이 취소되었습니다'); location.href='userinfo.jsp';</script>");
		return null;
	}

}
