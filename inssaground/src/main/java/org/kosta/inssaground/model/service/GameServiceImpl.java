package org.kosta.inssaground.model.service;

import org.kosta.inssaground.model.vo.CustomGameVO;
import org.kosta.inssaground.model.vo.ListVO;
import org.kosta.inssaground.model.vo.OfficialGameVO;
import org.springframework.stereotype.Service;
@Service
public class GameServiceImpl implements GameService {

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
