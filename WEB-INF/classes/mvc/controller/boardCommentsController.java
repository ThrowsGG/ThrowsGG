package mvc.controller;

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

import boardAction.Action;
import boardAction.blogSingleChildDeleteAction;
import boardAction.blogSingleChildInsertAction;
import boardAction.blogSingleChildModifyAction;
import boardAction.blogSingleDeleteAction;
import boardAction.blogSingleInsertAction;
import boardAction.blogSingleModifyAction;
import boardAction.blogSingleSelectAction;
import dao.IndexCommentsDAO;
import gg.ApiManagement;
import vo.AbandonList;
import vo.ActionForward;
import vo.DateAbandon;
import vo.IndexCommentsVO;


@WebServlet("*.bcc")
public class boardCommentsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("boardCommentsController");
		request.setCharacterEncoding("UTF-8");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		System.out.println(command);
		ActionForward forward = null;
		Action action = null;
		if (command.equals("/boardCommentInsert.bcc")) {
			action = new blogSingleInsertAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardCommentDelete.bcc")) {
			action = new blogSingleDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardCommentModify.bcc")) {
			action = new blogSingleModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardCommentSelect.bcc")) {
			action = new blogSingleSelectAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardChildCommentInsert.bcc")) {
			System.out.println("boardChildCommentInsert 호출1");
			action = new blogSingleChildInsertAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardChildCommentDelete.bcc")) {
			System.out.println("boardChildCommentDelete 호출1");
			action = new blogSingleChildDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardChildCommentModify.bcc")) {
			System.out.println("boardChildCommentModify 호출1");
			action = new blogSingleChildModifyAction();
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);

	}

}
