package kr.green.portfolio.vo;

public class ParticipationVO {
	private int participationNum;
	private String participationUserEmail;
	private String boardSubtype;
	private int participationVsTypeNum;
	private int participationSurveyTypeNum;
	private int participationBoardNum;
	
	
	public int getParticipationNum() {
		return participationNum;
	}
	public void setParticipationNum(int participationNum) {
		this.participationNum = participationNum;
	}
	public String getParticipationUserEmail() {
		return participationUserEmail;
	}
	public void setParticipationUserEmail(String participationUserEmail) {
		this.participationUserEmail = participationUserEmail;
	}
	public String getBoardSubtype() {
		return boardSubtype;
	}
	public void setBoardSubtype(String boardSubtype) {
		this.boardSubtype = boardSubtype;
	}
	public int getParticipationVsTypeNum() {
		return participationVsTypeNum;
	}
	public void setParticipationVsTypeNum(int participationVsTypeNum) {
		this.participationVsTypeNum = participationVsTypeNum;
	}
	public int getParticipationSurveyTypeNum() {
		return participationSurveyTypeNum;
	}
	public void setParticipationSurveyTypeNum(int participationSurveyTypeNum) {
		this.participationSurveyTypeNum = participationSurveyTypeNum;
	}
	public int getParticipationBoardNum() {
		return participationBoardNum;
	}
	public void setParticipationBoardNum(int participationBoardNum) {
		this.participationBoardNum = participationBoardNum;
	}
	
	
	@Override
	public String toString() {
		return "ParticipationVO [participationNum=" + participationNum + ", participationUserEmail="
				+ participationUserEmail + ", boardSubtype=" + boardSubtype + ", participationVsTypeNum="
				+ participationVsTypeNum + ", participationSurveyTypeNum=" + participationSurveyTypeNum
				+ ", participationBoardNum=" + participationBoardNum + "]";
	}
	
	
	
	

}
