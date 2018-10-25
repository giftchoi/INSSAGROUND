package org.kosta.inssaground.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.kosta.inssaground.model.vo.GroundVO;
import org.kosta.inssaground.model.vo.HobbyCategoryVO;
import org.kosta.inssaground.model.vo.HobbyVO;
import org.kosta.inssaground.model.vo.InsiderVO;
import org.kosta.inssaground.model.vo.ListVO;
import org.kosta.inssaground.model.vo.MemberVO;
import org.kosta.inssaground.model.vo.NoticeVO;
import org.kosta.inssaground.model.vo.PostVO;
import org.kosta.inssaground.model.vo.ScheduleVO;
import org.kosta.inssaground.model.vo.SidoVO;
import org.kosta.inssaground.model.vo.SigunguVO;

public interface GroundService {
	/**
	 * 	모임 개설 신청
	 * @param groundVO
	 * @param sidoVO
	 * @param sigunguVO
	 * @param hobbyVO
	 * @param hobbyCategoryVO
	 */
	public void applyGround(GroundVO groundVO,SidoVO sidoVO,SigunguVO sigunguVO,HobbyVO hobbyVO,HobbyCategoryVO hobbyCategoryVO); // 모임신청
	/**
	 *  모든 시도를 가져온다
	 * @return
	 */
	public List<SidoVO> getAllSido();// 모든 시도
	/**
	 *  모임 상세보기
	 * @param groundVO
	 * @return
	 */
	public GroundVO groundDetail(GroundVO groundVO); // 모임 상세보기
	/*public void registerGroundSchedule(ScheduleVO scheduleVO); //모임 일정 등록 삭제*/	
	/**
	 * 모임 일정 삭제
	 * @param scheduleVO
	 */
	public void deleteGroundSchedule(ScheduleVO scheduleVO); // 모임 일정 삭제	
	//public void masterGroundManagement(GroundVO groundVO);// 모임장 모임 관리	
	/**
	 * 모임 공지 수정
	 * @param noticeVO
	 */
	public void updateGroundNotice(NoticeVO noticeVO); // 모임 공지 수정
	/**
	 * 모임 공지 삭제
	 * @param noticeNo
	 */
	public void deleteGroundNotice(String noticeNo);// 모임 공지 삭제	
	/**
	 * 모임 일정 수정
	 * @param scheduleVO
	 */
	public void updateGroundSchedule(ScheduleVO scheduleVO);// 모임 일정 수정
	/*SOJEONG*/
	/**
	 * 모든 시군구를 가져온다
	 * @param sido
	 * @return
	 */
	public List<SigunguVO> getSigungu(String sido);	
	/**
	 * 모임 검색 결과
	 * @param map
	 * @return
	 */
	public int getGroundSearchResultCount(Map<String,Object> map);
	/**
	 * 모임 검색
	 * @param sido
	 * @param sigungu
	 * @param category
	 * @param hobby
	 * @param groundVO
	 * @param nowPage
	 * @return
	 */
	public ListVO<GroundVO> searchGround(String sido, String sigungu, String category, String hobby, GroundVO groundVO,String nowPage); //모임검색
	/**
	 *  모든 모임 리스트
	 * @return
	 */
	public ListVO<GroundVO>	getAllGroundList();
	/**
	 * 모임 참여하기
	 * @param groundNo
	 */
	public void participateGround(String groundNo);	// 모임 참여하기
	/**
	 * 모임장-모임 참여 대기 리스트 가져오기
	 * @param groundNo
	 * @return
	 */
	public List<MemberVO> getParticipationReadyList(String groundNo);	//모임장-모임 참여 대기 리스트 가져오기
	/**
	 * 모임장-모임참여 허가
	 * @param insiderVO
	 */
	public void approveParticipation(InsiderVO insiderVO); //모임장-모임참여 허가
	/**
	 * 모임장-모임참여 거절
	 * @param insiderVO
	 */
	public void rejectParticipation(InsiderVO insiderVO); //모임장-모임참여 거절
	/**
	 * 인싸-모임 공지 상세보기
	 * @param noticeNo
	 * @return
	 */
	public NoticeVO getNoticeDetailByNo(String noticeNo);	//인싸 - 모임 공지 상세보기
	/**
	 * 모든 모임공지 리스트
	 * @param groundNo
	 * @param nowPage
	 * @return
	 */
	public ListVO<NoticeVO> getAllGroundNoticeList(String groundNo,String nowPage);	
	/**
	 * 모임 해시태그 등록
	 * @param tags
	 * @param groundVO
	 */
	public void groundHashtag(String tags[],GroundVO groundVO);
	/**
	 * 모임 사진 등록
	 * @param groundVO
	 */
	public void registergroundImg(GroundVO groundVO);
	/**
	 * 모임번호로 모임찾기
	 * @param groundVO
	 * @return
	 */
	public GroundVO findGroundByGroundNo(GroundVO groundVO);
	/**
	 * 모임 일정 등록
	 * @param scheduleVO
	 * @param groundVO
	 * @param memberVO
	 */
	public void registergroundschedule(ScheduleVO scheduleVO,GroundVO groundVO,MemberVO memberVO);
	/**
	 * 모임 홈 멤버 정보
	 * @param id
	 * @return
	 */
	public MemberVO groundHomeMember(String id);
	/**
	 * 모임 홈 프로필 사진
	 * @param id
	 * @return
	 */
	public String groundHomeProfile(String id);
	/**
	 *  출석 정보 가져오기
	 * @param id
	 * @param groundNo
	 * @return
	 */
	public InsiderVO groundHomeInsider(String id,String groundNo);
	
	/**
	 * 모임 해시태그 가져오기
	 * @param groundVO
	 * @return
	 */
	public GroundVO groundHashtag2(GroundVO groundVO);
	/**
	 * 일정 참여
	 * @param scheduleNo
	 * @param memberVO
	 * @param groundVO
	 */
	public void scheduleParticipation(String scheduleNo,MemberVO memberVO,GroundVO groundVO);
	/**
	 * 모임 게시판 등록
	 * @param postVO
	 */
	public void registerGroundPost(PostVO postVO);
	/**
	 * 모임 게시판 리스트를 가져온다
	 * @param groundNo
	 * @param nowPage
	 * @return
	 */
	public ListVO<PostVO> getAllGroundPostList(String groundNo,String nowPage);
	/**
	 * 게시글번호로 게시글 찾기
	 * @param postNo
	 * @return
	 */
	public PostVO findPostByPostNo(String postNo);
	/**
	 * 모임 게시글 수정
	 * @param postVO
	 */
	public void updateGroundPost(PostVO postVO);
	/**
	 * 모임 게시글 삭제
	 * @param postVO
	 */
	public void deleteGroundPost(PostVO postVO);
	/**
	 * 모임 공지 등록
	 * @param noticeVO
	 */
	public void registerGroundNotice(NoticeVO noticeVO);
	
	/**
	 * 일정 번호로 모임 일정 찾기
	 * @param scheduleVO
	 * @return
	 */
	public ScheduleVO findGroundScheduleByScheduleNo(ScheduleVO scheduleVO);
	/**
	 * 모임 일정 페이징빈
	 * @param groundVO
	 * @param pageNo
	 * @return
	 */
	public ListVO<ScheduleVO> groundSchedulePagingBean(GroundVO groundVO,String pageNo);
	/**
	 * 일정에 참여한 멤버 목록
	 * @param groundVO
	 * @param scheduleNo
	 * @return
	 */
	public List<MemberVO> scheduleParticipationMember(GroundVO groundVO,String scheduleNo);
	/**
	 * 최신 공지 가져오기
	 * @param groundVO
	 * @return
	 */
	public NoticeVO newNotice(GroundVO groundVO);
	/**
	 * 최신 게시글
	 * @param groundNo
	 * @return
	 */
	public List<PostVO> newPost(String groundNo);
	/**
	 * 게시판에 올린 모든 사진 모음
	 * @param groundVO
	 * @return
	 */
	public List<PostVO> groundPicture(GroundVO groundVO);
	/**
	 *  일정 참여 했으면 1 안했으면 0 반환
	 * @param memberVO
	 * @param scheduleNo
	 * @return
	 */
	public int ParticipationBoolean(MemberVO memberVO,String scheduleNo);
	/**
	 * 출석+1
	 * @param groundNo
	 * @param id
	 * @param attendance
	 */
	public void addAttendance(String groundNo,String id,List<String> attendance);
	/**
	 * 멤버가 올린 게시글 수
	 * @param id
	 * @param groundNo
	 * @return
	 */
	public int groundMemberPostCount(String id,String groundNo);
	/**
	 * 멤버 출석 수
	 * @param id
	 * @param groundNo
	 * @return
	 */
	public int groundMemberAttendance(String id,String groundNo);
	/**
	 * 멤버 일정 등록 수
	 * @param id
	 * @param groundNo
	 * @return
	 */
	public int groundMemberScheduleCount(String id,String groundNo);
	/**
	 * 멤버 일정 참여 수
	 * @param id
	 * @param groundNo
	 * @return
	 */
	public int groundMemberParticipationCount(String id,String groundNo);
	/**
	 * 모임 탈퇴
	 * @param id
	 * @param groundNo
	 */
	public void withdrawGround(String id,String groundNo);
	/**
	 * 최신 일정
	 * @param groundNo
	 * @return
	 */
	public ScheduleVO newSchedule(String groundNo);
	/**
	 * 사진 이름 랜덤으로 부여
	 * @param originalName
	 * @return
	 */
	public String randomName(String originalName);
	/**
	 * 모임번호로 모임멤버리스트 찾기
	 * @param groundVO
	 * @return
	 */
	public List<InsiderVO> findGroundMemberListByGroundNo(GroundVO groundVO);
	/**
	 * 인기 있는 모임 리스트
	 * @return
	 */
	public List<GroundVO> getHotGroundList();

	
	



	
	
	
}
  