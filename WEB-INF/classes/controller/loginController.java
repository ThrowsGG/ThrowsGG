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
import dao.BoardStatus;
import dao.LoginDAO;
import dao.MemberDAO;
import dao.MemberInsertDAO;
import dao.MemberUpdateDAO;
import dao.Sens_sms_v2;
import mailsender.MailController;
import vo.ActionForward;
import vo.LoginUser;

/**
 * Servlet implementation class loginController
 */
@WebServlet("*.lg")
public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;

		if (command.equals("/checkid.lg")) { // 회원가입시
			String id = request.getParameter("id"); // ajax값 가져오기
//			if(id.length() <= 4 && id.length() >0) {
//				response.getWriter().write("tooshort");
//			}
			System.out.println(id);
			MemberDAO member = new MemberDAO();
			response.getWriter().write(new MemberDAO().idCheck(id) + "");
		} else if (command.equals("/insert.lg")) {
			MemberInsertDAO insert = new MemberInsertDAO();
			String id = request.getParameter("id");
			String pw = request.getParameter("password");
			String nickname = request.getParameter("nickname");
			String name = request.getParameter("name");
			String phoneNum = request.getParameter("phone");
			String email = request.getParameter("email");

			System.out.println(name + " " + phoneNum + " " + email + " " + id + " " + pw);
			insert.insertMember(id, pw, nickname, name, email, phoneNum);
			response.sendRedirect("Welcome.jsp");
		} else if (command.equals("/login.lg")) {
			HttpSession session = request.getSession(true);
			LoginDAO login = new LoginDAO();
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			System.out.println("login : " + id + " " + pw);
			LoginUser check = new LoginDAO().checkInfo(id, pw);
			if (check != null) { // 로그인한 회원의 정보 세션에 저장
				session.setAttribute("id", id);
				session.setAttribute("password", pw);
				session.setAttribute("email", check.getEmail());
				session.setAttribute("phone", check.getPhone());
				session.setAttribute("name", check.getName());
				session.setAttribute("nickname", check.getNickname());
				session.setAttribute("profile", check.getProfile());
				session.setAttribute("joinDate", check.getJoinDate());
				session.setAttribute("user", check);
			}
			System.out.println(check + "");
			response.getWriter().write(check + "");
		} else if (command.equals("/infochange.lg")) {
			MemberUpdateDAO update = new MemberUpdateDAO();
			HttpSession session = request.getSession();
			String img = request.getParameter("img");
			String nickname = request.getParameter("nickname");
			String name = request.getParameter("name");
			String phoneNum = request.getParameter("phone");
			String email = request.getParameter("email");
			String id = (String) session.getAttribute("id");
			update.updateMember(id, nickname, name, email, phoneNum,img);
			session.setAttribute("profile", img);
			session.setAttribute("email", email);
			session.setAttribute("phone", phoneNum);
			session.setAttribute("name", name);
			session.setAttribute("nickname", nickname);
			System.out.println(nickname + " " + name + " " + phoneNum + " " + email);

//			PrintWriter writer = response.getWriter();
//			writer.println("<script> location.replace('userinfo.jsp');</script>"); 
//			writer.close();
//			RequestDispatcher rd = request.getRequestDispatcher("/userinfo.jsp");
//			rd.forward(request, response);
			response.getWriter().write(true + "");
		} else if (command.equals("/checkMail.lg")) {
			HttpSession session = request.getSession(true);
			String id = request.getParameter("id");
			String email = request.getParameter("email");
			System.out.println("checkMail : " + id + " " + email);
			boolean mailCheck = new LoginDAO().checkMail(id, email);
//	         if(mailCheck == true) {
//	            System.out.println("asdsadasdsadasdasd");
//	            response.sendRedirect("sendMail.lg");
////	            RequestDispatcher rd = request.getRequestDispatcher("sendMail.lg");
//	            response.getWriter().write(mailCheck + "");
//	         }else {
			response.getWriter().write(mailCheck + "");

		} else if (command.equals("/sendMail.lg")) {
			String email = request.getParameter("email");
			String id = request.getParameter("id");
			System.out.println("sendMail" + email);
			String fakePw = new MailController().getRandomPw();
			new LoginDAO().updateFakePw(id, fakePw);
			new MailController(id, email, fakePw).start();
			System.out.println(fakePw + "asdasd");
//	         response.sendRedirect("afterSendPw.jsp");
		} else if(command.equals("/pwcheck.lg")) {
			LoginDAO check = new LoginDAO();
			HttpSession session = request.getSession();
			String pw = request.getParameter("pw");
			String id = (String) session.getAttribute("id");
			LoginUser cpw = check.checkInfo(id, pw);
			System.out.println("cpw : "+cpw);
			if(cpw != null) {
				RequestDispatcher rd = request.getRequestDispatcher("/changepw.lg");
				rd.forward(request, response);
			}else {
				response.getWriter().write("password error");
			}
		}else if(command.equals("/changepw.lg")) {
			MemberUpdateDAO update = new MemberUpdateDAO();
			HttpSession session = request.getSession();
			String npw = request.getParameter("npw");
			String nrpw = request.getParameter("nrpw");
			String id = (String) session.getAttribute("id");
			update.updatepw(id, npw, nrpw);
			response.getWriter().write("success");
		}else if(command.equals("/delinfo.lg")) {
			HttpSession session = request.getSession();
			MemberDAO del = new MemberDAO();
			int index = Integer.parseInt(request.getParameter("id"));
			System.out.println("index : " + index);
			del.delinfo(index);
			String msgComments =  (String) session.getAttribute("id")+" 님의 상담신청번호 : "+index+" 의 예약취소가 성공적으로 완료되었습니다";
			Sens_sms_v2 sms = new Sens_sms_v2();
			sms.sendSMS(msgComments, "0"+request.getParameter("phonenNm").replace("-",""));
			response.getWriter().write("ok");
		}else if(command.equals("/delall.lg")) {
			System.out.println("delall into");
			MemberDAO del = new MemberDAO();
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("id");
			System.out.println("id : " + id);
			del.delall(id);
//			response.getWriter().write("ok");
//			session.invalidate();
			response.sendRedirect("logout.jsp");
		}else if(command.equals("/changeStatus.lg")) {
	         System.out.println("change 들어옴");
	         BoardStatus bs = new BoardStatus();
	         int num = Integer.parseInt(request.getParameter("num"));
	         bs.changeStatus(num);
	         response.getWriter().write("ok");
	      }else if(command.equals("/easylogin.lg")) {
	    	  System.out.println("easylogin 들어옴");
	    	  MemberInsertDAO easy = new MemberInsertDAO();
	    	  String id = request.getParameter("id");
	    	  String nickname = request.getParameter("nickname");
	    	  String email = request.getParameter("email");
	    	  String img = request.getParameter("img");
	    	  LoginUser check = easy.easylogin(id, email, nickname,img);
	    	  
	    	  HttpSession session = request.getSession(true);
	    	  session.setAttribute("id", check.getId());
	    	  session.setAttribute("password", check.getPassword());
	    	  session.setAttribute("email", check.getEmail());
	    	  session.setAttribute("phone", check.getPhone());
	    	  session.setAttribute("name", check.getName());
	    	  session.setAttribute("nickname", check.getNickname());
	    	  session.setAttribute("profile", check.getProfile());
	    	  session.setAttribute("joinDate", check.getJoinDate());
	    	  session.setAttribute("user", check);
	    	  response.getWriter().write("ok");
	      }

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}
}