package org.kosta.inssaground.model.vo;

import java.util.List;

public class GameProgramVO {
	private String programNo;
	private String title;
	private String detail;
	private String id;
	private List<OfficialGameVO> ogList;
	
	public GameProgramVO() {
		super();
	}
	

	public GameProgramVO(String programNo, String title, String detail, String id, List<OfficialGameVO> ogList) {
		super();
		this.programNo = programNo;
		this.title = title;
		this.detail = detail;
		this.id = id;
		this.ogList = ogList;
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
	public List<OfficialGameVO> getOgList() {
		return ogList;
	}
	public void setOgList(List<OfficialGameVO> ogList) {
		this.ogList = ogList;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "GameProgramVO [programNo=" + programNo + ", title=" + title + ", detail=" + detail + ", id=" + id
				+ ", ogList=" + ogList + "]";
	}

}
