package org.kosta.inssaground.model.vo;

public class GameProgramListVO {
	private String programNo;
	private String programTitle;
	private String detail;
	private String oGameNo;
	private String title;
	private int minPersonnel;
	private int maxPersonnel;
	private int gameTime;
	private String materials;
	private String content;
	private String id;
	private int cgNo;
	public GameProgramListVO() {
		super();
	}


	public GameProgramListVO(String programNo, String programTitle, String detail, String oGameNo, String title,
			int minPersonnel, int maxPersonnel, int gameTime, String materials, String content, String id, int cgNo) {
		super();
		this.programNo = programNo;
		this.programTitle = programTitle;
		this.detail = detail;
		this.oGameNo = oGameNo;
		this.title = title;
		this.minPersonnel = minPersonnel;
		this.maxPersonnel = maxPersonnel;
		this.gameTime = gameTime;
		this.materials = materials;
		this.content = content;
		this.id = id;
		this.cgNo = cgNo;
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
	public int getMinPersonnel() {
		return minPersonnel;
	}
	public void setMinPersonnel(int minPersonnel) {
		this.minPersonnel = minPersonnel;
	}
	public int getMaxPersonnel() {
		return maxPersonnel;
	}
	public void setMaxPersonnel(int maxPersonnel) {
		this.maxPersonnel = maxPersonnel;
	}
	public int getGameTime() {
		return gameTime;
	}
	public void setGameTime(int gameTime) {
		this.gameTime = gameTime;
	}	
	public String getMaterials() {
		return materials;
	}
	public void setMaterials(String materials) {
		this.materials = materials;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCgNo() {
		return cgNo;
	}
	public void setCgNo(int cgNo) {
		this.cgNo = cgNo;
	}
	public String getProgramNo() {
		return programNo;
	}
	public void setProgramNo(String programNo) {
		this.programNo = programNo;
	}
	public String getProgramTitle() {
		return programTitle;
	}
	public void setProgramTitle(String programTitle) {
		this.programTitle = programTitle;
	}

	@Override
	public String toString() {
		return "GameProgramListVO [programNo=" + programNo + ", programTitle=" + programTitle + ", detail=" + detail
				+ ", oGameNo=" + oGameNo + ", title=" + title + ", minPersonnel=" + minPersonnel + ", maxPersonnel="
				+ maxPersonnel + ", gameTime=" + gameTime + ", materials=" + materials + ", content=" + content
				+ ", id=" + id + ", cgNo=" + cgNo + "]";
	}

}
