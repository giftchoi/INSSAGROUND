package org.kosta.inssaground.model.vo;

public class ProgramOfficialGameVO {
	private String programNo;
	private String oGameNo;
	private int gameOrder;
	public ProgramOfficialGameVO() {
		super();
	}
	
	public ProgramOfficialGameVO(String programNo, String oGameNo, int gameOrder) {
		super();
		this.programNo = programNo;
		this.oGameNo = oGameNo;
		this.gameOrder = gameOrder;
	}

	public String getProgramNo() {
		return programNo;
	}
	public void setProgramNo(String programNo) {
		this.programNo = programNo;
	}
	public String getoGameNo() {
		return oGameNo;
	}
	public void setoGameNo(String oGameNo) {
		this.oGameNo = oGameNo;
	}
	public int getGameOrder() {
		return gameOrder;
	}
	public void setGameOrder(int gameOrder) {
		this.gameOrder = gameOrder;
	}

	@Override
	public String toString() {
		return "ProgramOfficialGameVO [programNo=" + programNo + ", oGameNo=" + oGameNo + ", gameOrder=" + gameOrder
				+ "]";
	}
	
	
	
}
