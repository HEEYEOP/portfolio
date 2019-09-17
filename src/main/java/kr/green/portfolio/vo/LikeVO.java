package kr.green.portfolio.vo;

public class LikeVO {
	
	private int likeNum;
	private int likeBoardNum;
	private String likeUserEmail;
	private String isLike;
	
	
	public int getLikeNum() {
		return likeNum;
	}
	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}
	public int getLikeBoardNum() {
		return likeBoardNum;
	}
	public void setLikeBoardNum(int likeBoardNum) {
		this.likeBoardNum = likeBoardNum;
	}
	public String getLikeUserEmail() {
		return likeUserEmail;
	}
	public void setLikeUserEmail(String likeUserEmail) {
		this.likeUserEmail = likeUserEmail;
	}
	public String getIsLike() {
		return isLike;
	}
	public void setIsLike(String isLike) {
		this.isLike = isLike;
	}
	
	
	@Override
	public String toString() {
		return "LikeVO [likeNum=" + likeNum + ", likeBoardNum=" + likeBoardNum + ", likeUserEmail=" + likeUserEmail
				+ ", isLike=" + isLike + "]";
	}
	
	
	
	
	

}
