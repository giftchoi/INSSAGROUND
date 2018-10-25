package org.kosta.inssaground.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
		System.out.println("searchResultCount "+resultCount);
		PagingBean pagingBean = new PagingBean(resultCount,Integer.parseInt(nowPage));
		map.put("pagingBean",pagingBean);
		
		List<GroundVO>	list = groundMapper.searchGround(map);
		//System.out.println(list.get(1));
		return new ListVO<GroundVO>(pagingBean,list);
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
		GroundVO gvo = groundMapper.groundDetail(groundVO);
		gvo.setTagList(groundMapper.getHashtagList(groundVO.getGroundNo()));
		return gvo;
	}



	

	@Override
	public void deleteGroundSchedule(ScheduleVO scheduleVO) {
		groundMapper.deletePaticipation(scheduleVO.getScheduleNo());
		groundMapper.deleteGroundSchedule(scheduleVO);
	}

	@Override
	public void registerGroundNotice(NoticeVO noticeVO) {
	
		groundMapper.registerGroundNotice(noticeVO);

	}
	@Override
	public void updateGroundNotice(NoticeVO noticeVO) {

		groundMapper.updateGroundNotice(noticeVO);
	}


	@Override
	public void deleteGroundNotice(String noticeNo) {
	
		groundMapper.deleteGroundNotice(noticeNo);
	}

	@Override
	public void updateGroundSchedule(ScheduleVO scheduleVO) {
		String date = scheduleVO.getStartDate().replace("T"," ");
		String date2 = scheduleVO.getEndDate().replace("T"," ");
		scheduleVO.setStartDate(date);
		scheduleVO.setEndDate(date2);
		System.out.println("s*********"+scheduleVO+"*****************"+scheduleVO.getStartDate()+" "+scheduleVO.getEndDate()+" "
		+scheduleVO.getStartDate().length());
		groundMapper.updateGroundSchedule(scheduleVO);
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
	public void registergroundschedule(ScheduleVO scheduleVO,GroundVO groundVO,MemberVO memberVO) {		
		String date = scheduleVO.getStartDate().replace("T"," ");
		String date2 = scheduleVO.getEndDate().replace("T"," ");
		scheduleVO.setStartDate(date);
		scheduleVO.setEndDate(date2);
		System.out.println(scheduleVO);
		groundMapper.registergroundschedule(scheduleVO);
		scheduleParticipation(scheduleVO.getScheduleNo(), memberVO, groundVO);
	}
	public void participateGround(String groundNo) {
		Map<String,String> map = new HashMap<String,String>();
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		map.put("groundNo", groundNo);
		map.put("id", ((MemberVO)authentication.getPrincipal()).getId());
		groundMapper.participateGround(map);	
		

	}

	

	public List<MemberVO> getParticipationReadyList(String groundNo) {
	
		return groundMapper.getParticipationReadyList(groundNo);
	}

	@Override
	public void approveParticipation(InsiderVO insiderVO) {
		groundMapper.approveParticipation(insiderVO);
	}
	
	@Override
	public void rejectParticipation(InsiderVO insiderVO) {
		groundMapper.rejectParticipation(insiderVO);
		
	}

	@Override
	public ScheduleVO findGroundScheduleByScheduleNo(ScheduleVO scheduleVO) {
		return groundMapper.findGroundScheduleByScheduleNo(scheduleVO);
	}

	@Override

	public NoticeVO getNoticeDetailByNo(String noticeNo) {

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
		for(int i=0;i<listVO.getList().size();i++) {
			listVO.getList().get(i).setCurrPersonnel(groundMapper.scheduleCurrPersonnel(listVO.getList().get(i).getScheduleNo()));
		}
		System.out.println(listVO);
		return listVO;
	}

	@Override
	public List<InsiderVO> findGroundMemberListByGroundNo(GroundVO groundVO) {		
		return groundMapper.findGroundMemberListByGroundNo(groundVO);
	}

	@Override
	public MemberVO groundHomeMember(String id) {		
		return groundMapper.groundHomeMember(id);
	}

	@Override
	public String groundHomeProfile(String id) {		
		return groundMapper.groundHomeProfile(id);
	}

	@Override
	public InsiderVO groundHomeInsider(String id,String groundNo) {	
		InsiderVO insiderVO = new InsiderVO();
		MemberVO vo = new MemberVO();
		vo.setId(id);
		insiderVO.setMemberVO(vo);
		insiderVO.setGroundNo(groundNo);
		return groundMapper.groundHomeInsider(insiderVO);
	}

	@Override
	public GroundVO groundHashtag2(GroundVO groundVO) {		
		List<String> list = groundMapper.getHashtagList(groundVO.getGroundNo());
		groundVO.setTagList(list);
		return groundVO;
	}

	@Override
	public void scheduleParticipation(String scheduleNo, MemberVO memberVO, GroundVO groundVO) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberVO",memberVO);
		map.put("scheduleNo",scheduleNo);
		map.put("groundVO",groundVO);		
		groundMapper.scheduleParticipation(map);
	}

	@Override
	public List<MemberVO> scheduleParticipationMember(GroundVO groundVO, String scheduleNo) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("groundVO",groundVO);
		map.put("scheduleNo",scheduleNo);		
		return groundMapper.scheduleParticipationMember(map);
	}

	@Override
	public NoticeVO newNotice(GroundVO groundVO) {		
		return groundMapper.newNotice(groundVO);
	}

	@Override
	public List<PostVO> newPost(String groundNo) {		
		return groundMapper.newPost(groundNo);
	}

	@Override
	public List<PostVO> groundPicture(GroundVO groundVO) {		
		return groundMapper.groundPicture(groundVO);
	}

	@Override
	public int ParticipationBoolean(MemberVO memberVO, String scheduleNo) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberVO",memberVO);
		map.put("scheduleNo",scheduleNo);
		return groundMapper.ParticipationBoolean(map);
	}

	

	public void registerGroundPost(PostVO postVO) {
		
		groundMapper.insertGroundPost(postVO);
		List<String> picList = postVO.getPictureList();
		Map<String,String> map = new HashMap<String,String>();
		map.put("postNo", postVO.getPostNo());
		for(int i=0;i<picList.size();i++) {			
			map.put("imgName", picList.get(i));
			groundMapper.insertPostImg(map);
		}
			
	}


	@Override
	public ListVO<PostVO> getAllGroundPostList(String groundNo,String nowPage) {
		int postCount = groundMapper.getTotalGroundPostCount(groundNo);
		PagingBean pagingBean = new PagingBean(postCount,Integer.parseInt(nowPage));
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("pagingBean", pagingBean);
		map.put("groundNo", groundNo);
		return new ListVO<PostVO>(pagingBean,groundMapper.getAllGroundPostList(map));
	}

	@Override
	public PostVO findPostByPostNo(String postNo) {
		groundMapper.updatePostHits(postNo);
		PostVO postVO = groundMapper.findPostByPostNo(postNo);
		postVO.setPictureList(groundMapper.getPicListByPostNo(postNo));
		return postVO;
	}

	@Override
	public void updateGroundPost(PostVO postVO) {
	
		groundMapper.updateGroundPost(postVO);
		groundMapper.deleteAllPostImg(postVO.getPostNo());
		List<String> picList = postVO.getPictureList();
		Map<String,String> map = new HashMap<String,String>();
		map.put("postNo", postVO.getPostNo());
		for(int i=0;i<picList.size();i++) {			
			map.put("imgName", picList.get(i));
			groundMapper.insertPostImg(map);
		}
	}


	public void addAttendance(String groundNo,String id,List<String> attendance) {
		if(attendance.contains(groundNo)) {
			
		}else {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("groundNo",groundNo);
			map.put("id",id);
			attendance.add(groundNo);		
			groundMapper.addAttendance(map);					
		}
		
		
		
	}

	@Override
	public void deleteGroundPost(PostVO postVO) {

		
		groundMapper.deleteAllPostImg(postVO.getPostNo());
		groundMapper.deletePostByPostNo(postVO.getPostNo());
	}

	@Override
	public int groundMemberPostCount(String id, String groundNo) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("groundNo",groundNo);
		map.put("id",id);
		return groundMapper.groundMemberPostCount(map);
	}

	@Override
	public int groundMemberAttendance(String id, String groundNo) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("groundNo",groundNo);
		map.put("id",id);
		return groundMapper.groundMemberAttendance(map);
	}

	@Override
	public int groundMemberScheduleCount(String id, String groundNo) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("groundNo",groundNo);
		map.put("id",id);
		return groundMapper.groundMemberScheduleCount(map);
	}

	@Override
	public int groundMemberParticipationCount(String id, String groundNo) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("groundNo",groundNo);
		map.put("id",id);
		return groundMapper.groundMemberParticipationCount(map);
	}

	@Override
	public void withdrawGround(String id, String groundNo) {
		Map<String,String> map =new HashMap<String,String>();
		map.put("id",id);
		map.put("groundNo",groundNo);
		groundMapper.withdrawGround(map);
	}

	@Override
	public ScheduleVO newSchedule(String groundNo) {		
		return groundMapper.newSchedule(groundNo);
	}
	public List<GroundVO> getHotGroundList() {
	
		return groundMapper.getHotGroundList();
	}
	/**
	 *  파일명 랜덤 생성 메서드
	 */
	@Override
	public String randomName(String originalName) {
		UUID uuid = UUID.randomUUID();
		String extension = originalName.substring(originalName.lastIndexOf("."));		
		originalName = uuid.toString()+extension;
		System.out.println("파일명 : "+originalName);
		return originalName;
	}




	


}
