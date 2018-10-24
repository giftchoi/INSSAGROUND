package org.kosta.inssaground.model.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.inssaground.model.vo.FeatureVO;
import org.kosta.inssaground.model.vo.HobbyCategoryVO;
import org.kosta.inssaground.model.vo.HobbyVO;

@Mapper
public interface HobbyMapper {

	List<HobbyVO> findHobbyByHobbyCategoryNo(String hobbyCategoryNO);

	List<HobbyCategoryVO> getHobbyCategory();

	HobbyVO findHobbyByHobbyNo(String hobbyNo);
	
	List<FeatureVO> getHobbyFeatureAndHobbyFeatureNoList();
	
	List<Map> getFList(HashMap ffList);
	
	List<Map> getFListNameByResultNo(HashMap list);
}
