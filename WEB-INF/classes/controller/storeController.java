package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.AddCartAction;
import action.DelProductToCart;
import action.DetailSelectAction;
import action.DetailViewCartAction;
import action.DropCartAction;
import action.InsertSaleOrderAction;
import action.MnOneCartAction;
import action.OrderCancleAction;
import action.OrderDetailAction;
import action.ProductSearchAction;
import action.ProductSelectAction;
import action.PsOneCartAction;
import action.Tocheckout;
import action.categoryFilteringAction;
import action.productPriceFilter;
import action.totalCountCartAction;
import dao.MemberDAO;
import vo.ActionForward;

/**
 * Servlet implementation class storeController
 */
@WebServlet("*.str")
public class storeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public storeController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("storeController start");
		request.setCharacterEncoding("UTF-8");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;
		if (command.equals("/shop.str")) {
			action = new ProductSelectAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/shopDetail.str")) {
			action = new DetailSelectAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/addCart.str")) {
			action = new AddCartAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/dropCart.str")) {
			action = new DropCartAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/totalCountCart.str")) {
			action = new totalCountCartAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/DetailViewCart.str")) {
			action = new DetailViewCartAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/PsOneCart.str")) {
			action = new PsOneCartAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MnOneCart.str")) {
			action = new MnOneCartAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/delProductToCart.str")) {
			action = new DelProductToCart();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/Tocheckout.str")) {
			action = new Tocheckout();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/InsertSaleOrder.str")) {
			action = new InsertSaleOrderAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/orderDetail.str")) {
			action = new OrderDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/orderCancle.str")) {
			action = new OrderCancleAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/review.str")) {
			MemberDAO review = new MemberDAO();
			HttpSession session = request.getSession();
			int item = Integer.parseInt(request.getParameter("item"));
			float score = Float.parseFloat(request.getParameter("score"));
			String comment = request.getParameter("comment");
			String id = (String) session.getAttribute("id");
			String nickname = (String) session.getAttribute("nickname");
			review.insert_review(id, nickname, item, score, comment);
		} else if (command.equals("/delreview.str")) {
			MemberDAO del_review = new MemberDAO();
			int num = Integer.parseInt(request.getParameter("num"));
			del_review.delreview(num);
		} else if (command.equals("/searchProduct.str")) { // 검색창에 제품 검색
			action = new ProductSearchAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/priceFiltering.str")) {
			action = new productPriceFilter();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/categoryFiltering.str")) {
			action = new categoryFilteringAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (forward != null) {

			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}

		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

}
