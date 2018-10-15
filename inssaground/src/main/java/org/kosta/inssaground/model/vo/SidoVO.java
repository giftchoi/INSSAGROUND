package org.kosta.inssaground.model.vo;

public class SidoVO {
	private String sidoNo;
	private String sido;
	public SidoVO() {
		super();
	}
	public SidoVO(String sido) {
		super();
		this.sido = sido;
	}
	public SidoVO(String sidoNo, String sido) {
		super();
		this.sidoNo = sidoNo;
		this.sido = sido;
	}
	public String getSidoNo() {
		return sidoNo;
	}
	public void setSidoNo(String sidoNo) {
		this.sidoNo = sidoNo;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	@Override
	public String toString() {
		return "SidoVO [sidoNo=" + sidoNo + ", sido=" + sido + "]";
	}
	
}
