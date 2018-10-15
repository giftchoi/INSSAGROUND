package org.kosta.inssaground.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.inssaground.model.vo.MemberVO;

@Mapper
public interface MemberMapper {

	MemberVO findMemberById(String id);

	List<String> getAuthorityById(String id);

	int idcheck(String id);

}
