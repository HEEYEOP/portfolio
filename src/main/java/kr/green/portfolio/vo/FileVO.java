package kr.green.portfolio.vo;

public class FileVO {
	
	private int fileNum;
	private int fileBoardNum;
	private String isMainImg;
	private String fileTitle;
	private String display;
	
	
	
	public int getFileNum() {
		return fileNum;
	}
	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
	}
	public int getFileBoardNum() {
		return fileBoardNum;
	}
	public void setFileBoardNum(int fileBoardNum) {
		this.fileBoardNum = fileBoardNum;
	}
	public String getIsMainImg() {
		return isMainImg;
	}
	public void setIsMainImg(String isMainImg) {
		this.isMainImg = isMainImg;
	}
	public String getFileTitle() {
		return fileTitle;
	}
	public void setFileTitle(String fileTitle) {
		this.fileTitle = fileTitle;
	}
	public String getDisplay() {
		return display;
	}
	public void setDisplay(String display) {
		this.display = display;
	}
	
	
	@Override
	public String toString() {
		return "FileVO [fileNum=" + fileNum + ", fileBoardNum=" + fileBoardNum + ", isMainImg=" + isMainImg
				+ ", fileTitle=" + fileTitle + ", display=" + display + "]";
	}
	
	
	
	

}
