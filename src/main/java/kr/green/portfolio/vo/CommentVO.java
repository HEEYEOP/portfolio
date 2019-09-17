package kr.green.portfolio.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CommentVO {
	
	private int commentNum;
	private int commentBoardNum;
	private String commentUserEmail;
	private String commentContents;
	private Date registrationDate;
	private String display;
	
	
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	public int getCommentBoardNum() {
		return commentBoardNum;
	}
	public void setCommentBoardNum(int commentBoardNum) {
		this.commentBoardNum = commentBoardNum;
	}
	public String getCommentUserEmail() {
		return commentUserEmail;
	}
	public void setCommentUserEmail(String commentUserEmail) {
		this.commentUserEmail = commentUserEmail;
	}
	public String getCommentContents() {
		return commentContents;
	}
	public void setCommentContents(String commentContents) {
		this.commentContents = commentContents;
	}
	public Date getRegistrationDate() {
		return registrationDate;
	}
	
	//수정
	public String getRegistrationDate2() {
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		return f.format(registrationDate);
		
	}
	
	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}
	public String getDisplay() {
		return display;
	}
	public void setDisplay(String display) {
		this.display = display;
	}
	
	
	@Override
	public String toString() {
		return "CommentVO [commentNum=" + commentNum + ", commentBoardNum=" + commentBoardNum + ", commentUserEmail="
				+ commentUserEmail + ", commentContents=" + commentContents + ", registrationDate=" + registrationDate
				+ ", display=" + display + "]";
	}
	
	
	
	
	

}
