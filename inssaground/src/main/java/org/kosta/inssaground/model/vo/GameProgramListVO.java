package org.kosta.inssaground.model.vo;

public class GameProgramListVO {
	private String detail;
	private String oGameNo;
	private String title;
	public GameProgramListVO() {
		super();
	}
	public GameProgramListVO(String detail, String oGameNo, String title) {
		super();
		this.detail = detail;
		this.oGameNo = oGameNo;
		this.title = title;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getoGameNo() {
		return oGameNo;
	}
	public void setoGameNo(String oGameNo) {
		this.oGameNo = oGameNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "GameProgramListVO [detail=" + detail + ", oGameNo=" + oGameNo + ", title=" + title + "]";
	}
	
}
