package org.kosta.inssaground.model.service;

import org.kosta.inssaground.model.vo.GroundVO;
import org.kosta.inssaground.model.vo.ListVO;
import org.kosta.inssaground.model.vo.ScheduleVO;

public interface GroundService {
	public void applyGround(GroundVO groundVO); // 모임신청
	public GroundVO enterGround(String groundNo); // 모임 홈
	public ListVO searchGround(GroundVO groundVO); //모임검색
	public ListVO groundDetail(); // 모임 상세보기
	public void groundParticipation(); // 모임참여
	public ListVO groundBoard(GroundVO groundVO);
	public void registerGroundSchedule(ScheduleVO scheduleVO); //모임 일정 등록
	
	
	//지선
	public ListVO myGroundList(String id); // 내가 참여한 모임 보기
	public ListVO myScheduleList(String id); // 내가 참여한 모임의 일정 보기
}
