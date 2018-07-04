package dto;

public class BoardQnA {
	private int boardQnANumber = 0;
	private String memberId;
	private String boardQnAtitle;
	private String boardQnAContent;
	private String boardQnADate;
	private int boardQnAhits;
	private String boardQnAChoose;
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
	public String getBoardQnAtitle() {
		return boardQnAtitle;
	}
	public void setBoardQnAtitle(String boardQnAtitle) {
		this.boardQnAtitle = boardQnAtitle;
		System.out.println(boardQnAtitle+"<--setBoardQnAtitle");
	}
	public String getBoardQnAContent() {
		return boardQnAContent;
	}
	public void setBoardQnAContent(String boardQnAContent) {
		this.boardQnAContent = boardQnAContent;
		System.out.println(boardQnAContent+"<--setBoardQnAContent");
	}
	public String getBoardQnADate() {
		return boardQnADate;
	}
	public void setBoardQnADate(String boardQnADate) {
		this.boardQnADate = boardQnADate;
		System.out.println(boardQnADate+"<--setBoardQnADate");
	}
	public int getBoardQnAhits() {
		return boardQnAhits;
	}
	public void setBoardQnAhits(int boardQnAhits) {
		this.boardQnAhits = boardQnAhits;
		System.out.println(boardQnAhits+"<--setBoardQnAhits");
	}
	public String getBoardQnAChoose() {
		return boardQnAChoose;
	}
	public void setBoardQnAChoose(String boardQnAChoose) {
		this.boardQnAChoose = boardQnAChoose;
		System.out.println(boardQnAChoose+"<--setBoardQnAChoose");
	}
	@Override
	public String toString() {
		return "BoardQnA [boardQnANumber=" + boardQnANumber + ", memberId=" + memberId + ", boardQnAtitle="
				+ boardQnAtitle + ", boardQnAContent=" + boardQnAContent + ", boardQnADate=" + boardQnADate
				+ ", boardQnAhits=" + boardQnAhits + ", boardQnAChoose=" + boardQnAChoose + "]";
	}
	
}	

