package org.kosta.inssaground.model.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.inssaground.model.service.PagingBean;
import org.kosta.inssaground.model.vo.GroundHashtagVO;
import org.kosta.inssaground.model.vo.GroundVO;
import org.kosta.inssaground.model.vo.InsiderVO;
import org.kosta.inssaground.model.vo.MemberVO;
import org.kosta.inssaground.model.vo.NoticeVO;
import org.kosta.inssaground.model.vo.PostVO;
import org.kosta.inssaground.model.vo.ScheduleVO;
import org.kosta.inssaground.model.vo.SidoVO;
import org.kosta.inssaground.model.vo.SigunguVO;

@Mapper
public interface GroundMapper {
	/*SOJEONG*/
	List<GroundVO> searchGround(Map<String,Object> map);
	List<GroundVO> getAllGroundList(PagingBean pagingBean);
	GroundVO groundDetail(GroundVO groundVO);
	int getGroundSearchResultCount(Map<String,Object> map);

	void participateGround(Map<String,String> map);
	List<MemberVO> getParticipationReadyList(String groundNo);
	void approveParticipation(InsiderVO insiderVO);
	void registerGroundNotice(NoticeVO noticeVO);// 공지 등록
	int getGroundNoticeCount(String groundNo);	//공지 갯수 
	NoticeVO getNoticeDetailByNo(String noticeNo); //공지 상세 정보 
	void deleteGroundNotice(String noticeNo);	//공지 삭제
	void updateGroundNotice(NoticeVO noticeVO);	//공지 수정
	
	void insertPostImg(Map<String,String> map);
	void insertGroundPost(PostVO postVO);
	int getTotalGroundPostCount(String groundNo);
	List<PostVO> getAllGroundPostList(Map<String,Object> map);
	PostVO findPostByPostNo(String postNo);	//게시글 상세
	List<String> getPicListByPostNo(String postNo);// 게시글 이미지리스트 가져오기
	void updateGroundPost(PostVO postVO);	// 게시글 수정
	void deleteAllPostImg(String postNo);	// 게시물 사진 업데이트를 위해 기존 리스트 삭제
	void deletePostByPostNo(String postNo);
	void updatePostHits(String postNo);	//게시물 조회수 증가
	
	
	/*DOHYEONG*/
	List<SidoVO> getAllSido();
	List<SigunguVO> getSigungu(String sidoNo);
	SidoVO findSidoBySidoNo(String sidoNo);
	SigunguVO findSigunguBySigunguNo(String sigunguNo);
	void groundApply(GroundVO groundVO);
	void registerTag(String tags);
	void groundHashtag(GroundHashtagVO groundHashtagVO);
	int hashtagBoolean(String tags);
	void registergroundImg(GroundVO groundVO);
	GroundVO findGroundByGroundNo(String groundNo);
	List<ScheduleVO> grouondScheduleList(Map<String,Object> map);
	ScheduleVO findGroundScheduleByScheduleNo(ScheduleVO scheduleVO);
	void registergroundschedule(ScheduleVO scheduleVO);
	List<NoticeVO> getAllGroundNoticeList(Map<String, Object> map);
	void deleteGroundSchedule(ScheduleVO scheduleVO);
	void updateGroundSchedule(ScheduleVO scheduleVO);
	List<InsiderVO> findGroundMemberListByGroundNo(GroundVO groundVO);
	int groundScheduleTotalCount(GroundVO groundVO);
	
	MemberVO groundHomeMember(String id);
	String groundHomeProfile(String id);
	InsiderVO groundHomeInsider(InsiderVO insiderVO);
	void scheduleParticipation(Map<String,Object> map);
	List<MemberVO> scheduleParticipationMember(Map<String,Object> map);
	NoticeVO newNotice(GroundVO groundVO);
	List<PostVO> newPost(String groundNo);
	List<PostVO> groundPicture(GroundVO groundVO);
	int ParticipationBoolean(Map<String,Object> map);
	int scheduleCurrPersonnel(String scheduleNo);
	void addAttendance(Map<String,Object> map);

	int groundMemberPostCount(Map<String,String> map);
	int groundMemberAttendance(Map<String,String> map);
	int groundMemberScheduleCount(Map<String,String> map);
	int groundMemberParticipationCount(Map<String,String> map);
	void withdrawGround(Map<String,String> map);
	void withdrawinsider(String id);
	ScheduleVO newSchedule(String groundNo);


	/*JISUN*/
	int getTotalApplyGroundList();
	List<GroundVO> getApplyGroundList(PagingBean pagingBean);
	List<String> getHashtagList(String groundNo);
	void permitGround(String groundNo);
	void rejectGround(String groundNo);
	void insertInsider(Map<String,String> map);
	int getTotalmyScheduleList(String id);
	List<ScheduleVO> getScheduleList(Map<String,Object> map);

}
