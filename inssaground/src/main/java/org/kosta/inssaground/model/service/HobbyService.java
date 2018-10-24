package org.kosta.inssaground.model.service;

import java.util.List;
import java.util.Map;

import org.kosta.inssaground.model.vo.FeatureVO;
import org.kosta.inssaground.model.vo.HobbyCategoryVO;
import org.kosta.inssaground.model.vo.HobbyVO;

public interface HobbyService {
	public List<HobbyVO> getOfferHobby(List<Integer> featureNo);
	public List<HobbyVO> findHobbyByHobbyCategoryNo(String hobbyCategoryNO);
	public List<HobbyCategoryVO> getHobbyCategory();
	List<FeatureVO> getHobbyFeatureAndHobbyFeatureNoList();
	List<Map> getFList(String[] ffList);
	List<Map> getFListNameByResultNo(String[] hobbyNo);
}
