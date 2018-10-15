package org.kosta.inssaground.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.inssaground.model.mapper.HobbyMapper;
import org.kosta.inssaground.model.vo.HobbyCategoryVO;
import org.kosta.inssaground.model.vo.HobbyVO;
import org.springframework.stereotype.Service;
@Service
public class HobbyServiceImpl implements HobbyService {
	@Resource
	private HobbyMapper hobbyMapper;

	@Override
	public List<HobbyVO> getOfferHobby(List<Integer> featureNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<HobbyVO> findHobbyByHobbyCategoryNo(String hobbyCategoryNO) {		
		return hobbyMapper.findHobbyByHobbyCategoryNo(hobbyCategoryNO);
	}

	@Override
	public List<HobbyCategoryVO> getHobbyCategory() {		
		return hobbyMapper.getHobbyCategory();
	}


}
