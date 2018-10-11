package org.kosta.inssaground.model.service;

import java.util.List;

import org.kosta.inssaground.model.vo.ListVO;
import org.kosta.inssaground.model.vo.OfficialGameVO;
import org.springframework.stereotype.Service;

@Service
public class GameProgramServiceImpl implements GameProgramService {

	@Override
	public void registerGameProgram(List<OfficialGameVO> gameList) {
		// TODO Auto-generated method stub

	}

	@Override
	public ListVO<OfficialGameVO> getGameProgramList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ListVO<OfficialGameVO> getGameProgramList(String pageNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OfficialGameVO> getGameProgramDetail(String pno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateGameProgram(List<OfficialGameVO> gameList) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteGameProgram(String pno) {
		// TODO Auto-generated method stub

	}

}
