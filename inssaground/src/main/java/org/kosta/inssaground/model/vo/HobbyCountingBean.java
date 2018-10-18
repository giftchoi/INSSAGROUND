package org.kosta.inssaground.model.vo;

public class HobbyCountingBean implements Comparable<HobbyCountingBean>{
	private int hobbyNo;
	private int count;
	
	public HobbyCountingBean(int hobbyNo, int count) {
		super();
		this.hobbyNo = hobbyNo;
		this.count = count;
	}

	public HobbyCountingBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getHobbyNo() {
		return hobbyNo;
	}

	public void setHobbyNo(int hobbyNo) {
		this.hobbyNo = hobbyNo;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	public void increaseCount() {
		this.count++;
	}
	@Override
	public String toString() {
		return "HobbyCountingBean [hobbyNo=" + hobbyNo + ", count=" + count + "]";
	}

	@Override
	public int compareTo(HobbyCountingBean o) {
		// TODO Auto-generated method stub
		return Integer.compare(o.count, this.count);	//내림차순
	}
}