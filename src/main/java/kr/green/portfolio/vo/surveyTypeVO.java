package kr.green.portfolio.vo;

public class surveyTypeVO {
	
	private int surveyTypeNum;
	private int surveyTypeBoardNum;
	private String questionType;
	private String isEssential;
	private String surveyContents;
	private int depth;
	private int parentsQ;
	
	
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
	
	
	
	@Override
	public String toString() {
		return "surveyTypeVO [surveyTypeNum=" + surveyTypeNum + ", surveyTypeBoardNum=" + surveyTypeBoardNum
				+ ", questionType=" + questionType + ", isEssential=" + isEssential + ", surveyContents="
				+ surveyContents + ", depth=" + depth + ", parentsQ=" + parentsQ + "]";
	}
	
	
	
	

}
