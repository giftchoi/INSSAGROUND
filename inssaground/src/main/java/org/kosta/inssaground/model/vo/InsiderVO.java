package org.kosta.inssaground.model.vo;

public class InsiderVO {
	private int attendance;
	private MemberVO memberVO;
	private int status;
	private String groundNo;
	public InsiderVO() {
		super();
	}

	public InsiderVO(int attendance, MemberVO memberVO, int status, String groundNo) {
		super();
		this.attendance = attendance;
		this.memberVO = memberVO;
		this.status = status;
		this.groundNo = groundNo;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	public String getGroundNo() {
		return groundNo;
	}

	public void setGroundNo(String groundNo) {
		this.groundNo = groundNo;
	}

	@Override
	public String toString() {
		return "InsiderVO [attendance=" + attendance + ", memberVO=" + memberVO + ", status=" + status + ", groundNo="
				+ groundNo + "]";
	}
	
	
}
