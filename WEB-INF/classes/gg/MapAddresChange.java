package gg;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;

public class MapAddresChange {
	
	public String geocoding(String address) {
		// 주소 입력 -> 위도, 경도 좌표 추출.
		BufferedReader io = new BufferedReader(new InputStreamReader(System.in));
		String clientId = "qhzingc5km";
		String clientSecret = "hk29g5hWSzIcHzkygTqDui7teOg6x9XGoTtSXaxH";

		try {

			String addr = URLEncoder.encode(address, "UTF-8");

			// Geocoding 개요에 나와있는 API URL 입력.
			String apiURL = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query=" + addr; // JSON

			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");

			// Geocoding 개요에 나와있는 요청 헤더 입력.
			con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
			con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);

			// 요청 결과 확인. 정상 호출인 경우 200
			int responseCode = con.getResponseCode();

			BufferedReader br;

			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}

			String inputLine;

			StringBuffer response = new StringBuffer();

			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}

			br.close();

			JSONTokener tokener = new JSONTokener(response.toString());
			JSONObject object = new JSONObject(tokener);
			JSONArray arr = object.getJSONArray("addresses");

			JSONObject temp = (JSONObject) arr.get(0);
//				System.out.println("address : " + temp.get("roadAddress"));
//				System.out.println("jibunAddress : " + temp.get("jibunAddress"));
			String wg = (String) (temp.get("y")) + "," + ((String) (temp.get("x")));
			System.out.println("네이버 지도 api 좌표 변환 = " + wg);
			return wg;

		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

}
