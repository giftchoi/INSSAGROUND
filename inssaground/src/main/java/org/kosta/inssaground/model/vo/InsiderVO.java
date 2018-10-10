package org.kosta.inssaground.model.vo;

public class InsiderVO {
	private int attendance;
	private MemberVO memberVO;
	public InsiderVO() {
		super();
	}
	public InsiderVO(int attendance, MemberVO memberVO) {
		super();
		this.attendance = attendance;
		this.memberVO = memberVO;
	}
	public int getAttendance() {
		return attendance;
	}
	public void setAttendance(int attendance) {
		this.attendance = attendance;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	@Override
	public String toString() {
		return "InsiderVO [attendance=" + attendance + ", memberVO=" + memberVO + "]";
	}
	
}
