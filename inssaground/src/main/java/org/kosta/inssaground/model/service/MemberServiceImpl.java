package org.kosta.inssaground.model.service;

import java.util.List;
import java.util.Random;
import java.util.TreeSet;

import javax.annotation.Resource;

import org.kosta.inssaground.model.mapper.MemberMapper;
import org.kosta.inssaground.model.vo.EmailKeyVO;
import org.kosta.inssaground.model.vo.EmailVO;
import org.kosta.inssaground.model.vo.GroundVO;
import org.kosta.inssaground.model.vo.ListVO;
import org.kosta.inssaground.model.vo.MemberVO;
import org.kosta.inssaground.model.vo.ScheduleVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MailSenderService mailService;
	@Resource
	private MemberMapper memberMapper;
	@Override
	public String checkEmailKey(String email, String emailKey) {
		if(memberMapper.emailcheck(email)!=0) {
			EmailKeyVO vo = memberMapper.getEmailKeyInfo(email);
			if(emailKey.equals(vo.getEmailKey())){
				return "true";
			}
		}return "fail";
	}
	@Transactional
	@Override
	public void registerMember(MemberVO mvo) {
		memberMapper.registerMember(mvo);
		memberMapper.registerPermission(mvo.getId());
	}

	@Override
	public void login(MemberVO mvo) {
		// TODO Auto-generated method stub

	}

	@Override
	public MemberVO findMemberById(String id) {
		return memberMapper.findMemberById(id);
	}

	@Override
	public void updateMember(MemberVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void withdrawMember(MemberVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public ListVO<GroundVO> myGroundList(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ListVO<ScheduleVO> myScheduleList(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> selectAuthorityById(String id) {
		return memberMapper.getAuthorityById(id);
	}

	@Override
	public String idcheck(String id) {
			int count = memberMapper.idcheck(id);
			return (count == 0) ? "ok" : "fail";
	}
	
	@Override
	public void sendEmailForRegister(String receiver) {
		String randomKey="";
		Random r=new Random();
		for(int i=0;i<8;i++) {
			randomKey += r.nextInt(9);
		};
		EmailKeyVO key = new EmailKeyVO(receiver,randomKey);
		if(memberMapper.emailcheck(receiver)==0) {
			memberMapper.insertEmailInfo(key);
		}else {
			memberMapper.updateEmailKey(key);
		}
		EmailVO email=new EmailVO(receiver,"INSSAGROUND 회원가입 인증번호 입니다.","인증번호 : ["+randomKey+"]");
		mailService.sendEmail(email);
	}
	@Override
	public List<String> findMemberId(MemberVO vo) {
		List<String> idList=memberMapper.findMemberId(vo);
		for(int i=0;i<idList.size();i++) {
			int idLength = idList.get(i).length();
			String starId = idList.get(i).substring(0, 3);
			for(int j=0;j<idLength-3;j++) {
				starId += "*";
			}
			idList.remove(i);
			idList.add(starId);
		}
		return idList; 
	}
	@Transactional
	@Override
	public void findPassword(String id) throws Exception {
		MemberVO vo=findMemberById(id);
		if(vo==null) throw new Exception("없는 아이디 입니다.");
		String randomNum="";
		Random r=new Random();
		for(int i=0;i<8;i++) {
			randomNum += r.nextInt(9);
		};
		vo.setPassword(randomNum);
		memberMapper.updateTempPassword(vo);
		EmailVO email=new EmailVO(vo.getEmail(),"INSSAGROUND 임시 비밀번호입니다.","임시 비밀번호 : ["+randomNum+"]\n새 비밀번호로 변경 바랍니다.");
		mailService.sendEmail(email);
	}
	@Override
	public List<String> myGroundNoList(String id) {
		// TODO Auto-generated method stub
		return memberMapper.myGroundNoList(id);
	}
}
