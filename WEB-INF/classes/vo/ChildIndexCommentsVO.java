package vo;

public class ChildIndexCommentsVO {
	private int childindexComments;
	private String comment;
	private String desertionNo;
	private String userID;
	private String regist_date;
	private int groupNum;
	private String nickname;
	private String profile;

	public ChildIndexCommentsVO(int childindexComments, String comment, String desertionNo, String userID,
			String regist_date, int groupNum, String nickname, String profile) {
		super();
		this.childindexComments = childindexComments;
		this.comment = comment;
		this.desertionNo = desertionNo;
		this.userID = userID;
		this.regist_date = regist_date;
		this.groupNum = groupNum;
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

	public int getChildindexComments() {
		return childindexComments;
	}

	public void setChildindexComments(int childindexComments) {
		this.childindexComments = childindexComments;
	}

	public int getGroupNum() {
		return groupNum;
	}

	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
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

	public String getRegist_date() {
		return regist_date;
	}

	public void setRegist_date(String regist_date) {
		this.regist_date = regist_date;
	}

	@Override
	public String toString() {
		return "ChildIndexCommentsVO [childindexComments=" + childindexComments + ", groupNum=" + groupNum
				+ ", comment=" + comment + ", desertionNo=" + desertionNo + ", userID=" + userID + ", regist_date="
				+ regist_date + ", nickname=" + nickname + "]";
	}

}
