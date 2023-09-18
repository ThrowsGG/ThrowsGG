package vo;

public class IndexCommentsVO {
	private int indexComments;
	private String comment;
	private String desertionNo;
	private String userID;
	private String regist_date;
	private String nickname;
	private String profile;

	public IndexCommentsVO(int indexComments, String comment, String desertionNo, String userID, String regist_date,
			String nickname, String profile) {
		super();
		this.indexComments = indexComments;
		this.comment = comment;
		this.desertionNo = desertionNo;
		this.userID = userID;
		this.regist_date = regist_date;
		this.nickname = nickname;
		this.profile = profile;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getRegist_date() {
		return regist_date;
	}

	public void setRegist_date(String regist_date) {
		this.regist_date = regist_date;
	}

	public int getIndexComments() {
		return indexComments;
	}

	public void setIndexComments(int indexComments) {
		this.indexComments = indexComments;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getDesertionNo() {
		return desertionNo;
	}

	public void setDesertionNo(String desertionNo) {
		this.desertionNo = desertionNo;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	@Override
	public String toString() {
		return "IndexCommentsVO [indexComments=" + indexComments + ", comment=" + comment + ", desertionNo="
				+ desertionNo + ", userID=" + userID + ", regist_date=" + regist_date + ", nickname=" + nickname + "]";
	}

}
