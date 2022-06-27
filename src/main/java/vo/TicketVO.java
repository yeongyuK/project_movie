package vo;

public class TicketVO {
	//예매번호
	private String ticketId;
	//고객ID
	private String userId;
	//영화 IDX
	private int movieIdx;
	//성인 예매 수
	private int adultCount;
	//청소년 예매 수
	private int childCount;
	//결제 금액
	private int totalPrice;
	
	
	public String getTicketId() {
		return ticketId;
	}
	public void setTicketId(String ticketId) {
		this.ticketId = ticketId;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getMovieIdx() {
		return movieIdx;
	}
	public void setMovieIdx(int movieIdx) {
		this.movieIdx = movieIdx;
	}
	public int getAdultCount() {
		return adultCount;
	}
	public void setAdultCount(int adultCount) {
		this.adultCount = adultCount;
	}
	public int getChildCount() {
		return childCount;
	}
	public void setChildCount(int childCount) {
		this.childCount = childCount;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	
}
