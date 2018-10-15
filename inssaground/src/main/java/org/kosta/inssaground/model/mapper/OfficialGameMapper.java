package org.kosta.inssaground.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.inssaground.model.service.PagingBean;
import org.kosta.inssaground.model.vo.OfficialGameVO;

@Mapper
public interface OfficialGameMapper {
	public int getTotalOfficialGameCount();

	public List<OfficialGameVO> getOfficialGameList(PagingBean pagingBean);
	
	public OfficialGameVO getOfficialGameDetail(int oGameNo);
}
