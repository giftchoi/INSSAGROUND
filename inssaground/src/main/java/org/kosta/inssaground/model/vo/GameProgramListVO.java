package org.kosta.inssaground.model.vo;

public class GameProgramListVO {
	private String detail;
	private String oGameNo;
	private String title;
	private int minPersonnel;
	private int maxPersonnel;
	private int gameTime;
	public GameProgramListVO() {
		super();
	}
	public GameProgramListVO(String detail, String oGameNo, String title, int minPersonnel, int maxPersonnel,
			int gameTime) {
		super();
		this.detail = detail;
		this.oGameNo = oGameNo;
		this.title = title;
		this.minPersonnel = minPersonnel;
		this.maxPersonnel = maxPersonnel;
		this.gameTime = gameTime;
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
	@Override
	public String toString() {
		return "GameProgramListVO [detail=" + detail + ", oGameNo=" + oGameNo + ", title=" + title + ", minPersonnel="
				+ minPersonnel + ", maxPersonnel=" + maxPersonnel + ", gameTime=" + gameTime + "]";
	}


	
}
