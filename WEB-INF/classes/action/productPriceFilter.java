package action;


import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.ProductDAO;
import vo.ActionForward;
import vo.IndexCommentsVO;
import vo.ProductVO;

public class productPriceFilter implements Action{
	private static final int LISTCOUNT = 6;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductPriceFilter start");
		
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("id");
		String[] checkArray=null;
		if(request.getParameterValues("price")==null) {
			checkArray= new String[4];
		}else {
			checkArray = request.getParameterValues("price");
		}

		
		ActionForward forward = new ActionForward();
		ArrayList<Boolean> checkCartList = null;//shop.jsp 페이지에서 보여주는 상품들의 카트 추가 여부확인을 위한 리스트
		int pageNum = 1;
		int limit = LISTCOUNT;
		if (request.getParameter("pageNum") != null)
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		ProductDAO instance = ProductDAO.getInstance();
		
		ArrayList<ProductVO> productList=instance.getPriceFilterProduct(pageNum, limit, checkArray);
		
		int total_record = instance.countPriceFilter(checkArray);
		int total_page;
		if (total_record % limit == 0) {
			total_page = total_record / limit;
			Math.floor(total_page);
		} else {
			total_page = total_record / limit;
			Math.floor(total_page);
			total_page = total_page + 1;
		}
		
		if(userid != null) {
			checkCartList = new ArrayList<>();
			for (int i = 0; i < productList.size(); i++) {
				checkCartList.add(instance.checkProductInCart(userid, productList.get(i).getProductID()));
			}
		}

		//jacky 추가
		String[] checkCnt=new String[]{"5000"};
		int productCnt1= instance.countPriceFilter(checkCnt);
		checkCnt=new String[]{"10000"};
		int productCnt2= instance.countPriceFilter(checkCnt);
		checkCnt=new String[]{"50000"};
		int productCnt3= instance.countPriceFilter(checkCnt);
		checkCnt=new String[]{"noLimit"};
		int productCnt4= instance.countPriceFilter(checkCnt);
		//추가 끝
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_page", total_page);
		request.setAttribute("total_record", total_record);
		request.setAttribute("productList", productList);
		request.setAttribute("checkCartList", checkCartList);
		
		request.setAttribute("checkArray",checkArray);

		//jacky2
		request.setAttribute("productCnt1", productCnt1);
		request.setAttribute("productCnt2", productCnt2);
		request.setAttribute("productCnt3", productCnt3);
		request.setAttribute("productCnt4", productCnt4);
		
		
		System.out.println("pageNum : " + pageNum);		
		System.out.println("total_page : " + total_page);
		
		System.out.println("total_record : " + total_record);
		System.out.println("productList : " + productList);
//		System.out.println("pageNum : "+productList);
//		forward.setPath("/shop.str");
		forward.setPath("/store/shop.jsp");
		System.out.println("ProductPriceFilterAction end");

		return forward;
	}

}
