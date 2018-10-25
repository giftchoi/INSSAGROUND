 package org.kosta.inssaground.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.kosta.inssaground.model.vo.GroundVO;
import org.kosta.inssaground.model.vo.ListVO;
import org.kosta.inssaground.model.vo.MemberVO;
import org.kosta.inssaground.model.vo.ReportVO;
import org.kosta.inssaground.model.vo.ScheduleVO;
import org.springframework.web.multipart.MultipartFile;

public interface MemberService {
	/**
	 * 사용자가 입력한 키와 보내준 키를 비교해준다
	 * @param email
	 * @param emailKey
	 * @return
	 */
	public String checkEmailKey(String email, String emailKey);
	/**
	 * 회원 가입
	 * @param mvo
	 * @param picture
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	public void registerMember(MemberVO mvo,MultipartFile picture) throws IllegalStateException, IOException;
	/**
	 * 아이디로 멤버 찾기
	 * @param id
	 * @return
	 */
	public MemberVO findMemberById(String id);
	/**
	 * 회원 정보 수정
	 * @param vo
	 */
	public void updateMember(MemberVO vo);
	/**
	 * 회원 탈퇴
	 * @param vo
	 */
	public void withdrawMember(MemberVO vo);
	/**
	 * 내가 참여한 모임번호 보기
	 * @param id
	 * @return
	 */
	public List<Map<String,String>> myGroundNoList(String id); //내가 참여한 모임번호 보기
	/**
	 * 내가 참여한 모임 보기
	 * @param id
	 * @return
	 */
	public List<Map<String, String>> myGroundList(String id); // 내가 참여한 모임 보기
	/**
	 * 내가 참여한 모임의 일정 보기
	 * @param id
	 * @param pageNo
	 * @return
	 */
	public ListVO<ScheduleVO> myScheduleList(String id,String pageNo); // 내가 참여한 모임의 일정 보기
	/**
	 * 로그인시 회원 권한을 가져온다
	 * @param id
	 * @return
	 */
	public List<String> selectAuthorityById(String id);
	/**
	 * 회원 가입시 아이디 중복 체크
	 * @param id
	 * @return
	 */
	public String idcheck(String id);
	/**
	 * 회원가입시 이메일로 키를 보내준다
	 * @param email
	 */
	public void sendEmailForRegister(String email);
	/**
	 * 아이디 찾기
	 * @param vo
	 * @return
	 */
	public List<String> findMemberId(MemberVO vo);
	/**
	 * 비밀번호 찾기
	 * @param id
	 * @throws Exception
	 */
	public void findPassword(String id) throws Exception;
	/**
	 * 프로필 사진 가져오기
	 * @param id
	 * @return
	 */
	public String getProfileIMGName(String id);
	/**
	 * 모임 신고
	 * @param reportVO
	 */
	public void reportGround(ReportVO reportVO);
}
