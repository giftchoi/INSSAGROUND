package org.kosta.inssaground.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.inssaground.model.vo.HobbyVO;

@Mapper
public interface HobbyMapper {

	List<HobbyVO> getAllHobby();
}
