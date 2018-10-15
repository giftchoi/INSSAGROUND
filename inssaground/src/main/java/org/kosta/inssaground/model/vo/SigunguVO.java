package org.kosta.inssaground.model.vo;

public class SigunguVO {
	private String sigunguNo;
	private String sigunguName;
	private String sidoNo;
	public SigunguVO() {
		super();
	}
	public SigunguVO(String sigunguName, String sidoNo) {
		super();
		this.sigunguName = sigunguName;
		this.sidoNo = sidoNo;
	}
	public SigunguVO(String sigunguNo, String sigunguName, String sidoNo) {
		super();
		this.sigunguNo = sigunguNo;
		this.sigunguName = sigunguName;
		this.sidoNo = sidoNo;
	}
	public String getSigunguNo() {
		return sigunguNo;
	}
	public void setSigunguNo(String sigunguNo) {
		this.sigunguNo = sigunguNo;
	}
	public String getSigunguName() {
		return sigunguName;
	}
	public void setSigunguName(String sigunguName) {
		this.sigunguName = sigunguName;
	}
	public String getSidoNo() {
		return sidoNo;
	}
	public void setSidoNo(String sidoNo) {
		this.sidoNo = sidoNo;
	}
	@Override
	public String toString() {
		return "SigunguVO [sigunguNo=" + sigunguNo + ", sigunguName=" + sigunguName + ", sidoNo=" + sidoNo + "]";
	}
	
}
