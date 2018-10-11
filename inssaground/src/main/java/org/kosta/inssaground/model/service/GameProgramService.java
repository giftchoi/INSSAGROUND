package org.kosta.inssaground.model.service;

import java.util.List;

import org.kosta.inssaground.model.vo.ListVO;
import org.kosta.inssaground.model.vo.OfficialGameVO;

public interface GameProgramService {
	/**
	 * 게임 프로그램 등록
	 * @param gameList
	 */
	public  void registerGameProgram(List<OfficialGameVO> gameList);	 
	/**
	 * 게임 프로그램 목록 보기(1페이지)
	 * @return
	 */
	public  ListVO<OfficialGameVO> getGameProgramList();	 
	/**
	 * 게임 프로그램 목록 보기(pageNo페이지)
	 * @param pageNo
	 * @return
	 */
	public  ListVO<OfficialGameVO> getGameProgramList(String pageNo);	 
	/**
	 * 게임 프로그램 상세보기
	 * @param pno
	 * @return
	 */
	public  List<OfficialGameVO> getGameProgramDetail(String pno);	 
	/**
	 * 게임 프로그램 수정하기
	 * @param gameList
	 * @return
	 */
	public  void updateGameProgram(List<OfficialGameVO> gameList);	 
	/**
	 * 게임 프로그램 삭제하기
	 * @param pno
	 */
	public  void deleteGameProgram(String pno);

}
