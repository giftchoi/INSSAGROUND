package org.kosta.inssaground.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.inssaground.model.vo.GroundHashtagVO;
import org.kosta.inssaground.model.vo.GroundVO;
import org.kosta.inssaground.model.vo.SidoVO;
import org.kosta.inssaground.model.vo.SigunguVO;

@Mapper
public interface GroundMapper {
	/*SOJEONG*/
	List<GroundVO> searchGroundTest(Map<String,Object> map);
	List<GroundVO> searchGround(Map<String,Object> map);
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
}
