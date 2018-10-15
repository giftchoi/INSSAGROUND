package org.kosta.inssaground.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.inssaground.model.vo.GroundVO;
import org.kosta.inssaground.model.vo.ListVO;

@Mapper
public interface GroundMapper {
	List<GroundVO> searchGroundTest(GroundVO groundVO);
	ListVO<GroundVO> searchGround(GroundVO groundVO);
	GroundVO groundDetail(GroundVO groundVO);
}
