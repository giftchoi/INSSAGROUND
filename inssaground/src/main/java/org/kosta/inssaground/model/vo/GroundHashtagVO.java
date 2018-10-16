package org.kosta.inssaground.model.vo;

public class GroundHashtagVO {
	private String groundNo;
	private String content;
	public GroundHashtagVO() {
		super();
	}
	public GroundHashtagVO(String content) {
		super();
		this.content = content;
	}
	public GroundHashtagVO(String groundNo, String content) {
		super();
		this.groundNo = groundNo;
		this.content = content;
	}
	public String getGroundNo() {
		return groundNo;
	}
	public void setGroundNo(String groundNo) {
		this.groundNo = groundNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "GroundHashtag [groundNo=" + groundNo + ", content=" + content + "]";
	}
	
}
