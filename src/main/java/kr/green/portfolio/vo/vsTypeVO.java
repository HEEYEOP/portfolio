package kr.green.portfolio.vo;

public class vsTypeVO {
	
	private int vsTypeNum;
	private int vsTypeBoardNum;
	private String yORn;
	private String vsContents;
	private int totalNum;
	
	
	
	public int getVsTypeNum() {
		return vsTypeNum;
	}
	public void setVsTypeNum(int vsTypeNum) {
		this.vsTypeNum = vsTypeNum;
	}
	public int getVsTypeBoardNum() {
		return vsTypeBoardNum;
	}
	public void setVsTypeBoardNum(int vsTypeBoardNum) {
		this.vsTypeBoardNum = vsTypeBoardNum;
	}
	public String getyORn() {
		return yORn;
	}
	public void setyORn(String yORn) {
		this.yORn = yORn;
	}
	public String getVsContents() {
		return vsContents;
	}
	public void setVsContents(String vsContents) {
		this.vsContents = vsContents;
	}
	public int getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}
	
	
	@Override
	public String toString() {
		return "vsTypeVO [vsTypeNum=" + vsTypeNum + ", vsTypeBoardNum=" + vsTypeBoardNum + ", yORn=" + yORn
				+ ", vsContents=" + vsContents + ", totalNum=" + totalNum + "]";
	}
	
	
	
	
	
	

}
