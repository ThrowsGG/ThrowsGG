package vo;

public class NewsVO {
	private int index;
	private String title;
	private String url;
	private String img;
	
	
	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public NewsVO() {
		// TODO Auto-generated constructor stub
		this(0,null,null,null);
	}

	
	public NewsVO(int index , String title, String url, String img) {
		setIndex(index);
		setTitle(title);
		setUrl(url);
		setImg(img);
	}
}
