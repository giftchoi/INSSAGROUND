package org.kosta.inssaground.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.inssaground.model.mapper.MemberMapper;
import org.kosta.inssaground.model.vo.GroundVO;
import org.kosta.inssaground.model.vo.ListVO;
import org.kosta.inssaground.model.vo.MemberVO;
import org.kosta.inssaground.model.vo.ScheduleVO;
import org.springframework.stereotype.Service;
@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberMapper memberMapper;
	@Override
	public boolean checkEmailKey(String id, String emailKey) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void registerMember(MemberVO mvo, String path) {
		// TODO Auto-generated method stub

	}

	@Override
	public void login(MemberVO mvo) {
		// TODO Auto-generated method stub

	}

	@Override
	public MemberVO findMemberById(String id) {
		return memberMapper.findMemberById(id);
	}

	@Override
	public void updateMember(MemberVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void withdrawMember(MemberVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public ListVO<GroundVO> myGroundList(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ListVO<ScheduleVO> myScheduleList(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> selectAuthorityById(String id) {
		return memberMapper.getAuthorityById(id);
	}

}
