package org.kosta.inssaground.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.inssaground.model.service.PagingBean;
import org.kosta.inssaground.model.vo.GroundHashtagVO;
import org.kosta.inssaground.model.vo.GroundVO;
import org.kosta.inssaground.model.vo.InsiderVO;
import org.kosta.inssaground.model.vo.MemberVO;
import org.kosta.inssaground.model.vo.ScheduleVO;
import org.kosta.inssaground.model.vo.SidoVO;
import org.kosta.inssaground.model.vo.SigunguVO;

@Mapper
public interface GroundMapper {
	/*SOJEONG*/
	List<GroundVO> searchGroundTest(Map<String,Object> map);
	List<GroundVO> searchGround(Map<String,Object> map);
	List<GroundVO> getAllGroundList(PagingBean pagingBean);
	GroundVO groundDetail(GroundVO groundVO);
	int getGroundSearchResultCount(Map<String,Object> map);
	
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

	void registergroundschedule(ScheduleVO scheduleVO);

	void participateGround(Map<String,String> map);
	List<MemberVO> getParticipationReadyList(String groundNo);
	void approveParticipation(InsiderVO insiderVO);

}
