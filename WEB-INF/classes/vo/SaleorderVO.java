package vo;

public class SaleorderVO {
	private String saleID;
	private String useriD;
	private String orderdate;
	private String addr;
	private String tel;
	private String cardname;
	private String cardno;
	private int prodcount;
	private int total;
	private String detailLink;
	private String recipient;
	private boolean status;

	public SaleorderVO(String saleID, String useriD, String orderdate, String addr, String tel, String cardname,
			String cardno, int prodcount, int total, String detailLink, String recipient, boolean status) {
		super();
		this.saleID = saleID;
		this.useriD = useriD;
		this.orderdate = orderdate;
		this.addr = addr;
		this.tel = tel;
		this.cardname = cardname;
		this.cardno = cardno;
		this.prodcount = prodcount;
		this.total = total;
		this.detailLink = detailLink;
		this.recipient = recipient;
		this.status = status;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public SaleorderVO() {
		super();
	}

	public String getSaleID() {
		return saleID;
	}

	public String getUseriD() {
		return useriD;
	}

	public String getOrderdate() {
		return orderdate;
	}

	public String getAddr() {
		return addr;
	}

	public String getTel() {
		return tel;
	}

	public String getCardname() {
		return cardname;
	}

	public String getCardno() {
		return cardno;
	}

	public int getProdcount() {
		return prodcount;
	}

	public int getTotal() {
		return total;
	}

	public String getDetailLink() {
		return detailLink;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setSaleID(String saleID) {
		this.saleID = saleID;
	}

	public void setUseriD(String useriD) {
		this.useriD = useriD;
	}

	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public void setCardname(String cardname) {
		this.cardname = cardname;
	}

	public void setCardno(String cardno) {
		this.cardno = cardno;
	}

	public void setProdcount(int prodcount) {
		this.prodcount = prodcount;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public void setDetailLink(String detailLink) {
		this.detailLink = detailLink;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	@Override
	public String toString() {
		return "SaleorderVO [saleID=" + saleID + ", useriD=" + useriD + ", orderdate=" + orderdate + ", addr=" + addr
				+ ", tel=" + tel + ", cardname=" + cardname + ", cardno=" + cardno + ", prodcount=" + prodcount
				+ ", total=" + total + ", detailLink=" + detailLink + ", recipient=" + recipient + "]";
	}

}
