package org.kosta.inssaground.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.inssaground.model.vo.CustomGameVO;

@Mapper
public interface CustomGameMapper {
	public int getTotalCustomGameCount();

	public CustomGameVO getCustomGameList();
}