package org.kosta.inssaground.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.inssaground.model.service.PagingBean;
import org.kosta.inssaground.model.vo.GroundHashtagVO;
import org.kosta.inssaground.model.vo.GroundVO;
import org.kosta.inssaground.model.vo.InsiderVO;
import org.kosta.inssaground.model.vo.MemberVO;
import org.kosta.inssaground.model.vo.NoticeVO;
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
	void registerGroundNotice(NoticeVO noticeVO);
	int getGroundNoticeCount(String groundNo);	//공지 갯수 
	NoticeVO getNoticeDetailByNo(String noticeNo); //공지 상세 정보 

	
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


	
	/*JISUN*/
	int getTotalApplyGroundList();
	List<GroundVO> getApplyGroundList(PagingBean pagingBean);
	List<String> getHashtagList(String groundNo);
	void permitGround(String groundNo);
	void rejectGround(String groundNo);
	void insertInsider(Map<String,String> map);
	void deleteGroundNotice(String noticeNo);




}
