package boardAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boardAction.Action;
import mvc.controller.IndexCommentsDAO;
import vo.ActionForward;

public class blogSingleChildInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ChildCommentInsert 호출2");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		// 배열을 저장할 totalObject
		// memberInfo JSON 객체를 저장할 배열
		String userid = request.getParameter("userid");
		String content = request.getParameter("content");
		String desertionNo = request.getParameter("desertionNo");
		int groupNum = Integer.parseInt(request.getParameter("groupNum"));
		String nickname = request.getParameter("nickname");
		IndexCommentsDAO instance = IndexCommentsDAO.getInstance();// db 인스턴스 생성
		instance.childInsertComments(content, userid, desertionNo, groupNum, nickname);// db insert 함수 실행
		return null; // foword를 안하기떄문에 null로 값 넘김 - mkc
	}

}
