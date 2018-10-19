package org.kosta.inssaground.model.service;

import java.util.HashMap;
import java.util.Map;

import org.kosta.inssaground.model.mapper.CustomGameMapper;
import org.kosta.inssaground.model.mapper.GroundMapper;
import org.kosta.inssaground.model.mapper.HobbyMapper;
import org.kosta.inssaground.model.mapper.MemberMapper;
import org.kosta.inssaground.model.mapper.OfficialGameMapper;
import org.kosta.inssaground.model.vo.EmailVO;
import org.kosta.inssaground.model.vo.GroundVO;
import org.kosta.inssaground.model.vo.HobbyVO;
import org.kosta.inssaground.model.vo.ListVO;
import org.kosta.inssaground.model.vo.MemberVO;
import org.kosta.inssaground.model.vo.ReportVO;
import org.kosta.inssaground.model.vo.SigunguVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private GroundMapper groundMapper;
	@Autowired
	private HobbyMapper hobbyMapper;
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private OfficialGameMapper offGameMapper;
	@Autowired
	private CustomGameMapper cusGameMapper;
	@Autowired
	private MailSenderService mailService;
	@Override
	public ListVO<GroundVO> applyGroundList(String pageNo) {
		int totalCount=groundMapper.getTotalApplyGroundList();
		PagingBean pagingBean=null;
		if(pageNo==null) {
			pagingBean=new PagingBean(totalCount);
		}else {
			pagingBean=new PagingBean(totalCount,Integer.parseInt(pageNo));
		}
		return new ListVO<GroundVO>(pagingBean,groundMapper.getApplyGroundList(pagingBean));
	}

	@Override
	public GroundVO getGroundDetail(String groundNo) {
		GroundVO groundVO=groundMapper.findGroundByGroundNo(groundNo);
		SigunguVO sigungu=groundMapper.findSigunguBySigunguNo(groundVO.getSigunguVO().getSigunguNo());
		groundVO.setArea(sigungu.getSigunguName());
		HobbyVO hobby=hobbyMapper.findHobbyByHobbyNo(groundVO.getHobby());
		groundVO.setHobby(hobby.getName());
		groundVO.setTagList(groundMapper.getHashtagList(groundNo));
		return groundVO;
	}

	@Override
	public void permitGround(String groundNo,String masterId) {
		groundMapper.permitGround(groundNo);
		Map<String,String> map=new HashMap<String,String>();
		map.put("groundNo", groundNo);
		map.put("id", masterId);
		groundMapper.insertInsider(map);
	}

	@Override
	public void rejectGround(String groundNo) {
		groundMapper.rejectGround(groundNo);
	}

	@Override
	public ListVO<ReportVO> getReportList(String pageNo) {
		int totalCount=groundMapper.getTotalApplyGroundList();
		PagingBean pagingBean=null;
		if(pageNo==null) {
			pagingBean=new PagingBean(totalCount);
		}else {
			pagingBean=new PagingBean(totalCount,Integer.parseInt(pageNo));
		}
		return new ListVO<ReportVO>(pagingBean,memberMapper.getReportList(pagingBean));
	}
	@Override
	public ReportVO getReportDetail(String reportNo) {
		return memberMapper.getReportDetail(reportNo);
	}
	@Transactional
	@Override
	public void reportAnswer(EmailVO email) {
		MemberVO member=memberMapper.findMemberById(email.getReceiver());
		email.setReceiver(member.getEmail());
		String content="안녕하세요 INSSAGROUND 관리자 입니다.\n "
				+"전에 문의주셨던 ["+email.getSubject()+"] 글에 대한 대한 답변입니다.\n"+email.getContent()+"\n감사합니다.";
		email.setContent(content);
		email.setSubject("RE : [INSSAGROUND 모임 신고]");
		mailService.sendEmail(email);
	}

}
