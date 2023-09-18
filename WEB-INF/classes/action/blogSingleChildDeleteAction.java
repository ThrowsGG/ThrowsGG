package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dao.IndexCommentsDAO;
import vo.ActionForward;

public class blogSingleChildDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("blogSingleChildDeleteAction");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String userid = request.getParameter("userid");
		int indexComments = Integer.parseInt(request.getParameter("indexComments"));
		String desertionNo = request.getParameter("desertionNo");
		IndexCommentsDAO instance = IndexCommentsDAO.getInstance();
		instance.childdeleteComments(indexComments); // db
		return null; // foword를 안하기떄문에 null로 값 넘김 - mkc
	}

}
