package boardAction;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import mvc.controller.IndexCommentsDAO;
import vo.ActionForward;
import vo.ChildIndexCommentsVO;
import vo.IndexCommentsVO;

public class blogSingleSelectAction implements Action {

	   @Override
	   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	      System.out.println("boardSelectAction");
	      response.setContentType("text/html;charset=utf-8");
	      HashMap<String, String> myHashMap1 = new HashMap<String, String>();
	      HashMap<String, String> myHashMap2 = new HashMap<String, String>();
	      PrintWriter out = response.getWriter();
	      JSONObject totalObject = new JSONObject();
	      JSONObject memberInfo = null;
	      JSONArray memberArray = new JSONArray();// comments arry
	      JSONArray childArray = new JSONArray();// childcomments arry
	      String desertionNo = request.getParameter("desertionNo");
	      IndexCommentsDAO instance = IndexCommentsDAO.getInstance();// db 인스턴스 생성
	      ArrayList<IndexCommentsVO> commentList = instance.selectComments(desertionNo);// 변경된 db의 데이터를 select
	      ArrayList<ChildIndexCommentsVO> childCommentList = instance.childSelectComments(desertionNo);// 변경된 db의 데이터를
	                                                                              // select
	      for (IndexCommentsVO vo : commentList) {
	    	  System.out.println("37번째 줄 : "+vo.toString());
	         myHashMap1.put("userID", vo.getUserID());
	         myHashMap1.put("comment", vo.getComment());
	         myHashMap1.put("indexComment", Integer.toString(vo.getIndexComments()));
	         myHashMap1.put("regist_date", vo.getRegist_date());
	         myHashMap1.put("Nick", vo.getNickname());
	         myHashMap1.put("profile", vo.getProfile());
	         memberInfo = new JSONObject(myHashMap1);
	         memberArray.add(memberInfo);
	      }
	      for (ChildIndexCommentsVO vo : childCommentList) {
	    	  System.out.println("48번째 줄 : "+vo.toString());
	         myHashMap2.put("userID", vo.getUserID());
	         myHashMap2.put("comment", vo.getComment());
	         myHashMap2.put("indexComment", Integer.toString(vo.getChildindexComments()));
	         myHashMap2.put("groupNum", Integer.toString(vo.getGroupNum()));
	         myHashMap2.put("regist_date", vo.getRegist_date());
	         myHashMap2.put("nickname", vo.getNickname());
	         myHashMap2.put("chprofile", vo.getProfile());
	         memberInfo = new JSONObject(myHashMap2);
	         childArray.add(memberInfo);
	      }
	      totalObject.put("members", memberArray);
	      totalObject.put("child", childArray);
	      totalObject.put("listsize", commentList.size() + childCommentList.size());
	      String jsonInfo = totalObject.toJSONString();
	      out.print(jsonInfo);
	      out.close();
	      return null; // foword를 안하기떄문에 null로 값 넘김 - mkc
	   }

}
