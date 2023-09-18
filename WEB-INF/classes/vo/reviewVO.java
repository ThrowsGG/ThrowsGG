package vo;

import java.util.Date;

public class reviewVO {
	private String id;
	private String nickname;
	private float score;
	private String comment;
	private Date date;
	private String profile;
	private int num;
	
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	
	public reviewVO(String id, String nickname, float score, String comment, Date date, String profile) {
		setId(id);
		setNickname(nickname);
		setScore(score);
		setComment(comment);
		setDate(date);
		setProfile(profile);
	}
	
	public reviewVO() {
		// TODO Auto-generated constructor stub
	}

}
