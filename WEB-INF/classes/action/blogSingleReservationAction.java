package action;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Sens_sms_v2;
import dao.reservationDAO;
import vo.ActionForward;
import vo.reservationVO;

public class blogSingleReservationAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("blogSingleReservationAction 호출");
		ActionForward redirect = new ActionForward();
		reservationVO vo = new reservationVO();
		reservationDAO dao = new reservationDAO();
		vo.setOpt(request.getParameter("opt"));
		vo.setPhonNumber(request.getParameter("phonenum"));
		vo.setResTime(request.getParameter("time"));
		String before_date = request.getParameter("calender");
		SimpleDateFormat dtFormat = new SimpleDateFormat("MM/dd/yyyy");
		SimpleDateFormat newDtFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date formatDate = dtFormat.parse(before_date);
		String date = newDtFormat.format(formatDate);
		vo.setResDate(date);
		vo.setResComment(request.getParameter("message"));
		vo.setUsername(request.getParameter("name"));
		vo.setDesertionNo(request.getParameter("resdesertionNo"));
		vo.setUserId(request.getParameter("sessionId"));
		System.out.println(vo.toString());
		dao.reservationInsert(vo);
		String comments = "안녕하세요. ThrowsGG 입니다.\n" + vo.getUsername() + "님의 " + vo.getOpt() + "상담 요청 예약시간은 "
				+ vo.getResDate() + " " + vo.getResTime() + " 입니다.\n보호소 이름 : " + request.getParameter("Aban_careNm")
				+ "\n보호소 전화번호 : " + request.getParameter("Aban_CareTel") + "\n보호소 주소 : "
				+ request.getParameter("Aban_careAddr") + "\n담당자 : " + request.getParameter("Aban_careChargeNm")
				+ "\n담당자 전화번호 : " + request.getParameter("Aban_careOfficeTel");
		System.out.println(comments.toString());
		Sens_sms_v2 sms = new Sens_sms_v2();
		sms.sendSMS(comments, vo.getPhonNumber());

		redirect.setPath("userinfo.jsp");
		redirect.setRedirect(true);

		return redirect;
	}

}
