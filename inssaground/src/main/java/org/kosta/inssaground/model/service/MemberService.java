package org.kosta.inssaground.model.service;

import org.kosta.inssaground.model.vo.MemberVO;

public interface MemberService {
	public boolean checkEmailKey(String id,String emailKey);
	public void registerMember(MemberVO mvo,String path);
	public void login(MemberVO mvo);
	public MemberVO findMemberById(String id);
	public void updateMember(MemberVO vo);
	public void withdrawMember(MemberVO vo);
}
