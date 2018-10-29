package org.kosta.inssaground.model.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.inssaground.model.mapper.CustomGameMapper;
import org.kosta.inssaground.model.mapper.MemberMapper;
import org.kosta.inssaground.model.mapper.OfficialGameMapper;
import org.kosta.inssaground.model.vo.CustomGameVO;
import org.kosta.inssaground.model.vo.ListVO;
import org.kosta.inssaground.model.vo.OfficialGameVO;
import org.springframework.stereotype.Service;
@Service
public class GameServiceImpl implements GameService {
	@Resource
	private OfficialGameMapper ogm;
	@Resource
	private CustomGameMapper cgm;
	@Resource
	private MemberMapper mbm;
	
	@Override
	public void writeGame(OfficialGameVO officialGameVO) {
		ogm.writeOfficialGame(officialGameVO);
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
		return ogm.getOfficialGameDetail(oGameNo);
	}

	@Override
	public void updateGame(OfficialGameVO officialGameVO) {
		ogm.updateOfficialGame(officialGameVO);
	}

	@Override
	public void deleteOfficialGame(String oGameNo) {
		ogm.deleteOfficialGame(oGameNo);
	}

	@Override
	public void writeGame(CustomGameVO customGameVO) {
		cgm.writeCustomGame(customGameVO);
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
		
		cgm.updateCustomGame(customGameVO);
	}

	@Override
	public void deleteCustomGame(String cGameNo) {
	
		cgm.deleteCustomGame(cGameNo);
	}

	@Override
	public List<CustomGameVO> getCustomGameOrderByRecommendation() {
		return cgm.getCustomGameOrderByRecommendation();
	}
	@Override
	public int insertRecommendation(Map<String,String> map) {
		int count=cgm.selectRecommendataionByIdAndcGameNo(map);
		if(count==0) {
			cgm.insertRecommendation(map);
		}else {
		System.out.println("중복된 값입니다.");	
		}
		return count;
	}
	@Override
	public int selectCountIdBycGameNo(String cGameNo) {
		int count=cgm.selectCountIdBycGameNo(cGameNo);
		return count;
	}
}

