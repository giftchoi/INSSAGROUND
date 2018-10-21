package org.kosta.inssaground.model.service;

import java.util.List;

import org.kosta.inssaground.model.vo.CustomGameVO;
import org.kosta.inssaground.model.vo.ListVO;
import org.kosta.inssaground.model.vo.OfficialGameVO;
import org.springframework.stereotype.Service;
@Service
public interface GameService {
	
	//공식 게임
	
	/**
	 * 공식 게임 쓰기
	 * @param officialGameVO
	 */
	public  void writeGame(OfficialGameVO officialGameVO);
	/**
	 * 공식 게임 목록보기 (1페이지)
	 * @return
	 */
	public  ListVO<OfficialGameVO> getOfficialGameList();
	/**
	 * 공식 게임 목록보기 (pageNo페이지)
	 * @param pageNo
	 * @return
	 */
	public  ListVO<OfficialGameVO> getOfficialGameList(String pageNo);
	/**
	 * 공식 게임 상세보기
	 * @param oGameNo
	 * @return
	 */
	public  OfficialGameVO getOfficialGameDetail(String oGameNo);
	/**
	 * 공식 게임 수정
	 * @param officialGameVO
	 * @return
	 */
	public  void updateGame(OfficialGameVO officialGameVO);
	/**
	 * 공식 게임 삭제
	 * @param oGameNo
	 */
	public  void deleteOfficialGame(String oGameNo);
	
	//사용자 정의 게임 
	
	/**
	 * 사용자 정의 게임 쓰기
	 * @param customGameVO
	 */
	public  void writeGame(CustomGameVO customGameVO);
	/**
	 * 사용자 정의 게임 목록보기 (1번 페이지)
	 * @return
	 */
	public  ListVO<CustomGameVO> getCustomGameList();
	/**
	 * 사용자 정의 게임 목록보기 (pageNo번째 페이지)
	 * @param pageNo
	 * @return
	 */
	public  ListVO<CustomGameVO> getCustomGameList(String pageNo);
	/**
	 * 사용자 정의 게임 상세보기
	 * @param cGameNo
	 * @return
	 */
	public  CustomGameVO getCustomGameDetail(String cGameNo);
	/**
	 * 사용자 정의 게임 수정
	 * @param customGameVO
	 * @return
	 */
	public  void updateGame(CustomGameVO customGameVO);
	/**
	 * 사용자 정의 게임 삭제
	 * @param cGameNo
	 */
	public  void deleteCustomGame(String cGameNo);
	/**
	 * 추천수 별로 게임 가져오기
	 * @return 
	 */
	List<CustomGameVO> getCustomGameOrderByRecommendation();

}
