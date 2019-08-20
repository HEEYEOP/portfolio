package kr.green.portfolio.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UserVO {
	private String userEmail;
	private String userType;
	private String userName;
	private String userPw;
	private String userPhone;
	private String userGender;
	private Date userBirth;
	private String confirmFile;
	private int writeBoardCount;
	private int writeCommentCount;
	private int likesBoardCount;
	private String isMember;
	
	
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public Date getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(Date userBirth) {
		this.userBirth = userBirth;
	}
	public void setUserBirth(String userBirth) {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			this.userBirth = transFormat.parse(userBirth);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	public String getConfirmFile() {
		return confirmFile;
	}
	public void setConfirmFile(String confirmFile) {
		this.confirmFile = confirmFile;
	}
	public int getWriteBoardCount() {
		return writeBoardCount;
	}
	public void setWriteBoardCount(int writeBoardCount) {
		this.writeBoardCount = writeBoardCount;
	}
	public int getWriteCommentCount() {
		return writeCommentCount;
	}
	public void setWriteCommentCount(int writeCommentCount) {
		this.writeCommentCount = writeCommentCount;
	}
	public int getLikesBoardCount() {
		return likesBoardCount;
	}
	public void setLikesBoardCount(int likesBoardCount) {
		this.likesBoardCount = likesBoardCount;
	}
	public String getIsMember() {
		return isMember;
	}
	public void setIsMember(String isMember) {
		this.isMember = isMember;
	}
	
	@Override
	public String toString() {
		return "UserVO [userEmail=" + userEmail + ", userType=" + userType + ", userName=" + userName + ", userPw="
				+ userPw + ", userPhone=" + userPhone + ", userGender=" + userGender + ", userBirth=" + userBirth
				+ ", confirmFile=" + confirmFile + ", writeBoardCount=" + writeBoardCount + ", writeCommentCount="
				+ writeCommentCount + ", likesBoardCount=" + likesBoardCount + ", isMember=" + isMember + "]";
	}
	
	
	
	
	
	
	
	
	

}
