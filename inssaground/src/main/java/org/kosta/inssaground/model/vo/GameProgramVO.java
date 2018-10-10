package org.kosta.inssaground.model.vo;

public class GameProgramVO {
	private String programNo;
	private String title;
	private String detail;
	public GameProgramVO() {
		super();
	}
	public GameProgramVO(String programNo, String title, String detail) {
		super();
		this.programNo = programNo;
		this.title = title;
		this.detail = detail;
	}
	public String getProgramNo() {
		return programNo;
	}
	public void setProgramNo(String programNo) {
		this.programNo = programNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	@Override
	public String toString() {
		return "GameProgramVO [programNo=" + programNo + ", title=" + title + ", detail=" + detail + "]";
	}
	
}
