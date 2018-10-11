package org.kosta.inssaground.model.service;

import org.kosta.inssaground.model.vo.MemberVO;

public interface MemberService {
	public boolean checkEmailKey(String id,String emailKey);
	public void registerMember(MemberVO mvo,String path);
	public void login(MemberVO mvo);
	public MemberVO findMemberById(String id);
	public void updateMember(MemberVO vo);
	public void withdrawMember(MemberVO vo);
//	public ListVO myGroundList(String id); // 내가 참여한 모임 보기
//	public ListVO myScheduleList(String id); // 내가 참여한 모임의 일정 보기
}
