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
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MailSenderService mailService;
	@Resource
	private MemberMapper memberMapper;
	@Override
	public boolean checkEmailKey(String id, String emailKey) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void registerMember(MemberVO mvo, String path) {
		// TODO Auto-generated method stub

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
		System.out.println(randomKey);
		System.out.println(key);
		EmailVO email=new EmailVO(receiver,"INSSAGROUND 회원가입 인증번호 입니다.","인증번호 : ["+randomKey+"]");
		//mailService.sendEmail(email);
	}

}
