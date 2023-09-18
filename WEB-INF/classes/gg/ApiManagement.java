package gg;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import vo.AbandonList;
import vo.DateAbandon;

public class ApiManagement {
	public static String xmlDownload(String pageNum) throws IOException {
		StringBuilder urlBuilder = new StringBuilder(
				"http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
				+ "=wxqzx0cNT1VuuHT1VKBHZ0lqoTf0hnLP58xaJH2Mf4teDIv2drl%2Frl0%2FWlJuWHVO13b58mvMtKcB07CBU3jk4A%3D%3D"); /*
																														 * Service
																														 * Key
																														 */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
				+ URLEncoder.encode("6", "UTF-8")); /* 한 페이지 결과 수(1,000 이하) */
		urlBuilder.append(
				"&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(pageNum, "UTF-8")); /* 페이지 번호 */
		urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "="
				+ URLEncoder.encode("json", "UTF-8")); /* xml(기본값) 또는 json */
		URL url = new URL(urlBuilder.toString());
		// System.out.println(url.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		// System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			System.out.println(line);
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		return sb.toString();
	}

	public static AbandonList getDataList(String pageNum) throws IOException, ParseException {
		AbandonList list = new AbandonList(new ArrayList<DateAbandon>());
		String result = ApiManagement.xmlDownload(pageNum);
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
		JSONObject PetInfoResult = (JSONObject) jsonObject.get("response");
		JSONObject PetInfoResult01 = (JSONObject) PetInfoResult.get("body");
		JSONObject PetInfoResult02 = (JSONObject) PetInfoResult01.get("items");
		JSONArray PetInfo = (JSONArray) PetInfoResult02.get("item");// item의 값은 여러개이기에 JSONArray 사용
		String PetInfo_totalCount = String.valueOf(PetInfoResult01.get("totalCount"));
		for (int i = 0; i < PetInfo.size(); i++) {
			DateAbandon dateAbandon = new DateAbandon();
			JSONObject PetInfo_test = (JSONObject) PetInfo.get(i);
			dateAbandon.setDesertionNo(String.valueOf(PetInfo_test.get("desertionNo")));
			dateAbandon.setFilename(String.valueOf(PetInfo_test.get("filename")));
			dateAbandon.setHappenDt(String.valueOf(PetInfo_test.get("happenDt")));
			dateAbandon.setHappenPlace(String.valueOf(PetInfo_test.get("happenPlace")));
			dateAbandon.setKindCd(String.valueOf(PetInfo_test.get("kindCd")));
			dateAbandon.setColorCd(String.valueOf(PetInfo_test.get("colorCd")));
			dateAbandon.setAge(String.valueOf(PetInfo_test.get("age")));
			dateAbandon.setWeight(String.valueOf(PetInfo_test.get("weight")));
			dateAbandon.setNoticeNo(String.valueOf(PetInfo_test.get("noticeNo")));
			dateAbandon.setNoticeSdt(String.valueOf(PetInfo_test.get("noticeSdt")));
			dateAbandon.setNoticeEdt(String.valueOf(PetInfo_test.get("noticeEdt")));
			dateAbandon.setPopfile(String.valueOf(PetInfo_test.get("popfile")));
			dateAbandon.setProcessState(String.valueOf(PetInfo_test.get("processState")));
			dateAbandon.setSexCd(String.valueOf(PetInfo_test.get("sexCd")));
			dateAbandon.setNeuterYn(String.valueOf(PetInfo_test.get("neuterYn")));
			dateAbandon.setSpecialMark(String.valueOf(PetInfo_test.get("specialMark")));
			dateAbandon.setCareNm(String.valueOf(PetInfo_test.get("careNm")));
			dateAbandon.setCareTel(String.valueOf(PetInfo_test.get("careTel")));
			dateAbandon.setCareAddr(String.valueOf(PetInfo_test.get("careAddr")));
			dateAbandon.setOrgNm(String.valueOf(PetInfo_test.get("orgNm")));
			dateAbandon.setChargeNm(String.valueOf(PetInfo_test.get("chargeNm")));
			dateAbandon.setOfficetel(String.valueOf(PetInfo_test.get("officetel")));
			dateAbandon.setTotalCount(PetInfo_totalCount);
			list.getList().add(dateAbandon);
		}
		return list;
	}

//	public static ArrayList<DateAbandon> getItemList(String pageNum)
//			throws IOException, ParserConfigurationException, SAXException {
//		ArrayList<DateAbandon> list = new ArrayList<DateAbandon>();
//		String xml = ApiManagement.xmlDownload(pageNum);
//		/* xml 파싱 -> List<item> */
//		// System.out.println(xml);
//		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
//		DocumentBuilder builder = factory.newDocumentBuilder();
//
//		Document doc = (Document) builder.parse(new ByteArrayInputStream(xml.getBytes("utf-8")));
//
//		NodeList nodeList = doc.getElementsByTagName("item");/* xml태그이름 중 item 부분을 전부 긁어모음 */
//		for (int i = 0; i < nodeList.getLength(); i++) {
//			// System.out.println(i);
//			DateAbandon dateAbandon = new DateAbandon();
//			Node node = nodeList.item(i);
//			// 태그안에 있는 요소를 가져오기위해 Element를 형변환 하여 다시 담아줌
//			Element e = (Element) node;
//			dateAbandon.setDesertionNo(e.getElementsByTagName("desertionNo").item(0).getTextContent());
//			dateAbandon.setFilename(e.getElementsByTagName("filename").item(0).getTextContent());
//			dateAbandon.setHappenDt(e.getElementsByTagName("happenDt").item(0).getTextContent());
//			dateAbandon.setHappenPlace(e.getElementsByTagName("happenPlace").item(0).getTextContent());
//			dateAbandon.setKindCd(e.getElementsByTagName("kindCd").item(0).getTextContent());
//			dateAbandon.setColorCd(e.getElementsByTagName("colorCd").item(0).getTextContent());
//			dateAbandon.setAge(e.getElementsByTagName("age").item(0).getTextContent());
//			dateAbandon.setWeight(e.getElementsByTagName("weight").item(0).getTextContent());
//			dateAbandon.setNoticeNo(e.getElementsByTagName("noticeNo").item(0).getTextContent());
//			dateAbandon.setNoticeSdt(e.getElementsByTagName("noticeSdt").item(0).getTextContent());
//			dateAbandon.setNoticeEdt(e.getElementsByTagName("noticeEdt").item(0).getTextContent());
//			dateAbandon.setPopfile(e.getElementsByTagName("popfile").item(0).getTextContent());
//			dateAbandon.setProcessState(e.getElementsByTagName("processState").item(0).getTextContent());
//			dateAbandon.setSexCd(e.getElementsByTagName("sexCd").item(0).getTextContent());
//			dateAbandon.setNeuterYn(e.getElementsByTagName("neuterYn").item(0).getTextContent());
//			dateAbandon.setSpecialMark(e.getElementsByTagName("specialMark").item(0).getTextContent());
//			dateAbandon.setCareNm(e.getElementsByTagName("careNm").item(0).getTextContent());
//			dateAbandon.setCareTel(e.getElementsByTagName("careTel").item(0).getTextContent());
//			dateAbandon.setCareAddr(e.getElementsByTagName("careAddr").item(0).getTextContent());
//			dateAbandon.setOrgNm(e.getElementsByTagName("orgNm").item(0).getTextContent());
//			dateAbandon.setChargeNm(e.getElementsByTagName("chargeNm").item(0).getTextContent());
//			dateAbandon.setOfficetel(e.getElementsByTagName("officetel").item(0).getTextContent());
//			list.add(dateAbandon);
//		}
//
//		return list;
//	}}
}
