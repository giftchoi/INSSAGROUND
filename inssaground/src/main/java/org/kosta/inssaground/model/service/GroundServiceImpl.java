package org.kosta.inssaground.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.inssaground.model.mapper.GroundMapper;
import org.kosta.inssaground.model.mapper.HobbyMapper;
import org.kosta.inssaground.model.vo.GroundHashtagVO;
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
import org.springframework.security.core.Authentication;
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
		System.out.println(groundVO.getGroundNo());
	}

	@Override
	public GroundVO enterGround(String groundNo) {
		// TODO Auto-generated method stub
		return null;
	}

	public ListVO<GroundVO> searchGroundTest(PagingBean pagingBean,GroundVO groundVO){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("pagingBean", pagingBean);
		map.put("groundVO",groundVO);
		return new ListVO<GroundVO>(pagingBean,groundMapper.searchGroundTest(map));
	}
	
	@Override
	public ListVO<GroundVO> searchGround(String sido, String sigungu, String category, String hobby, GroundVO groundVO,String nowPage) {
		Map<String,Object> map = new HashMap<String,Object>();
		if(sido!=null)
		map.put("sido", sido);
		if(sigungu!=null)
		map.put("sigungu", sigungu);
		if(category!=null)
		map.put("category",category);
		if(hobby!=null)
		map.put("hobby", hobby);
		map.put("groundVO", groundVO);
		int resultCount = groundMapper.getGroundSearchResultCount(map);
		//System.out.println("resultCount"+resultCount);
		PagingBean pagingBean = new PagingBean(resultCount,Integer.parseInt(nowPage));
		map.put("pagingBean",pagingBean);

		return new ListVO<GroundVO>(pagingBean,groundMapper.searchGround(map));
	}
	@Override
	public ListVO<GroundVO> getAllGroundList() {
		int resultCount = groundMapper.getGroundSearchResultCount(null);
		PagingBean pagingBean = new PagingBean(resultCount,1);
		return new ListVO<GroundVO>(pagingBean,groundMapper.getAllGroundList(pagingBean));
	}

	@Override
	public ListVO<NoticeVO> getAllGroundNoticeList(String groundNo,String nowPage) {
		System.out.println("공지리스트:"+groundNo);
		int noticeCount = groundMapper.getGroundNoticeCount(groundNo);
		PagingBean pagingBean = new PagingBean(noticeCount, Integer.parseInt(nowPage));
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("pagingBean", pagingBean);
		map.put("groundNo",groundNo);
		return new ListVO<NoticeVO>(pagingBean ,groundMapper.getAllGroundNoticeList(map));
	}

	
	
	
	@Override
	public GroundVO groundDetail(GroundVO groundVO) {
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
	public void deleteGroundSchedule(ScheduleVO scheduleVO) {
		groundMapper.deleteGroundSchedule(scheduleVO);
	}

	@Override
	public void registerGroundNotice(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		groundMapper.registerGroundNotice(noticeVO);

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
		groundMapper.updateGroundSchedule(scheduleVO);
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
	public List<SigunguVO> getSigungu(String sidoNo) {		
		return groundMapper.getSigungu(sidoNo);
	}

	@Override
	public int getGroundSearchResultCount(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return groundMapper.getGroundSearchResultCount(map);
	}

	@Override
	public void groundHashtag(String[] tags,GroundVO groundVO) {
		System.out.println(groundVO.getGroundNo());
		System.out.println("**0**");
		for(int i=0;i<tags.length;i++ ) {
			System.out.println("**1**");
			System.out.println(tags[i]);
			System.out.println("**2**");
			if(groundMapper.hashtagBoolean(tags[i]) == 0) {
				groundMapper.registerTag(tags[i]);				
			}
			System.out.println("**3**");
			GroundHashtagVO groundHashtagVO = new GroundHashtagVO(groundVO.getGroundNo(),tags[i]);
			System.out.println("**4**");
			groundMapper.groundHashtag(groundHashtagVO);
			System.out.println("**5**");
		}
		
		
		
	}

	@Override
	public void registergroundImg(GroundVO groundVO) {
		groundMapper.registergroundImg(groundVO);
	}


	@Override
	public GroundVO findGroundByGroundNo(GroundVO groundVO) {		
		return groundMapper.findGroundByGroundNo(groundVO.getGroundNo());
	}

	@Override
	public void registergroundschedule(ScheduleVO scheduleVO) {
		groundMapper.registergroundschedule(scheduleVO);
	}
	public void participateGround(String groundNo) {
		Map<String,String> map = new HashMap<String,String>();
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		map.put("groundNo", groundNo);
		map.put("id", ((MemberVO)authentication.getPrincipal()).getId());
		groundMapper.participateGround(map);	
		

	}

	

	public List<MemberVO> getParticipationReadyList(String groundNo) {
		// TODO Auto-generated method stub
		return groundMapper.getParticipationReadyList(groundNo);
	}

	@Override
	public void approveParticipation(InsiderVO insiderVO) {
		groundMapper.approveParticipation(insiderVO);
	}

	@Override
	public ScheduleVO findGroundScheduleByScheduleNo(ScheduleVO scheduleVO) {		
		return groundMapper.findGroundScheduleByScheduleNo(scheduleVO);
	}

	@Override

	public NoticeVO getNoticeDetailByNo(String noticeNo) {
		// TODO Auto-generated method stub
		return groundMapper.getNoticeDetailByNo(noticeNo);
	}


	public ListVO<ScheduleVO> groundSchedulePagingBean(GroundVO groundVO,String pageNo) {
		int totalCount = groundMapper.groundScheduleTotalCount(groundVO);
		PagingBean pagingBean = null;
		if(pageNo == null) {
			pagingBean = new PagingBean(totalCount);			
		}else {
			pagingBean = new PagingBean(totalCount,Integer.parseInt(pageNo));	
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("groundVO",groundVO);
		map.put("pagingBean",pagingBean);
		List<ScheduleVO> list = groundMapper.grouondScheduleList(map);
		ListVO<ScheduleVO> listVO = new ListVO<ScheduleVO>(pagingBean,list);
		return listVO;
	}

	@Override
	public List<InsiderVO> findGroundMemberListByGroundNo(GroundVO groundVO) {		
		return groundMapper.findGroundMemberListByGroundNo(groundVO);
	}


	


}
