package org.kosta.inssaground.model.vo;

public class HobbyVO {
	private String hobbyNo;
	private String name;
	private String category;
	public HobbyVO() {
		super();
	}
	public HobbyVO(String name, String category) {
		super();
		this.name = name;
		this.category = category;
	}
	public HobbyVO(String hobbyNo, String name, String category) {
		super();
		this.hobbyNo = hobbyNo;
		this.name = name;
		this.category = category;
	}
	public String getHobbyNo() {
		return hobbyNo;
	}
	public void setHobbyNo(String hobbyNo) {
		this.hobbyNo = hobbyNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "HobbyVO [hobbyNo=" + hobbyNo + ", name=" + name + ", category=" + category + "]";
	}
	
}
