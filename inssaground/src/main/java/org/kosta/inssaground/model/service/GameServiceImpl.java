package org.kosta.inssaground.model.service;

import javax.annotation.Resource;

import org.kosta.inssaground.model.mapper.OfficialGameMapper;
import org.kosta.inssaground.model.vo.CustomGameVO;
import org.kosta.inssaground.model.vo.ListVO;
import org.kosta.inssaground.model.vo.OfficialGameVO;
import org.springframework.stereotype.Service;
@Service
public class GameServiceImpl implements GameService {
	@Resource
	private OfficialGameMapper ogm;

	@Override
	public void writeGame(OfficialGameVO officialGameVO) {
		
	}

	@Override
	public ListVO<OfficialGameVO> getOfficialGameList() {
		return getOfficialGameList("1");
	}

	@Override
	public ListVO<OfficialGameVO> getOfficialGameList(String pageNo) {
		int totalCount = ogm.getTotalOfficialGameCount();
		PagingBean pagingBean=null;
		if(pageNo==null)
			pagingBean=new PagingBean(totalCount);
		else
			pagingBean=new PagingBean(totalCount,Integer.parseInt(pageNo));	
		return new ListVO<OfficialGameVO>(pagingBean, ogm.getOfficialGameList(pagingBean));
	}

	@Override
	public OfficialGameVO getOfficialGameDetail(String oGameNo) {
		return ogm.getOfficialGameDetail(Integer.parseInt(oGameNo));
	}

	@Override
	public void updateGame(OfficialGameVO officialGameVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteOfficialGame(int oGameNo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void writeGame(CustomGameVO customGameVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public ListVO<CustomGameVO> getCustomGameList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ListVO<CustomGameVO> getCustomGameList(String pageNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CustomGameVO getCustomGameDetail(String cGameNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateGame(CustomGameVO customGameVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteCustomGame(int cGameNo) {
		// TODO Auto-generated method stub

	}

}
