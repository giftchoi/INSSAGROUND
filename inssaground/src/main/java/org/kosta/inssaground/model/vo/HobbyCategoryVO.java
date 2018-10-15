package org.kosta.inssaground.model.vo;

public class HobbyCategoryVO {
	private String hobbyCategoryNo;
	private String category;
	public HobbyCategoryVO() {
		super();
	}
	public HobbyCategoryVO(String category) {
		super();
		this.category = category;
	}
	public HobbyCategoryVO(String hobbyCategoryNo, String category) {
		super();
		this.hobbyCategoryNo = hobbyCategoryNo;
		this.category = category;
	}
	public String getHobbyCategoryNo() {
		return hobbyCategoryNo;
	}
	public void setHobbyCategoryNo(String hobbyCategoryNo) {
		this.hobbyCategoryNo = hobbyCategoryNo;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "HobbyCategoryVO [hobbyCategoryNo=" + hobbyCategoryNo + ", category=" + category + "]";
	}
	
}
