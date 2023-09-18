package vo;

import java.util.Date;

public class LoginUser {
	private String id;
	private String password;
	private String nickname;
	private String name;
	private String phone;
	private String email;
	private String profile;
	private Date joinDate;
	
	
	public LoginUser() {
		this(null,null,null,null,null,null,null,null);
	}
	
	public LoginUser(String id, String password, String name, String email, String phone, String nickname,String profile, Date joinDate){
		setId(id);
		setPassword(password);
		setNickname(nickname);
		setName(name);
		setPhone(phone);
		setEmail(email);
		setProfile(profile);
		setJoinDate(joinDate);
		
	}
	
	
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
}
