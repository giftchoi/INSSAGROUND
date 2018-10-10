package org.kosta.inssaground.model.vo;

import java.util.List;

public class GroundVO {
	private String groundNo;
	private String groundName;
	private int maxPersonnel;
	private String introduction;
	private String hobby;
	private String master;
	private List<String> tagList;
	public GroundVO() {
		super();
	}
	public GroundVO(String groundName, int maxPersonnel, String introduction, String hobby, String master,
			List<String> tagList) {
		super();
		this.groundName = groundName;
		this.maxPersonnel = maxPersonnel;
		this.introduction = introduction;
		this.hobby = hobby;
		this.master = master;
		this.tagList = tagList;
	}
	public GroundVO(String groundNo, String groundName, int maxPersonnel, String introduction, String hobby,
			String master, List<String> tagList) {
		super();
		this.groundNo = groundNo;
		this.groundName = groundName;
		this.maxPersonnel = maxPersonnel;
		this.introduction = introduction;
		this.hobby = hobby;
		this.master = master;
		this.tagList = tagList;
	}
	public String getGroundNo() {
		return groundNo;
	}
	public void setGroundNo(String groundNo) {
		this.groundNo = groundNo;
	}
	public String getGroundName() {
		return groundName;
	}
	public void setGroundName(String groundName) {
		this.groundName = groundName;
	}
	public int getMaxPersonnel() {
		return maxPersonnel;
	}
	public void setMaxPersonnel(int maxPersonnel) {
		this.maxPersonnel = maxPersonnel;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getMaster() {
		return master;
	}
	public void setMaster(String master) {
		this.master = master;
	}
	public List<String> getTagList() {
		return tagList;
	}
	public void setTagList(List<String> tagList) {
		this.tagList = tagList;
	}
	@Override
	public String toString() {
		return "GroundVO [groundNo=" + groundNo + ", groundName=" + groundName + ", maxPersonnel=" + maxPersonnel
				+ ", introduction=" + introduction + ", hobby=" + hobby + ", master=" + master + ", tagList=" + tagList
				+ "]";
	}
	
}
