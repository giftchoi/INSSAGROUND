package org.kosta.inssaground.model.service;

import java.util.List;

import org.kosta.inssaground.model.vo.HobbyVO;

public interface HobbyService {
	public List<HobbyVO> getOfferHobby(List<Integer> featureNo);
	public List<HobbyVO> getAllHobby();
}
