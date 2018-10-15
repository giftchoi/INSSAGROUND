package org.kosta.inssaground.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.inssaground.model.mapper.GroundMapper;
import org.kosta.inssaground.model.mapper.HobbyMapper;
import org.kosta.inssaground.model.vo.GroundVO;
import org.kosta.inssaground.model.vo.HobbyCategoryVO;
import org.kosta.inssaground.model.vo.HobbyVO;
import org.kosta.inssaground.model.vo.InsiderVO;
import org.kosta.inssaground.model.vo.ListVO;
import org.kosta.inssaground.model.vo.MemberVO;
import org.kosta.inssaground.model.vo.NoticeVO;
import org.kosta.inssaground.model.vo.PostVO;
import org.kosta.inssaground.model.vo.ScheduleVO;
import org.kosta.inssaground.model.vo.SidoVO;
import org.kosta.inssaground.model.vo.SigunguVO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
@Service
public class GroundServiceImpl implements GroundService {
	@Resource
	private GroundMapper groundMapper;
	@Resource
	private HobbyMapper hobbyMapper;
	@Override
	public void applyGround(GroundVO groundVO,SidoVO sidoVO,SigunguVO sigunguVO,HobbyVO hobbyVO,HobbyCategoryVO hobbyCategoryVO) {
		System.out.println("1");
		SigunguVO sgvo = groundMapper.findSigunguBySigunguNo(sigunguVO.getSigunguNo());
		System.out.println("2");
		HobbyVO hvo = hobbyMapper.findHobbyByHobbyNo(hobbyVO.getHobbyNo());
		System.out.println("3");
		MemberVO mvo= (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); //세션에서 정보받아옴
		System.out.println("4");
		groundVO.setMaster(mvo.getId());
		System.out.println("5");
		groundVO.setHobby(hvo.getHobbyNo());
		System.out.println("6");
		groundVO.setArea(sgvo.getSigunguNo());
		System.out.println(groundVO);
		groundMapper.groundApply(groundVO);
	}

	@Override
	public GroundVO enterGround(String groundNo) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<GroundVO> searchGroundTest(GroundVO groundVO){
		return groundMapper.searchGroundTest(groundVO);
	}
	
	@Override
	public ListVO<GroundVO> searchGround(GroundVO groundVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public GroundVO groundDetail(GroundVO groundVO) {
		// TODO Auto-generated method stub
		return groundMapper.groundDetail(groundVO);
	}

	@Override
	public void groundParticipation() {
		// TODO Auto-generated method stub

	}

	@Override
	public ListVO<PostVO> groundBoard(GroundVO groundVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void registerGroundSchedule(ScheduleVO scheduleVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteGroundSchedule(ScheduleVO scheduelVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void registerGroundNotice(NoticeVO noticeVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void groundParticipantPermission(GroundVO groundVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public InsiderVO groundParticipantList(GroundVO GroundVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO groundParticipantMemberInfo(GroundVO groundVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void registerinsider(InsiderVO insiderVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateGroundNotice(NoticeVO noticeVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteGroundNotice(String noticeNo) {
		// TODO Auto-generated method stub

	}

	@Override
	public NoticeVO groundNoticeDetail(String noticeNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateGroundSchedule(ScheduleVO scheduleVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void groundScheduleParticipation(GroundVO groundVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void registerGroundMember(GroundVO groundVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public PostVO GroundImg(GroundVO groundVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public GroundVO GroundActivityInfo(GroundVO groundVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ScheduleVO groundScheduleDetail(ScheduleVO scheduleVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SidoVO> getAllSido() {		
		return groundMapper.getAllSido();
	}

	@Override
	public List<SigunguVO> getSigungu() {		
		return groundMapper.getSigungu();
	}

	


}
