package org.kosta.inssaground.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.inssaground.model.vo.EmailKeyVO;
import org.kosta.inssaground.model.vo.GroundVO;
import org.kosta.inssaground.model.vo.ListVO;
import org.kosta.inssaground.model.vo.MemberVO;

@Mapper
public interface MemberMapper {

	MemberVO findMemberById(String id);

	List<String> getAuthorityById(String id);

	int idcheck(String id);

	void insertEmailInfo(EmailKeyVO key);
	
	int emailcheck(String email);

	void updateEmailKey(EmailKeyVO key);

	EmailKeyVO getEmailKeyInfo(String email);

	void registerMember(MemberVO mvo);

	void registerPermission(String id);

	List<String> findMemberId(MemberVO vo);

	void updateTempPassword(MemberVO vo);

	void registerProfile(MemberVO mvo);

	List<String> myGroundNoList(String id);

}
