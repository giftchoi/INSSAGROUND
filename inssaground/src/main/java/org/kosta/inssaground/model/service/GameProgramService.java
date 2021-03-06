package org.kosta.inssaground.model.service;

import java.util.List;

import org.kosta.inssaground.model.vo.GameProgramListVO;
import org.kosta.inssaground.model.vo.GameProgramVO;
import org.kosta.inssaground.model.vo.MemberVO;


public interface GameProgramService {
	/**
	 * 게임 프로그램 목록보기
	 * @param id
	 * @return
	 */
	public List<GameProgramVO> getAllGameProgram(String id);
	
	/**
	 * 게임 프로그램 등록
	 * @param title
	 * @param detail
	 * @param oGameNoArr
	 * @param mvo
	 * @return
	 */
	public String registerGameProgram(String title, String detail, String[] oGameNoArr, MemberVO mvo);
	
	/**
	 * 게임 프로그램 목록 보기(프로그램 번호, 프로그램 이름)
	 * @param mvo
	 * @return
	 */
	public  List<GameProgramVO> getGameProgramTitleList(MemberVO mvo);	 

	/**
	 * 게임 프로그램 상세보기
	 * @param gameProgramVO 게임프로그램 programNo, id 넣은거
	 * @return
	 */
	public  List<GameProgramListVO> getGameProgramDetailByProgramNo(GameProgramVO gameProgramVO);	 
	
	/**
	 * 게임 프로그램 수정하기 (삭제하고 만듦)
	 * @param title
	 * @param detail
	 * @param oGameNoArr
	 * @param mvo
	 * @param pno
	 */
	public  void updateGameProgram(String title, String detail, String[] oGameNoArr, MemberVO mvo, String pno);	 
	
	/**
	 * 게임 프로그램 삭제하기
	 * @param pno
	 * @param id
	 */
	public  void deleteGameProgram(String pno, String id);

	
	

}
