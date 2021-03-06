package org.kosta.inssaground.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.inssaground.model.service.PagingBean;
import org.kosta.inssaground.model.vo.OfficialGameVO;

@Mapper
public interface OfficialGameMapper {
	public int getTotalOfficialGameCount();
	public int getTotalOfficialGameCountBySmall();
	public int getTotalOfficialGameCountByLarge();
	public int getTotalOfficialGameCountByInside();
	public int getTotalOfficialGameCountByOutside();
	
	public List<OfficialGameVO> getOfficialGameList(PagingBean pagingBean);
	public List<OfficialGameVO> getOfficialGameListBySmall(PagingBean pagingBean);
	public List<OfficialGameVO> getOfficialGameListByLarge(PagingBean pagingBean);
	public List<OfficialGameVO> getOfficialGameListByInside(PagingBean pagingBean);
	public List<OfficialGameVO> getOfficialGameListByOutside(PagingBean pagingBean);
	
	public OfficialGameVO getOfficialGameDetail(String oGameNo);

	public void writeOfficialGame(OfficialGameVO OfficialGameVO);

	public void updateOfficialGame(OfficialGameVO officialGameVO);

	public void deleteOfficialGame(String oGameNo);

}
