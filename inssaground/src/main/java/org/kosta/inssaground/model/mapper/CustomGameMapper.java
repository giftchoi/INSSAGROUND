package org.kosta.inssaground.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.inssaground.model.service.PagingBean;
import org.kosta.inssaground.model.vo.CustomGameVO;

@Mapper
public interface CustomGameMapper {
	public int getTotalCustomGameCount();
	public List<CustomGameVO> getCustomGameList(PagingBean pagingBean);
	public CustomGameVO getCustomGameDetail(String cGameNo);
	public void writeCustomGame(CustomGameVO customGameVO);
	public void deleteCustomGame(String cGameNo);
	public void updateCustomGame(CustomGameVO customGameVO);
	public List<CustomGameVO> getCustomGameOrderByRecommendation();
	public void insertRecommendation(Map<String,String> map);
	public int selectRecommendataionByIdAndcGameNo(Map<String,String>map);
}

