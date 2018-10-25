package org.kosta.inssaground.model.service;

import java.util.List;
import java.util.Map;

import org.kosta.inssaground.model.vo.FeatureVO;
import org.kosta.inssaground.model.vo.HobbyCategoryVO;
import org.kosta.inssaground.model.vo.HobbyVO;

public interface HobbyService {
	/**
	 * 취미 제공
	 * @param featureNo
	 * @return
	 */
	public List<HobbyVO> getOfferHobby(List<Integer> featureNo);
	/**
	 * 취미 카테고리 번호로 취미 찾기
	 * @param hobbyCategoryNO
	 * @return
	 */
	public List<HobbyVO> findHobbyByHobbyCategoryNo(String hobbyCategoryNO);
	/**
	 * 취미 카테고리 가져오기
	 * @return
	 */
	public List<HobbyCategoryVO> getHobbyCategory();
	/**
	 * 취미 특징 그리고 취미번호 리스를 가져옴
	 * @return
	 */
	List<FeatureVO> getHobbyFeatureAndHobbyFeatureNoList();
	/**
	 * 취미 번호를 가져온다
	 * @param ffList
	 * @return
	 */
	List<Map> getFList(String[] ffList);
	/**
	 * 취미번호로 취미이름을 가져온다
	 * @param hobbyNo
	 * @return
	 */
	List<Map> getFListNameByResultNo(String[] hobbyNo);
}
