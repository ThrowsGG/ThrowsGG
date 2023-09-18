package requestinfo;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class RequestInfo {

	public boolean Daycompare(String date) throws ParseException {
		Date nowDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		// 원하는 데이터 포맷 지정
		String nowDay = dateFormat.format(nowDate);
		// 문자열 날짜를 date 형태로 변환 
		Date today = new Date(dateFormat.parse(nowDay).getTime());
		Date getdate = new Date(dateFormat.parse(date).getTime());
		
//		DateFormat timeFormat = new SimpleDateFormat("hh:mm a");
//		String nowtime = timeFormat.format(nowDate);
//		
		
		int compare = getdate.compareTo(today);
		// 날짜 비교
		if(compare >= 0) { //getdate가 오늘보다 크거나 같음
			return true;
		}else {				// 과거
			return false;
		}

	}

}
