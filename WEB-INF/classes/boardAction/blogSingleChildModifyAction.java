package boardAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boardAction.Action;
import mvc.controller.IndexCommentsDAO;
import vo.ActionForward;
public class blogSingleChildModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("blogSingleChildModifyAction");
		response.setContentType("text/html;charset=utf-8");
		// 배열을 저장할 totalObject
		// memberInfo JSON 객체를 저장할 배열
		String content = request.getParameter("Comments");//수정내용
		String indexComments = request.getParameter("indexComments");
		String desertionNo = request.getParameter("desertionNo");
		String userid = request.getParameter("userid");
		IndexCommentsDAO instance = IndexCommentsDAO.getInstance();//db 인스턴스 생성
		instance.childModifyComments(content,indexComments);//db insert 함수 실행
		return null;//를 안하기떄문에 null로 값 넘김 - mkc
	}

}
