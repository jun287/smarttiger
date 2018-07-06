package dto;

public class BoardQnAComment {
	private int boardQnACommentNumber = 0;
	private int boardQnANumber = 0;
	private String memberId;
	private String boardqnaCommentContent;
	private String boardqnaCommentDate;
	private String choose;
	
	public int getBoardQnACommentNumber() {
		return boardQnACommentNumber;
	}
	public void setBoardQnACommentNumber(int boardQnACommentNumber) {
		this.boardQnACommentNumber = boardQnACommentNumber;
		System.out.println(boardQnACommentNumber+"<--setBoardQnACommentNumber");
	}
	public int getBoardQnANumber() {
		return boardQnANumber;
	}
	public void setBoardQnANumber(int boardQnANumber) {
		this.boardQnANumber = boardQnANumber;
		System.out.println(boardQnANumber+"<--setBoardQnANumber");
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
		System.out.println(memberId+"<--setMemberId");
	}
	public String getBoardqnaCommentContent() {
		return boardqnaCommentContent;
	}
	public void setBoardqnaCommentContent(String boardqnaCommentContent) {
		this.boardqnaCommentContent = boardqnaCommentContent;
		System.out.println(boardqnaCommentContent+"<--setBoardqnaCommentContent");
	}
	public String getBoardqnaCommentDate() {
		return boardqnaCommentDate;
	}
	public void setBoardqnaCommentDate(String boardqnaCommentDate) {
		this.boardqnaCommentDate = boardqnaCommentDate;
		System.out.println(boardqnaCommentDate+"<--setBoardqnaCommentDate");
	}
	public String getChoose() {
		return choose;
	}
	public void setChoose(String choose) {
		this.choose = choose;
		System.out.println(choose+"<--setChoose");
	}
	@Override
	public String toString() {
		return "BoardQnAComment [boardQnACommentNumber=" + boardQnACommentNumber + ", boardQnANumber=" + boardQnANumber
				+ ", memberId=" + memberId + ", boardqnaCommentContent=" + boardqnaCommentContent
				+ ", boardqnaCommentDate=" + boardqnaCommentDate + ", choose=" + choose + "]";
	}
	
	
	
}
