package vo;

public class DateAbandon {
	private String desertionNo; // 유기번호
	private String filename;// 유기번호
	private String happenDt;// 접수일
	private String happenPlace;// 발견장소
	private String kindCd;// 품종
	private String colorCd;// 색상
	private String age;// 나이
	private String weight;// 체중
	private String noticeNo;// 공고번호
	private String noticeSdt;// 공고시작일
	private String noticeEdt;// 공고종료일
	private String popfile;// Image
	private String processState;// 상태
	private String sexCd;// 성별
	private String neuterYn;// 중성화여부
	private String specialMark;// 특징
	private String careNm;// 보호소이름
	private String careTel;// 보호소전화번호
	private String careAddr;// 보호소전화번호
	private String orgNm;// 관할기관
	private String chargeNm;// 담당자
	private String officetel;// 담당자연락처
	private String totalCount;// 전체 결과 수

	public String getDesertionNo() {
		return desertionNo;
	}

	public String getFilename() {
		return filename;
	}

	public String getHappenDt() {
		return happenDt;
	}

	public String getHappenPlace() {
		return happenPlace;
	}

	public String getKindCd() {
		return kindCd;
	}

	public String getColorCd() {
		return colorCd;
	}

	public String getAge() {
		return age;
	}

	public String getWeight() {
		return weight;
	}

	public String getNoticeNo() {
		return noticeNo;
	}

	public String getNoticeSdt() {
		return noticeSdt;
	}

	public String getNoticeEdt() {
		return noticeEdt;
	}

	public String getPopfile() {
		return popfile;
	}

	public String getProcessState() {
		return processState;
	}

	public String getSexCd() {
		return sexCd;
	}

	public String getNeuterYn() {
		return neuterYn;
	}

	public String getSpecialMark() {
		return specialMark;
	}

	public String getCareNm() {
		return careNm;
	}

	public String getCareTel() {
		return careTel;
	}

	public String getCareAddr() {
		return careAddr;
	}

	public String getOrgNm() {
		return orgNm;
	}

	public String getChargeNm() {
		return chargeNm;
	}

	public String getOfficetel() {
		return officetel;
	}

	public String getTotalCount() {
		return totalCount;
	}

	public void setDesertionNo(String desertionNo) {
		this.desertionNo = desertionNo;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public void setHappenDt(String happenDt) {
		this.happenDt = happenDt;
	}

	public void setHappenPlace(String happenPlace) {
		this.happenPlace = happenPlace;
	}

	public void setKindCd(String kindCd) {
		this.kindCd = kindCd;
	}

	public void setColorCd(String colorCd) {
		this.colorCd = colorCd;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
	}

	public void setNoticeSdt(String noticeSdt) {
		this.noticeSdt = noticeSdt;
	}

	public void setNoticeEdt(String noticeEdt) {
		this.noticeEdt = noticeEdt;
	}

	public void setPopfile(String popfile) {
		this.popfile = popfile;
	}

	public void setProcessState(String processState) {
		this.processState = processState;
	}

	public void setSexCd(String sexCd) {
		if(sexCd.equals("M")) {
			this.sexCd = "수컷";
		}else {
			this.sexCd = "암컷";
		}

	}

	public void setNeuterYn(String neuterYn) {
		this.neuterYn = neuterYn;
	}

	public void setSpecialMark(String specialMark) {
		this.specialMark = specialMark;
	}

	public void setCareNm(String careNm) {
		this.careNm = careNm;
	}

	public void setCareTel(String careTel) {
		this.careTel = careTel;
	}

	public void setCareAddr(String careAddr) {
		this.careAddr = careAddr;
	}

	public void setOrgNm(String orgNm) {
		this.orgNm = orgNm;
	}

	public void setChargeNm(String chargeNm) {
		
	}

	public void setOfficetel(String officetel) {
		this.officetel = officetel;
	}

	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}

	@Override
	public String toString() {
		return "DateAbandon [desertionNo=" + desertionNo + ", filename=" + filename + ", happenDt=" + happenDt
				+ ", happenPlace=" + happenPlace + ", kindCd=" + kindCd + ", colorCd=" + colorCd + ", age=" + age
				+ ", weight=" + weight + ", noticeNo=" + noticeNo + ", noticeSdt=" + noticeSdt + ", noticeEdt="
				+ noticeEdt + ", popfile=" + popfile + ", processState=" + processState + ", sexCd=" + sexCd
				+ ", neuterYn=" + neuterYn + ", specialMark=" + specialMark + ", careNm=" + careNm + ", careTel="
				+ careTel + ", careAddr=" + careAddr + ", orgNm=" + orgNm + ", chargeNm=" + chargeNm + ", officetel="
				+ officetel + ", totalCount=" + totalCount + "]";
	}

}
