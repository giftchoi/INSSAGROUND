package org.kosta.inssaground.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.kosta.inssaground.model.vo.GroundVO;
import org.kosta.inssaground.model.vo.ListVO;
import org.kosta.inssaground.model.vo.MemberVO;
import org.kosta.inssaground.model.vo.ScheduleVO;
import org.springframework.web.multipart.MultipartFile;

public interface MemberService {
	public String checkEmailKey(String email, String emailKey);

	public void registerMember(MemberVO mvo,MultipartFile picture) throws IllegalStateException, IOException;

	public MemberVO findMemberById(String id);

	public void updateMember(MemberVO vo);

	public void withdrawMember(MemberVO vo);

	public List<Map<String,String>> myGroundNoList(String id); //내가 참여한 모임번호 보기
	
	public List<Map<String, String>> myGroundList(String id); // 내가 참여한 모임 보기

	public ListVO<ScheduleVO> myScheduleList(String id); // 내가 참여한 모임의 일정 보기

	public List<String> selectAuthorityById(String id);

	public String idcheck(String id);

	public void sendEmailForRegister(String email);

	public List<String> findMemberId(MemberVO vo);

	public void findPassword(String id) throws Exception;

	public String getProfileIMGName(String id);
}
