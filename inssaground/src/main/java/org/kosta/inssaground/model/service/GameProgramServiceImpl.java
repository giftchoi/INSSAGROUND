package org.kosta.inssaground.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.inssaground.model.mapper.GameProgramMapper;
import org.kosta.inssaground.model.vo.GameProgramListVO;
import org.kosta.inssaground.model.vo.GameProgramVO;
import org.kosta.inssaground.model.vo.MemberVO;
import org.kosta.inssaground.model.vo.ProgramOfficialGameVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class GameProgramServiceImpl implements GameProgramService {
	@Resource
	private GameProgramMapper gpm;
	
	@Override
	public List<GameProgramVO> getAllGameProgram(String id){
		return gpm.getAllGameProgram(id);
	}
	
	@Override
	public void registerGameProgram(String title, String detail, String gameNoList, MemberVO mvo) {
		String[] gameNo = gameNoList.split("　");
		
		for(int i=0; i<gameNo.length; i++) {
			System.out.print(gameNo[i]+"-");
		}
		System.out.println("게임번호 확인완료");
		
		GameProgramVO gameProgramVO = new GameProgramVO(null, title, detail, mvo.getId(), null);
		gpm.createGameProgram(gameProgramVO);
		
		for(int i=0; i<gameNo.length; i++) {
			ProgramOfficialGameVO programOfficialGameVO = new ProgramOfficialGameVO(gameProgramVO.getProgramNo(), gameNo[i], i+1);
			gpm.addGameInGameProgram(programOfficialGameVO);
		}
	}
	@Override
	public List<GameProgramVO> getGameProgramList(MemberVO memberVO) {
		return gpm.findGameProgramListById(memberVO.getId());
	}


	@Override
	public List<GameProgramListVO> getGameProgramDetail(GameProgramVO gameProgramVO) {
		return gpm.findGameListByIdAndProgramNo(gameProgramVO);
	}

	@Override
	@Transactional
	public void updateGameProgram(String title, String detail, String gameNoList, MemberVO mvo, String pno) {
		deleteGameProgram(pno, mvo.getId() );
		registerGameProgram(title, detail, gameNoList, mvo);
	}

	@Override
	public void deleteGameProgram(String pno, String id) {
		gpm.deleteProgramOfficialGame(Integer.parseInt(pno));
		Map<String, String> map = new HashMap<String, String>();
		map.put("PROGRAM_NO", pno);
		map.put("ID", id);
		gpm.deleteGameProgram(map);
	}



}
