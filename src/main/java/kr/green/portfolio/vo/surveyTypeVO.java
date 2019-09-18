package kr.green.portfolio.vo;

public class surveyTypeVO {
	
	private int surveyTypeNum;
	private int surveyTypeBoardNum;
	private String questionType;
	private String isEssential;
	private String surveyContents;
	private int depth;
	private int parentsQ;
	private int maxSelectNum;
	private int totalNum;
	
	
	public int getSurveyTypeNum() {
		return surveyTypeNum;
	}
	public void setSurveyTypeNum(int surveyTypeNum) {
		this.surveyTypeNum = surveyTypeNum;
	}
	public int getSurveyTypeBoardNum() {
		return surveyTypeBoardNum;
	}
	public void setSurveyTypeBoardNum(int surveyTypeBoardNum) {
		this.surveyTypeBoardNum = surveyTypeBoardNum;
	}
	public String getQuestionType() {
		return questionType;
	}
	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}
	public String getIsEssential() {
		return isEssential;
	}
	public void setIsEssential(String isEssential) {
		this.isEssential = isEssential;
	}
	public String getSurveyContents() {
		return surveyContents;
	}
	public void setSurveyContents(String surveyContents) {
		this.surveyContents = surveyContents;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getParentsQ() {
		return parentsQ;
	}
	public void setParentsQ(int parentsQ) {
		this.parentsQ = parentsQ;
	}
	public int getMaxSelectNum() {
		return maxSelectNum;
	}
	public void setMaxSelectNum(int maxSelectNum) {
		this.maxSelectNum = maxSelectNum;
	}
	public int getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}
	
	
	@Override
	public String toString() {
		return "surveyTypeVO [surveyTypeNum=" + surveyTypeNum + ", surveyTypeBoardNum=" + surveyTypeBoardNum
				+ ", questionType=" + questionType + ", isEssential=" + isEssential + ", surveyContents="
				+ surveyContents + ", depth=" + depth + ", parentsQ=" + parentsQ + ", maxSelectNum=" + maxSelectNum
				+ ", totalNum=" + totalNum + "]";
	}
	
	
	
	
	

}
