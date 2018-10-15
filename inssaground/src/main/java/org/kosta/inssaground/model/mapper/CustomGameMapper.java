package org.kosta.inssaground.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.inssaground.model.service.PagingBean;
import org.kosta.inssaground.model.vo.CustomGameVO;

@Mapper
public interface CustomGameMapper {
	public int getTotalCustomGameCount();
	public List<CustomGameVO> getCustomGameList(PagingBean pagingBean);
	public CustomGameVO getCustomGameDetail(String cGameNo);
}
