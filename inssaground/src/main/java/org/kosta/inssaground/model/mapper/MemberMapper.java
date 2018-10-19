package org.kosta.inssaground.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.inssaground.model.vo.EmailKeyVO;
import org.kosta.inssaground.model.vo.MemberVO;
import org.kosta.inssaground.model.vo.ReportVO;

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

	List<Map<String,String>> myGroundNoList(String id);
	
	void registerProfile(MemberVO mvo);

	String getProfileIMGName(String id);

	void deleteProfileIMG(String id);

	void revokeRole(String id);

	void changeMemberStatus(String id);

	void updateMember(MemberVO vo);

	void reportGround(ReportVO reportVO);

}
