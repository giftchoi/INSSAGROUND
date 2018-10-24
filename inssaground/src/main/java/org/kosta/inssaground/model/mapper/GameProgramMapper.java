package org.kosta.inssaground.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.inssaground.model.vo.GameProgramListVO;
import org.kosta.inssaground.model.vo.GameProgramVO;
import org.kosta.inssaground.model.vo.ProgramOfficialGameVO;

@Mapper
public interface GameProgramMapper {
	public List<GameProgramVO> getAllGameProgram(String id);
	public void createGameProgram(GameProgramVO gameProgramVO);
	public void addGameInGameProgram(ProgramOfficialGameVO programOfficialGameVO);
	public List<GameProgramVO> findGameProgramListById(String id);
	public List<GameProgramListVO> findGameListByIdAndProgramNo(GameProgramVO gameProgramVO);
	public void deleteProgramOfficialGame(int pno);
	public void deleteGameProgram(Map<String, String> map);
}
