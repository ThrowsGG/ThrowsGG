package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDAO;
import vo.ActionForward;
import vo.CartVO;
import vo.ItemVO;
import vo.SaleorderVO;

public class OrderDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderDetailAction start");
		ActionForward forward = new ActionForward();
		forward.setPath("/orderDetail.jsp"); 
		ProductDAO instance = ProductDAO.getInstance();
		String saleID = request.getParameter("saleID");
		System.out.println("OrderDetailAction : "+saleID);
		ArrayList<ItemVO> ItemVOList = instance.getItemList(saleID);
		SaleorderVO salevo = instance.getSaleoderData(saleID);
		request.setAttribute("ItemVOList",ItemVOList);
		int totalMoney = 0;
		for (int i = 0; i < ItemVOList.size(); i++) {
			totalMoney += ItemVOList.get(i).getPrice();
		}
		request.setAttribute("totalMoney", totalMoney);
		request.setAttribute("salevo", salevo);
		System.out.println("OrderDetailAction : "+ItemVOList);
		System.out.println("OrderDetailAction : "+totalMoney);
		System.out.println("OrderDetailAction : "+salevo.toString());
		return forward;
	}

}
