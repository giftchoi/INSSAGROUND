package org.kosta.inssaground.model.vo;

public class FeatureVO {
	private String FeatureNo;
	private String name;
	public FeatureVO() {
		super();
	}
	public FeatureVO(String featureNo, String name) {
		super();
		FeatureNo = featureNo;
		this.name = name;
	}
	public String getFeatureNo() {
		return FeatureNo;
	}
	public void setFeatureNo(String featureNo) {
		FeatureNo = featureNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "FeatureVO [FeatureNo=" + FeatureNo + ", name=" + name + "]";
	}
	
}
