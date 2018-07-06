package dto;

public class Activity {
	
	private String memberId;
	private int totalQuestion = 0;
	private int totalAnswer = 0;
	private int chooseAnswer = 0;
	private int activityScore = 0;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
		System.out.println(memberId+"<--setMemberId");
	}
	public int getTotalQuestion() {
		return totalQuestion;
	}
	public void setTotalQuestion(int totalQuestion) {
		this.totalQuestion = totalQuestion;
		System.out.println(totalQuestion+"<--setTotalQuestion");
	}
	public int getTotalAnswer() {
		return totalAnswer;
	}
	public void setTotalAnswer(int totalAnswer) {
		this.totalAnswer = totalAnswer;
		System.out.println(totalAnswer+"<--setTotalAnswer");
	}
	public int getChooseAnswer() {
		return chooseAnswer;
	}
	public void setChooseAnswer(int chooseAnswer) {
		this.chooseAnswer = chooseAnswer;
		System.out.println(chooseAnswer+"<--setChooseAnswer");
	}
	public int getActivityScore() {
		return activityScore;
	}
	public void setActivityScore(int activityScore) {
		this.activityScore = activityScore;
	}
	@Override
	public String toString() {
		return "Activity [memberId=" + memberId + ", totalQuestion=" + totalQuestion + ", totalAnswer=" + totalAnswer
				+ ", chooseAnswer=" + chooseAnswer + ", activityScore=" + activityScore + "]";
	}
	
}
