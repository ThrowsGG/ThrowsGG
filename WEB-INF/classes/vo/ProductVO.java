package vo;

public class ProductVO {
	private int productID; // 상품 id
	private String category;// 상품분류
	private String pname;// 상품이름
	private int price;// 상품가격
	private int stock;// 상품 재고
	private String inputdate;// 등록날짜
	private String description;// 상품 설명
	private String firstImg;// 상품이미지1
	private String seconImg;// 상품이미지2
	private String thirldImg;// 상품이미지3
	private String detailImg;// 상세 상품 이미지
	private String usage;// 권장연령
	private String productcol;// 제조사
	private String characteristics;// 특징
	private String countryOforigin;// 원산지
	private String expirationDate;// 유통기한
	private String capacity;// 용량/중량
	private String Ingredient;// 성분구성

	public ProductVO() {
		super();
	}

	public ProductVO(int productID, String category, String pname, int price, int stock, String inputdate,
			String description, String firstImg, String seconImg, String thirldImg, String detailImg, String usage,
			String productcol, String characteristics, String countryOforigin, String expirationDate, String capacity,
			String ingredient) {
		super();
		this.productID = productID;
		this.category = category;
		this.pname = pname;
		this.price = price;
		this.stock = stock;
		this.inputdate = inputdate;
		this.description = description;
		this.firstImg = firstImg;
		this.seconImg = seconImg;
		this.thirldImg = thirldImg;
		this.detailImg = detailImg;
		this.usage = usage;
		this.productcol = productcol;
		this.characteristics = characteristics;
		this.countryOforigin = countryOforigin;
		this.expirationDate = expirationDate;
		this.capacity = capacity;
		Ingredient = ingredient;
	}

	public String getDetailImg() {
		return detailImg;
	}

	public void setDetailImg(String detailImg) {
		this.detailImg = detailImg;
	}

	public int getProductID() {
		return productID;
	}

	public String getCategory() {
		return category;
	}

	public String getPname() {
		return pname;
	}

	public int getPrice() {
		return price;
	}

	public int getStock() {
		return stock;
	}

	public String getInputdate() {
		return inputdate;
	}

	public String getDescription() {
		return description;
	}

	public String getFirstImg() {
		return firstImg;
	}

	public String getSeconImg() {
		return seconImg;
	}

	public String getThirldImg() {
		return thirldImg;
	}

	public String getUsage() {
		return usage;
	}

	public String getProductcol() {
		return productcol;
	}

	public String getCharacteristics() {
		return characteristics;
	}

	public String getCountryOforigin() {
		return countryOforigin;
	}

	public String getExpirationDate() {
		return expirationDate;
	}

	public String getCapacity() {
		return capacity;
	}

	public String getIngredient() {
		return Ingredient;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setFirstImg(String firstImg) {
		this.firstImg = firstImg;
	}

	public void setSeconImg(String seconImg) {
		this.seconImg = seconImg;
	}

	public void setThirldImg(String thirldImg) {
		this.thirldImg = thirldImg;
	}

	public void setUsage(String usage) {
		this.usage = usage;
	}

	public void setProductcol(String productcol) {
		this.productcol = productcol;
	}

	public void setCharacteristics(String characteristics) {
		this.characteristics = characteristics;
	}

	public void setCountryOforigin(String countryOforigin) {
		this.countryOforigin = countryOforigin;
	}

	public void setExpirationDate(String expirationDate) {
		this.expirationDate = expirationDate;
	}

	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}

	public void setIngredient(String ingredient) {
		Ingredient = ingredient;
	}

	@Override
	public String toString() {
		return "ProductVO [productID=" + productID + ", category=" + category + ", pname=" + pname + ", price=" + price
				+ ", stock=" + stock + ", inputdate=" + inputdate + ", description=" + description + ", usage=" + usage
				+ ", productcol=" + productcol + ", characteristics=" + characteristics + ", countryOforigin="
				+ countryOforigin + ", expirationDate=" + expirationDate + ", capacity=" + capacity + ", Ingredient="
				+ Ingredient + "]";
	}

}
