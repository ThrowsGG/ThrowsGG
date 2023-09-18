package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.parser.ParseException;

import action.Action;
import action.blogSingleChildDeleteAction;
import action.blogSingleChildInsertAction;
import action.blogSingleChildModifyAction;
import action.blogSingleDeleteAction;
import action.blogSingleInsertAction;
import action.blogSingleModifyAction;
import action.blogSingleReservationAction;
import action.blogSingleSelectAction;
import dao.IndexCommentsDAO;
import gg.ApiManagement;
import vo.AbandonList;
import vo.ActionForward;
import vo.DateAbandon;
import vo.IndexCommentsVO;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.bgs")
public class bgSingleCommentsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("bgSingleCommentsController");
		request.setCharacterEncoding("UTF-8");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		System.out.println(command);
		ActionForward forward = null;
		Action action = null;
		if (command.equals("/blog-singleInsert.bgs")) {
			action = new blogSingleInsertAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/blog-singleDelete.bgs")) {
			action = new blogSingleDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/blog-singleModify.bgs")) {
			action = new blogSingleModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/blog-singleSelect.bgs")) {
			action = new blogSingleSelectAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ChildCommentInsert.bgs")) {
			System.out.println("ChildCommentInsert 호출1");
			action = new blogSingleChildInsertAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ChildCommentDelete.bgs")) {
			System.out.println("ChildCommentDelete 호출1");
			action = new blogSingleChildDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ChildCommentModify.bgs")) {
			System.out.println("ChildCommentModify 호출1");
			action = new blogSingleChildModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/reservation.bgs")) {
			System.out.println("reservation 호출1");
			action = new blogSingleReservationAction();
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		System.out.println("blogSingleServlet : servlet호출 get 방식");
		DateAbandon vo = new DateAbandon();
		vo.setDesertionNo(request.getParameter("desertionNo"));
		vo.setFilename(request.getParameter("filename"));
		vo.setHappenDt(request.getParameter("happenDt"));
		vo.setHappenPlace(request.getParameter("happenPlace"));
		vo.setKindCd(request.getParameter("kindCd"));
		vo.setColorCd(request.getParameter("colorCd"));
		vo.setAge(request.getParameter("age"));
		vo.setWeight(request.getParameter("weight"));
		vo.setNoticeNo(request.getParameter("noticeNo"));
		vo.setNoticeSdt(request.getParameter("noticeSdt"));
		vo.setNoticeEdt(request.getParameter("noticeEdt"));
		vo.setPopfile(request.getParameter("popfile"));
		vo.setProcessState(request.getParameter("processState"));
		vo.setSexCd(request.getParameter("sexCd"));
		vo.setNeuterYn(request.getParameter("neuterYn"));
		vo.setSpecialMark(request.getParameter("specialMark"));
		vo.setCareNm(request.getParameter("careNm"));
		vo.setCareTel(request.getParameter("careTel"));
		vo.setCareAddr(request.getParameter("careAddr"));
		vo.setOrgNm(request.getParameter("orgNm"));
		vo.setChargeNm(request.getParameter("chargeNm"));
		vo.setOfficetel(request.getParameter("officetel"));
		vo.setTotalCount(request.getParameter("totalCount"));
		ServletContext context = this.getServletContext();
		IndexCommentsDAO indexCommenysDAO = IndexCommentsDAO.getInstance();
		ArrayList<IndexCommentsVO> commentList = indexCommenysDAO.selectComments(vo.getDesertionNo());
		request.setAttribute("commentList", commentList);
		request.setAttribute("abvo", vo);
		request.setAttribute("checkReserve",indexCommenysDAO.checkReservation(vo.getDesertionNo()) );//해당 유기번호의 예약 
		RequestDispatcher dispatcher = context.getRequestDispatcher("/blog-single.jsp"); // 넘길 페이지 주소
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);

	}

}
