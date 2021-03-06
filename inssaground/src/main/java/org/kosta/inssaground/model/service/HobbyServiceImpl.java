package org.kosta.inssaground.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.inssaground.model.mapper.HobbyMapper;
import org.kosta.inssaground.model.vo.FeatureVO;
import org.kosta.inssaground.model.vo.HobbyCategoryVO;
import org.kosta.inssaground.model.vo.HobbyVO;
import org.springframework.beans.factory.annotation.Autowired;
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
	@Override
	public List<FeatureVO> getHobbyFeatureAndHobbyFeatureNoList(){
		return hobbyMapper.getHobbyFeatureAndHobbyFeatureNoList();
	}

	
	@Override
	public List<Map> getFList(String[] ffList){
		HashMap map = new HashMap();
		map.put("ffList",ffList);
		return hobbyMapper.getFList(map);
	}
	/*
	@Override
	public List<Map> getFList(String[] ffList){
		HashMap map = new HashMap();
		//map.put("ffList",ffList);
		String[] selectFFList = new String[3];
		for(int i=0; i<3; i++) {
			selectFFList[i] = ffList[i];
		}
		map.put("ffList",selectFFList);
		return hobbyMapper.getFList(map);
	}
	*/
	@Override
	public List<Map> getFListNameByResultNo(String[] hobbyNo) {
		HashMap map = new HashMap();
		//map.put("fnlist",hobbyNo);
		String[] selectFNList = new String[3];
	try {
		for(int i=0; i<3; i++) {
			selectFNList[i] = hobbyNo[i];
		}
	}catch(ArrayIndexOutOfBoundsException e){
		System.out.println("취미를 찾을수 없습니다");
			selectFNList=null;
			return null;
	}
		map.put("fnlist",selectFNList);
		System.out.println(map);
		return hobbyMapper.getFListNameByResultNo(map);
	
	}
}