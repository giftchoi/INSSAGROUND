package org.kosta.inssaground.model.service;

import javax.annotation.Resource;

import org.kosta.inssaground.model.mapper.CustomGameMapper;
import org.kosta.inssaground.model.mapper.MemberMapper;
import org.kosta.inssaground.model.vo.CustomGameVO;
import org.kosta.inssaground.model.vo.ListVO;
import org.kosta.inssaground.model.vo.OfficialGameVO;
import org.springframework.stereotype.Service;
@Service
public class GameServiceImpl implements GameService {
	@Resource
	private CustomGameMapper cgm;
	@Resource
	private MemberMapper mbm;
	
	@Override
	public void writeGame(OfficialGameVO officialGameVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public ListVO<OfficialGameVO> getOfficialGameList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ListVO<OfficialGameVO> getOfficialGameList(String pageNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OfficialGameVO getOfficialGameDetail(String oGameNo) {
		// TODO Auto-generated method stub
		return null;
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
		
		return getCustomGameList("1");
	}

	@Override
	public ListVO<CustomGameVO> getCustomGameList(String pageNo) {
		int totalCount=cgm.getTotalCustomGameCount();
		PagingBean pagingBean=null;
		if(pageNo==null) {
			pagingBean=new PagingBean(totalCount);
		}else {
			pagingBean=new PagingBean(totalCount,Integer.parseInt(pageNo));
		}
		return new ListVO<CustomGameVO>(pagingBean,cgm.getCustomGameList(pagingBean));
	}

	@Override
	public CustomGameVO getCustomGameDetail(String cGameNo) {
		
		return cgm.getCustomGameDetail(cGameNo);
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
