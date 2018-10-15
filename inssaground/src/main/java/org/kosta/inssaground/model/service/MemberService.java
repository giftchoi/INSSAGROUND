package org.kosta.inssaground.model.service;

import java.util.List;

import org.kosta.inssaground.model.vo.GroundVO;
import org.kosta.inssaground.model.vo.ListVO;
import org.kosta.inssaground.model.vo.MemberVO;
import org.kosta.inssaground.model.vo.ScheduleVO;

public interface MemberService {
	public boolean checkEmailKey(String id, String emailKey);

	public void registerMember(MemberVO mvo, String path);

	public void login(MemberVO mvo);

	public MemberVO findMemberById(String id);

	public void updateMember(MemberVO vo);

	public void withdrawMember(MemberVO vo);

	public ListVO<GroundVO> myGroundList(String id); // 내가 참여한 모임 보기

	public ListVO<ScheduleVO> myScheduleList(String id); // 내가 참여한 모임의 일정 보기

	public List<String> selectAuthorityById(String id);
}
