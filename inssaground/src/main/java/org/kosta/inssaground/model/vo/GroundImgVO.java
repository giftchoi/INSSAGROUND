package org.kosta.inssaground.model.vo;

public class GroundImgVO {
	private String groundImgNo;
	private String imgName;
	private String groundNo;
	public GroundImgVO() {
		super();
	}
	public GroundImgVO(String imgName, String groundNo) {
		super();
		this.imgName = imgName;
		this.groundNo = groundNo;
	}
	public GroundImgVO(String groundImgNo, String imgName, String groundNo) {
		super();
		this.groundImgNo = groundImgNo;
		this.imgName = imgName;
		this.groundNo = groundNo;
	}
	public String getGroundImgNo() {
		return groundImgNo;
	}
	public void setGroundImgNo(String groundImgNo) {
		this.groundImgNo = groundImgNo;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public String getGroundNo() {
		return groundNo;
	}
	public void setGroundNo(String groundNo) {
		this.groundNo = groundNo;
	}
	@Override
	public String toString() {
		return "groundImgVO [groundImgNo=" + groundImgNo + ", imgName=" + imgName + ", groundNo=" + groundNo + "]";
	}
	
	
}
