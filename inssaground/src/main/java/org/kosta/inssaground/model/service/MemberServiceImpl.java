package org.kosta.inssaground.model.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;

import org.kosta.inssaground.model.mapper.GroundMapper;
import org.kosta.inssaground.model.mapper.HobbyMapper;
import org.kosta.inssaground.model.mapper.MemberMapper;
import org.kosta.inssaground.model.vo.EmailKeyVO;
import org.kosta.inssaground.model.vo.EmailVO;
import org.kosta.inssaground.model.vo.GroundVO;
import org.kosta.inssaground.model.vo.HobbyVO;
import org.kosta.inssaground.model.vo.ListVO;
import org.kosta.inssaground.model.vo.MemberVO;
import org.kosta.inssaground.model.vo.ReportVO;
import org.kosta.inssaground.model.vo.ScheduleVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MailSenderService mailService;
	@Resource
	private MemberMapper memberMapper;
	@Autowired
	private FileUploadService fileUploader;
	@Autowired
	private GroundMapper groundMapper;
	@Autowired
	private HobbyMapper hobbyMapper;
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
	public void registerMember(MemberVO mvo,MultipartFile picture) throws IllegalStateException, IOException {
		memberMapper.registerMember(mvo);
		memberMapper.registerPermission(mvo.getId());
		mvo.setProfile(fileUploader.fileUpload(picture));
		memberMapper.registerProfile(mvo);
	}

	@Override
	public MemberVO findMemberById(String id) {
		return memberMapper.findMemberById(id);
	}

	@Override
	public void updateMember(MemberVO vo) {
		memberMapper.updateMember(vo);
	}
	@Transactional
	@Override
	public void withdrawMember(MemberVO vo) {
		String id=vo.getId();
		memberMapper.deleteProfileIMG(id);
		memberMapper.revokeRole(id);
		groundMapper.withdrawinsider(id);
		memberMapper.changeMemberStatus(id);
	}

	@Override
	public List<Map<String, String>> myGroundList(String id) {
		List<Map<String, String>> list = memberMapper.myGroundNoList(id);
		for(int i=0;i<list.size();i++) {
			String groundNo=String.valueOf(list.get(i).get("GROUNDNO"));
			GroundVO groundVO=groundMapper.findGroundByGroundNo(groundNo);
			list.get(i).put("groundName", groundVO.getGroundName());
			HobbyVO hobby=hobbyMapper.findHobbyByHobbyNo(groundVO.getHobby());
			list.get(i).put("hobby",hobby.getName());
		}
		return list;
	}

	@Override
	public ListVO<ScheduleVO> myScheduleList(String id,String pageNo) {
		int totalCount=groundMapper.getTotalmyScheduleList(id);
		PagingBean pagingBean=null;
		if(pageNo==null) { 
			pagingBean=new PagingBean(totalCount);
		}else {
			pagingBean=new PagingBean(totalCount,Integer.parseInt(pageNo));
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("pagingBean", pagingBean);
		return new ListVO<ScheduleVO>(pagingBean,groundMapper.getScheduleList(map));
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
	public List<Map<String,String>> myGroundNoList(String id) {
		return memberMapper.myGroundNoList(id);
	}
	@Override
	public String getProfileIMGName(String id) {
		return memberMapper.getProfileIMGName(id);
	}
	@Override
	public void reportGround(ReportVO reportVO) {
		memberMapper.reportGround(reportVO);
	}
}
