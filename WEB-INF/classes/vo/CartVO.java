package vo;

public class CartVO {
	private int cART_ID;
	private int product_id;
	private String pname;
	private int price;
	private int amount;
	private int totalPrice;
	private String firstImg;

	public CartVO() {
		super();
	}



	public CartVO(int cART_ID, int product_id, String pname, int price, int amount, String firstImg) {
		super();
		this.cART_ID = cART_ID;
		this.product_id = product_id;
		this.pname = pname;
		this.price = price;
		this.amount = amount;
		this.firstImg = firstImg;
		this.totalPrice = price * amount;
	}

	public String getFirstImg() {
		return firstImg;
	}

	public void setFirstImg(String firstImg) {
		this.firstImg = firstImg;
	}

	public int getcART_ID() {
		return cART_ID;
	}

	public void setcART_ID(int cART_ID) {
		this.cART_ID = cART_ID;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getProduct_id() {
		return product_id;
	}

	public String getPname() {
		return pname;
	}

	public int getPrice() {
		return price;
	}

	public int getAmount() {
		return amount;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "CartVO [CART_ID=" + cART_ID + ", product_id=" + product_id + ", pname=" + pname + ", price=" + price
				+ ", amount=" + amount + "]";
	}

}
