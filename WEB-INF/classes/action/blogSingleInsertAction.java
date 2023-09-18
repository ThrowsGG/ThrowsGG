package action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.IndexCommentsDAO;
import vo.ActionForward;
import vo.IndexCommentsVO;

public class blogSingleInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("blogSingleInsertAction");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		// 배열을 저장할 totalObject
		// memberInfo JSON 객체를 저장할 배열
		String userid = request.getParameter("userid");
		String content = request.getParameter("content");
		String desertionNo = request.getParameter("desertionNo");
		String nickname = request.getParameter("nickname");
		IndexCommentsDAO instance = IndexCommentsDAO.getInstance();//db 인스턴스 생성
		instance.insertComments(content, userid, desertionNo,nickname);//db insert 함수 실행
		return null; //foword를 안하기떄문에 null로 값 넘김 - mkc
	}

}
