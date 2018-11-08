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
	@Transactional
	public String registerGameProgram(String title, String detail, String[] oGameNoArr, MemberVO mvo) {
		for(int i=0; i<oGameNoArr.length; i++) {
			System.out.print(oGameNoArr[i]+"-");
		}
		System.out.println("게임번호 확인완료");
		
		GameProgramVO gameProgramVO = new GameProgramVO(null, title, detail, mvo.getId(), null);
		gpm.createGameProgram(gameProgramVO);
		//System.out.println("게임프로그램 번호?"+gameProgramVO.getProgramNo());
		for(int i=0; i<oGameNoArr.length; i++) {
			ProgramOfficialGameVO programOfficialGameVO = new ProgramOfficialGameVO(gameProgramVO.getProgramNo(), oGameNoArr[i], i+1);
			gpm.addGameInGameProgram(programOfficialGameVO);
		}
		return gameProgramVO.getProgramNo();
	}
	@Override
	public List<GameProgramVO> getGameProgramTitleList(MemberVO memberVO) {
		return gpm.findGameProgramListById(memberVO.getId());
	}


	@Override
	public List<GameProgramListVO> getGameProgramDetailByProgramNo(GameProgramVO gameProgramVO) {
		return gpm.findGameListByIdAndProgramNo(gameProgramVO);
	}

	@Override
	@Transactional
	public void updateGameProgram(String title, String detail, String[] oGameNoArr, MemberVO mvo, String pno) {
		//프로그램 제목, 설명 변경
		Map<String, String> map = new HashMap<String, String>();
		map.put("PROGRAM_NO", pno);
		map.put("TITLE", title);
		map.put("DETAIL", detail);
		gpm.updateGameProgramTitleAndDetail(map);
		//프로그램 내의 게임 삭제
		gpm.deleteProgramOfficialGame(Integer.parseInt(pno));
		//새 게임목록들 등록
		for(int i=0; i<oGameNoArr.length; i++) {
			ProgramOfficialGameVO programOfficialGameVO = new ProgramOfficialGameVO(pno, oGameNoArr[i], i+1);
			gpm.addGameInGameProgram(programOfficialGameVO);
		}
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
