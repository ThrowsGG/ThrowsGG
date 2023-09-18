package vo;

public class ItemVO {
	private String orderID;
	private String pname;
	private int prodid;
	private int quantity;
	private int price;

	public ItemVO(String orderID, String pname, int prodid, int quantity, int price) {
		super();
		this.orderID = orderID;
		this.pname = pname;
		this.prodid = prodid;
		this.quantity = quantity;
		this.price = price;
	}

	public String getOrderID() {
		return orderID;
	}

	public String getPname() {
		return pname;
	}

	public int getProdid() {
		return prodid;
	}

	public int getQuantity() {
		return quantity;
	}

	public int getPrice() {
		return price;
	}

	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public void setProdid(int prodid) {
		this.prodid = prodid;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public void setPrice(int price) {
		this.price = price;
	}

}
