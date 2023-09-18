package mvc.model;

public class BoardDTO {
	private int num;
	private String id;
	private String name; // 이름
	private String subject; // 제목
	private String content; // 내용
	private String regist_day; // 작성날짜
	private int hit; // 조회수
	private String phone; // 전화번호
	private String petName; // 동물 이름
	private String breed; // 품종
	private String lostDate; // 분실날짜
	private String gender; // 상별
	private String age; // 나이
	private String lostPlace; // 분실장소
	private String figure; // 동물 특징
	private String petImg; // 동물이미지
	private String status;

	

	public BoardDTO() {
		super();
	}

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegist_day() {
		return regist_day;
	}

	public void setRegist_day(String regist_day) {
		this.regist_day = regist_day;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	@Override
	public String toString() {
		return "BoardDTO [num=" + num + ", id=" + id + ", name=" + name + ", subject=" + subject + ", content="
				+ content + ", regist_day=" + regist_day + ", hit=" + hit + "]";
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public String getBreed() {
		return breed;
	}

	public void setBreed(String breed) {
		this.breed = breed;
	}

	public String getLostDate() {
		return lostDate;
	}

	public void setLostDate(String lostDate) {
		this.lostDate = lostDate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getLostPlace() {
		return lostPlace;
	}

	public void setLostPlace(String lostPlace) {
		this.lostPlace = lostPlace;
	}

	public String getFigure() {
		return figure;
	}

	public void setFigure(String figure) {
		this.figure = figure;
	}

	public String getPetImg() {
		return petImg;
	}

	public void setPetImg(String petImg) {
		this.petImg = petImg;
	}

	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}