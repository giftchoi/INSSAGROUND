package org.kosta.inssaground.model.service;

import org.kosta.inssaground.model.vo.GroundVO;
import org.kosta.inssaground.model.vo.InsiderVO;
import org.kosta.inssaground.model.vo.ListVO;
import org.kosta.inssaground.model.vo.MemberVO;
import org.kosta.inssaground.model.vo.NoticeVO;
import org.kosta.inssaground.model.vo.PostVO;
import org.kosta.inssaground.model.vo.ScheduleVO;
import org.springframework.stereotype.Service;
@Service
public class GroundServiceImpl implements GroundService {

	@Override
	public void applyGround(GroundVO groundVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public GroundVO enterGround(String groundNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ListVO<GroundVO> searchGround(GroundVO groundVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public GroundVO groundDetail(GroundVO groundVO) {
		// TODO Auto-generated method stub
		return null;
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

}