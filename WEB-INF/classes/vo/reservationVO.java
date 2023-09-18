package vo;

public class reservationVO {
	private int reservationIndex;
	private String opt;
	private String phonNumber;
	private String resTime;
	private String resDate;
	private String resComment;
	private String userId;
	private String username;
	private String resdesertionNo;

	public int getReservationIndex() {
		return reservationIndex;
	}

	public void setReservationIndex(int reservationIndex) {
		this.reservationIndex = reservationIndex;
	}

	public String getOpt() {
		return opt;
	}

	public void setOpt(String opt) {
		this.opt = opt;
	}

	public String getPhonNumber() {
		return phonNumber;
	}

	public void setPhonNumber(String phonNumber) {
		this.phonNumber = phonNumber;
	}

	public String getResTime() {
		return resTime;
	}

	public void setResTime(String resTime) {
		this.resTime = resTime;
	}

	public String getResDate() {
		return resDate;
	}

	public void setResDate(String resDate) {
		this.resDate = resDate;
	}

	public String getResComment() {
		return resComment;
	}

	public void setResComment(String resComment) {
		this.resComment = resComment;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getDesertionNo() {
		return resdesertionNo;
	}

	public void setDesertionNo(String resdesertionNo) {
		this.resdesertionNo = resdesertionNo;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "reservationVO [reservationIndex=" + reservationIndex + ", opt=" + opt + ", phonNumber=" + phonNumber
				+ ", resTime=" + resTime + ", resDate=" + resDate + ", resComment=" + resComment + ", userId=" + userId
				+ ", username=" + username + ", resdesertionNo=" + resdesertionNo + "]";
	}

}
