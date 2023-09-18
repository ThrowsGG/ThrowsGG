package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;
import mvc.model.BoardDTO;

public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 2;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());

		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");

		if (command.equals("/BoardListAction.do")) {// ϵ ϱ
			System.out.println("/BoardListAction.do호출");
			requestBoardList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./contact.jsp");
			rd.forward(request, response);
			System.out.println("/BoardListAction.do끝");
		} else if (command.equals("/BoardWriteForm.do")) { // ϱ
			requestLoginName(request);
			RequestDispatcher rd = request.getRequestDispatcher("./board/writeForm.jsp");
			rd.forward(request, response);
		} else if (command.equals("/BoardWriteAction.do")) {// ο ϱ
			requestBoardWrite(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);
		} else if (command.equals("/BoardViewAction.do")) {// õ
			System.out.println("BoardViewAction 호출");
			requestBoardView(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardView.do");
			rd.forward(request, response);
			System.out.println("BoardViewAction 종료");
		} else if (command.equals("/BoardView.do")) { // ϱ
			System.out.println("BoardView 호출");
			RequestDispatcher rd = request.getRequestDispatcher("./board/view.jsp");
			rd.forward(request, response);
			System.out.println("BoardView 종료");
		} else if (command.equals("/BoardUpdateAction.do")) { // õ ȸ ϱ
			System.out.println("BoardUpdateAction 호출1");
			requestBoardUpdate(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);
		} else if (command.equals("/BoardDeleteAction.do")) { // õ ϱ
			requestBoardDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);
		}

		else if (command.equals("/BoardWriteFindPet.do")) { // ϱ
			System.out.println("Findpetttttt 호출3");
			requestLoginName(request);
			RequestDispatcher rd = request.getRequestDispatcher("./board/findPet.jsp");
			rd.forward(request, response);
		} else if (command.equals("/BoardFindPet.do")) {// ο ϱ
			requestBoardWrite(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);
		} else if (command.equals("/BoardViewPetAction.do")) {// õ
			System.out.println("BoardViewPetAction 호출");
			requestBoardView(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardPetView.do");
			rd.forward(request, response);
			System.out.println("BoardViewPetAction 종료");
		} else if (command.equals("/BoardPetView.do")) { // ϱ
			System.out.println("BoardPetView 호출");
			RequestDispatcher rd = request.getRequestDispatcher("./board/viewPet.jsp");
			rd.forward(request, response);
			System.out.println("BoardPetView 종료");
		} else if (command.equals("/BoardPetUpdateAction.do")) { // õ ȸ ϱ
			System.out.println("BoardPetUpdateAction 호출1");
			requestBoardUpdate(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);
		}

		else if (command.equals("/BoardModifyPetAction.do")) {// õ
			System.out.println("BoardModifyPetAction 호출");
			requestLoginName(request);
			requestBoardView(request);
			RequestDispatcher rd = request.getRequestDispatcher("./board/modifyForm.jsp");
			rd.forward(request, response);
			System.out.println("BoardModifyPetAction 종료");
		}

	}

	// ϵ
	public void requestBoardList(HttpServletRequest request) {

		BoardDAO dao = BoardDAO.getInstance();
		List<BoardDTO> boardlist = new ArrayList<BoardDTO>();

		int pageNum = 1;
		int limit = LISTCOUNT;

		if (request.getParameter("pageNum") != null)
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		System.out.println("pageNum " + pageNum);
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		System.out.println("items"+items);
		System.out.println("text"+text);

		int total_record = dao.getListCount(items, text);
		boardlist = dao.getBoardList(pageNum, limit, items, text);

		int total_page;

		if (total_record % limit == 0) {
			total_page = total_record / limit;
			Math.floor(total_page);
		} else {
			total_page = total_record / limit;
			Math.floor(total_page);
			total_page = total_page + 1;
		}

		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_page", total_page);
		request.setAttribute("total_record", total_record);
		request.setAttribute("boardlist", boardlist);
	}

	// ڸ
	public void requestLoginName(HttpServletRequest request) {

		String id = request.getParameter("id");

		BoardDAO dao = BoardDAO.getInstance();

		String name = dao.getLoginNameById(id);

		request.setAttribute("name", name);
	}

	// ο ϱ
//   public void requestBoardWrite(HttpServletRequest request) {
//
//      BoardDAO dao = BoardDAO.getInstance();
//
//      BoardDTO board = new BoardDTO();
//      board.setId(request.getParameter("id"));
//      board.setName(request.getParameter("name"));
//      board.setSubject(request.getParameter("subject"));
//      board.setContent(request.getParameter("content"));
//      // board.setContent(request.getParameter("editor"));
//
//      System.out.println(request.getParameter("name"));
//      System.out.println(request.getParameter("subject"));
//      System.out.println(request.getParameter("content"));
//      java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
//      String regist_day = formatter.format(new java.util.Date());
//
//      board.setHit(0);
//      board.setRegist_day(regist_day);
//
//      dao.insertBoard(board);
//   }

	// 동물분실신고
	public void requestBoardWrite(HttpServletRequest request) {

		BoardDAO dao = BoardDAO.getInstance();

		BoardDTO board = new BoardDTO();
		board.setId(request.getParameter("id"));
		board.setName(request.getParameter("name"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));
		// board.setContent(request.getParameter("editor"));

		System.out.println(request.getParameter("name"));
		System.out.println(request.getParameter("subject"));
		System.out.println(request.getParameter("content"));
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String regist_day = formatter.format(new java.util.Date());
		board.setHit(0);
		board.setRegist_day(regist_day);
		board.setPhone(request.getParameter("phone"));
		board.setPetName(request.getParameter("petName"));
		board.setBreed(request.getParameter("breed"));
		board.setLostDate(request.getParameter("lostDate"));
		board.setGender(request.getParameter("gender"));
		board.setAge(request.getParameter("age"));
		board.setLostPlace(request.getParameter("lostPlace"));
		board.setFigure(request.getParameter("figure"));
		board.setPetImg(request.getParameter("petPicture"));

	

		dao.insertBoard(board);
	}

	// õ
	public void requestBoardView(HttpServletRequest request) {

		BoardDAO dao = BoardDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));

		BoardDTO board = new BoardDTO();
		board = dao.getBoardByNum(num, pageNum);

		request.setAttribute("num", num);
		request.setAttribute("page", pageNum);
		request.setAttribute("board", board);

	}

	// õ ϱ
	public void requestBoardUpdate(HttpServletRequest request) {
		System.out.println("BoardUpdateAction 호출2");
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));

		BoardDAO dao = BoardDAO.getInstance();

		BoardDTO board = new BoardDTO();
		board.setNum(num);
		board.setName(request.getParameter("name"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));

		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String regist_day = formatter.format(new java.util.Date());

		board.setHit(0);
		board.setRegist_day(regist_day);

		board.setPhone(request.getParameter("phone"));
		board.setPetName(request.getParameter("petName"));
		board.setBreed(request.getParameter("breed"));
		board.setLostDate(request.getParameter("lostDate"));
		board.setGender(request.getParameter("gender"));
		board.setAge(request.getParameter("age"));
		board.setLostPlace(request.getParameter("lostPlace"));
		board.setFigure(request.getParameter("figure"));
		board.setPetImg(request.getParameter("petPicture"));

		dao.updateBoard(board);
	}

	// õ ϱ
	public void requestBoardDelete(HttpServletRequest request) {

		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));

		BoardDAO dao = BoardDAO.getInstance();
		dao.deleteBoard(num);
	}
}