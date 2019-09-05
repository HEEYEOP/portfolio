package kr.green.portfolio.vo;

public class FieldVO {
	private int fieldNum;
	private String fieldTitle;
	public int getFieldNum() {
		return fieldNum;
	}
	public void setFieldNum(int fieldNum) {
		this.fieldNum = fieldNum;
	}
	public String getFieldTitle() {
		return fieldTitle;
	}
	public void setFieldTitle(String fieldTitle) {
		this.fieldTitle = fieldTitle;
	}
	@Override
	public String toString() {
		return "FieldVO [fieldNum=" + fieldNum + ", fieldTitle=" + fieldTitle + "]";
	}
	
	
	
	

}
