package kr.green.portfolio.vo;

import java.util.Date;

public class UserVO {
	private String user_email;
	private String user_type;
	private String user_name;
	private String user_pw;
	private String user_phone;
	private String user_gender;
	private Date user_birth;
	private String confirmFile;
	private int writeBoardCount;
	private int writeCommentCount;
	private int likesBoardCount;
	private String isMember;
	
	
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public Date getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(Date user_birth) {
		this.user_birth = user_birth;
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
		return "UserVO [user_email=" + user_email + ", user_type=" + user_type + ", user_name=" + user_name
				+ ", user_pw=" + user_pw + ", user_phone=" + user_phone + ", user_gender=" + user_gender
				+ ", user_birth=" + user_birth + ", confirmFile=" + confirmFile + ", writeBoardCount=" + writeBoardCount
				+ ", writeCommentCount=" + writeCommentCount + ", likesBoardCount=" + likesBoardCount + ", isMember="
				+ isMember + "]";
	}
	
	
	
	
	
	
	
	

}
