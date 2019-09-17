package kr.green.portfolio.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardVO extends FieldVO {
	private int boardNum;
	private String boardUserEmail;
	private String boardType;
	private String boardTitle;
	private String boardContents;
	private Date registrationDate;
	private int commentsCount;
	private int viewsCount;
	private int likesCount;
	private String display;
	private String boardSubtype;
	private String answer;
	private int boardFieldNum;
	private int boardInquiryNum;
	private Date boardDeadline;
	
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getBoardUserEmail() {
		return boardUserEmail;
	}
	public void setBoardUserEmail(String boardUserEmail) {
		this.boardUserEmail = boardUserEmail;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContents() {
		return boardContents;
	}
	public void setBoardContents(String boardContents) {
		this.boardContents = boardContents;
	}
	public Date getRegistrationDate() {
		return registrationDate;
	}
	public String getRegistrationDate2() {
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		return f.format(registrationDate);
	}
	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}
	public int getCommentsCount() {
		return commentsCount;
	}
	public void setCommentsCount(int commentsCount) {
		this.commentsCount = commentsCount;
	}
	public int getViewsCount() {
		return viewsCount;
	}
	public void setViewsCount(int viewsCount) {
		this.viewsCount = viewsCount;
	}
	public int getLikesCount() {
		return likesCount;
	}
	public void setLikesCount(int likesCount) {
		this.likesCount = likesCount;
	}
	public String getDisplay() {
		return display;
	}
	public void setDisplay(String display) {
		this.display = display;
	}
	public String getBoardSubtype() {
		return boardSubtype;
	}
	public void setBoardSubtype(String boardSubtype) {
		this.boardSubtype = boardSubtype;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public int getBoardFieldNum() {
		return boardFieldNum;
	}
	public void setBoardFieldNum(int boardFieldNum) {
		this.boardFieldNum = boardFieldNum;
	}
	public int getBoardInquiryNum() {
		return boardInquiryNum;
	}
	public void setBoardInquiryNum(int boardInquiryNum) {
		this.boardInquiryNum = boardInquiryNum;
	}
	public Date getBoardDeadline() {
		return boardDeadline;
	}
	public String getBoardDeadline2() {
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		return f.format(boardDeadline);
		
	}
	public void setBoardDeadline(Date boardDeadline) {
		this.boardDeadline = boardDeadline;
	}
	public void setBoardDeadlineString(String boardDeadline) {
		//여기에 문자열로 들어온 날짜를 date타입으로 변환해주는거야!!
		/* this.boardDeadline = boardDeadline; */
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			this.boardDeadline = transFormat.parse(boardDeadline);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
	
	@Override
	public String toString() {
		return "BoardVO [boardNum=" + boardNum + ", boardUserEmail=" + boardUserEmail + ", boardType=" + boardType
				+ ", boardTitle=" + boardTitle + ", boardContents=" + boardContents + ", registrationDate="
				+ registrationDate + ", commentsCount=" + commentsCount + ", viewsCount=" + viewsCount + ", likesCount="
				+ likesCount + ", display=" + display + ", boardSubtype=" + boardSubtype + ", answer=" + answer
				+ ", boardFieldNum=" + boardFieldNum + ", boardInquiryNum=" + boardInquiryNum + ", boardDeadline="
				+ boardDeadline + "]";
	}
	
	
	
}


