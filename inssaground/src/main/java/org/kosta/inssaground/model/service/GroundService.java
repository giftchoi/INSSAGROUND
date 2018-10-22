package org.kosta.inssaground.model.service;

import java.util.List;
import java.util.Map;

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
	public void applyGround(GroundVO groundVO,SidoVO sidoVO,SigunguVO sigunguVO,HobbyVO hobbyVO,HobbyCategoryVO hobbyCategoryVO); // 모임신청
	public List<SidoVO> getAllSido();// 모든 시도
	public GroundVO enterGround(String groundNo); // 모임 홈
	public GroundVO groundDetail(GroundVO groundVO); // 모임 상세보기
	public void groundParticipation(); // 모임참여
	public ListVO<PostVO> groundBoard(GroundVO groundVO); // 모임 게시판
	public void registerGroundSchedule(ScheduleVO scheduleVO); //모임 일정 등록
	public void deleteGroundSchedule(ScheduleVO scheduleVO); // 모임 일정 삭제
	public void groundParticipantPermission(GroundVO groundVO);//	 모임 참여 허가
	//public void masterGroundManagement(GroundVO groundVO);// 모임장 모임 관리
	public InsiderVO groundParticipantList(GroundVO GroundVO);// 모임 참여 리스트
	public MemberVO groundParticipantMemberInfo(GroundVO groundVO);// 모임 참여한 회원 정보 
	public void registerinsider(InsiderVO insiderVO);// 모임 회원 등록
	public void updateGroundNotice(NoticeVO noticeVO); // 모임 공지 수정
	public void deleteGroundNotice(String noticeNo);// 모임 공지 삭제
	public NoticeVO groundNoticeDetail(String noticeNo);// 모임 공지 상세
	public void updateGroundSchedule(ScheduleVO scheduleVO);// 모임 일정 수정
	public void groundScheduleParticipation(GroundVO groundVO);// 모임 일정 참여
	public void registerGroundMember(GroundVO groundVO);// 모임 멤버 등록
	public PostVO GroundImg(GroundVO groundVO);// 모임 사진 모음
	public GroundVO GroundActivityInfo(GroundVO groundVO);// 모임 활동 정보  **********************
	public ScheduleVO groundScheduleDetail(ScheduleVO scheduleVO);// 모임 일정 상세	
	
	/*SOJEONG*/
	public List<SigunguVO> getSigungu(String sido);	
	public int getGroundSearchResultCount(Map<String,Object> map);
	public ListVO<GroundVO> searchGround(String sido, String sigungu, String category, String hobby, GroundVO groundVO,String nowPage); //모임검색
	public ListVO<GroundVO>	getAllGroundList();
	public void participateGround(String groundNo);	// 모임 참여하기
	public List<MemberVO> getParticipationReadyList(String groundNo);	//모임장-모임 참여 대기 리스트 가져오기
	public void approveParticipation(InsiderVO insiderVO); //모임장-모임참여 허가
	public void registerGroundNotice(NoticeVO noticeVO);//모임 공지 등록
	public NoticeVO getNoticeDetailByNo(String noticeNo);	//인싸 - 모임 공지 상세보기
	public ListVO<NoticeVO> getAllGroundNoticeList(String groundNo,String nowPage);	
	public void groundHashtag(String tags[],GroundVO groundVO);
	public void registergroundImg(GroundVO groundVO);
	public GroundVO findGroundByGroundNo(GroundVO groundVO);
	public void registergroundschedule(ScheduleVO scheduleVO);
	public MemberVO groundHomeMember(String id);
	public String groundHomeProfile(String id);
	public InsiderVO groundHomeInsider(String id,String groundNo);
	public GroundVO groundHashtag2(GroundVO groundVO);
	public void scheduleParticipation(String scheduleNo,MemberVO memberVO,GroundVO groundVO);

	public ScheduleVO findGroundScheduleByScheduleNo(ScheduleVO scheduleVO);
	public ListVO<ScheduleVO> groundSchedulePagingBean(GroundVO groundVO,String pageNo);
	public List<MemberVO> scheduleParticipationMember(GroundVO groundVO,String scheduleNo);
	public NoticeVO newNotice(GroundVO groundVO);
	public List<PostVO> newPost(String groundNo);
	public List<PostVO> groundPicture(GroundVO groundVO);

	public List<InsiderVO> findGroundMemberListByGroundNo(GroundVO groundVO);
	public void registerGroundPost(PostVO postVO);
	
	
	



	
	
	
}
  