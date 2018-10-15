package org.kosta.inssaground.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.inssaground.model.vo.GroundVO;
import org.kosta.inssaground.model.vo.ListVO;
import org.kosta.inssaground.model.vo.SidoVO;
import org.kosta.inssaground.model.vo.SigunguVO;

@Mapper
public interface GroundMapper {
	List<GroundVO> searchGroundTest(GroundVO groundVO);
	ListVO<GroundVO> searchGround(GroundVO groundVO);
	List<SidoVO> getAllSido();
	List<SigunguVO> getSigungu();
}
