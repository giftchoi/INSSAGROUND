package org.kosta.inssaground.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.inssaground.model.service.FileUploadService;
import org.kosta.inssaground.model.service.GroundService;
import org.kosta.inssaground.model.service.HobbyService;
import org.kosta.inssaground.model.service.MemberService;
import org.kosta.inssaground.model.vo.GroundImgVO;
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
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class GroundController {
	@Resource
	private GroundService groundService;
	@Resource
	private HobbyService hobbyService;	
	@Resource
	private MemberService memberService;
	@Resource
	private FileUploadService fileUploadService;
	/**
	 * 전체 모임 목록을 불러오기 위한 메소드
	 * @param model
	 * @param nowPage
	 * @return
	 */
	@RequestMapping("groundList.do")
	public String groundList(Model model,String nowPage) {
		int page;
		if(nowPage==null) page = 1;
		else page = Integer.parseInt(nowPage);
		
		model.addAttribute("listVO", groundService.getAllGroundList());
		model.addAttribute("sidoList", groundService.getAllSido());
		model.addAttribute("hobbyCategoryList", hobbyService.getHobbyCategory());
		return "ground/ground-list.tiles";
	}
	/**
	 * 모임 검색 결과 리스트를 불러오기 위한 메소드
	 * 
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping("searchGround.do")
	public ListVO<GroundVO> searchGround(String sido, String sigungu, String category, String hobby, GroundVO groundVO,String nowPage) {		
		if(sido=="") sido = null;
		if(sigungu=="") sigungu = null;
		if(category=="") category = null;
		if(hobby=="") hobby = null;
		if(nowPage==null) nowPage = "1";
		System.out.println("searchGround.... nowPage="+nowPage);
		return groundService.searchGround(sido,sigungu,category,hobby,groundVO,nowPage);
	}

	@Secured("ROLE_MEMBER")
	@RequestMapping("groundApplyForm.do")
	public String groundApplyForm(Model model) {
		model.addAttribute("sido", groundService.getAllSido());
		model.addAttribute("hobbyCategory", hobbyService.getHobbyCategory());
		return "ground/ground-apply-form.tiles";
	}
	
	@RequestMapping("groundDetail.do")
	public String groundDetail(GroundVO paramVO, Model model) {
		System.out.println(paramVO.getGroundNo());
		GroundVO groundVO = groundService.groundDetail(paramVO);
		
		//GroundVO groundVO = groundService.findGroundByGroundNo(paramVO);
		model.addAttribute("groundVO", groundVO);
		model.addAttribute("pics",groundService.groundPicture(paramVO));
		return "ground/ground-detail";
	}
	
	/**
	 * 모임 참여 신청하기
	 * @param paramVO
	 * @param model
	 * @return
	 */
	
	@Secured("ROLE_MEMBER")
	@PostMapping("participateGround.do")
	public String participateGround(String groundNo) {
		//1.insider 테이블에 추가
		groundService.participateGround(groundNo);
		//2.세션 리스트 변경
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		mvo.setGroundNoList(memberService.myGroundNoList(mvo.getId()));
		
		return "redirect:participateGroundResult.do";
	}

	@RequestMapping("participateGroundResult.do")
	public String participateGroundResult() {
		return "ground/ground-participate-result.tiles";
	}
	
	@ResponseBody
	@RequestMapping("getSigungu.do")
	public List<SigunguVO> getSigungu(String sidoNo) {
		System.out.println(sidoNo);
		return groundService.getSigungu(sidoNo);
	}

	@ResponseBody
	@RequestMapping("findHobbyByHobbyCategoryNo.do")
	public List<HobbyVO> findHobbyByHobbyCategoryNo(String hobbyCategoryNo) {
		return hobbyService.findHobbyByHobbyCategoryNo(hobbyCategoryNo);
	}

	@Secured("ROLE_MEMBER")
	@PostMapping("groundApply.do")
	public String groundApply(HttpServletRequest request, GroundVO groundVO, SidoVO sidoVO, SigunguVO sigunguVO, HobbyVO hobbyVO,
			HobbyCategoryVO hobbyCategoryVO,MultipartFile picture) {
		//////////////////////////////////////////////////
		String tags[] = request.getParameterValues("hashtag");
		System.out.println("controller 1");
		groundService.applyGround(groundVO, sidoVO, sigunguVO, hobbyVO, hobbyCategoryVO);		
		System.out.println("controller 2");
		groundService.groundHashtag(tags,groundVO);
		/////////////////////////////////////////////////////////////////
		//String uploadPath=request.getSession().getServletContext().getRealPath("/resources/uploadImage/");
		String fileName = null;
		try {
			fileName = fileUploadService.fileUpload(picture);
		} catch (IllegalStateException | IOException e) {
			
			e.printStackTrace();
		}
		GroundImgVO givo = new GroundImgVO();
		givo.setImgName(fileName);
		groundVO.setGroundImgVO(givo);
		groundService.registergroundImg(groundVO);
			
		
		return "redirect:result.do";
	}
	
	@RequestMapping("result.do")
	public String groundApplyResult() {
		return "ground/ground-apply-result.tiles";
	}
	/**
	 * 	싸장 - 모임 관리 페이지로 이동
	 * @return
	 */
	/*Ground Master */
	@RequestMapping("groundMasterPage.do")
	public String groundMasterPage() {
		return "ground/home/ground-master-page.tiles";
	}
	
	/**
	 * 	싸장 - 모임 참여 대기 승인, 거절
	 * @param session
	 * @param model
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("groundMasterReadyList.do")
	public String groundMasterReadyList(HttpSession session,Model model) {
		String groundNo = ((GroundVO)session.getAttribute("ground")).getGroundNo();	//세션에 저장된 모임번호 가져오기
		List<MemberVO> readyList = groundService.getParticipationReadyList(groundNo);
	/*	System.out.println(groundNo);
		System.out.println(readyList);*/
		model.addAttribute("readyList",readyList);
		return "ground/home/ground-master-ready-list.tiles";
	}
	@Secured("ROLE_MEMBER")
	@PostMapping("approveParticipation.do")
	public String approveParticipation(InsiderVO insiderVO) {
		System.out.println("groundNo:"+insiderVO.getGroundNo()+",idididid"+insiderVO.getMemberVO().getId());
		groundService.approveParticipation(insiderVO);
		return "redirect:groundMasterReadyList.do";
	}
	@PostMapping("rejectParticipation.do")
	public String rejectParticipation(InsiderVO insiderVO) {
		System.out.println(insiderVO+":참여 거절 테스트");
		groundService.rejectParticipation(insiderVO);
		return "redirect:groundMasterReadyList.do";
	}
	
	
	
	
	
	/**
	 *  싸장- 모임 공지 등록 폼으로 이동
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("groundNoticeRegisterForm.do")
	public String registerGroundNoticeForm() {
		return "ground/home/ground-notice-register-form.tiles";
	}
	
	/**
	 *  싸장 - 모임 공지 등록
	 * @param noticeVO
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@PostMapping("groundNoticeRegister.do")
	public String registerGroundNotice(NoticeVO noticeVO) {
		//System.out.println("groundNoticeRegister:"+noticeVO.getGroundNo()+","+noticeVO.getContent());
		groundService.registerGroundNotice(noticeVO);
		
		return "redirect:groundNoticeDetail.do?noticeNo="+noticeVO.getNoticeNo();
	}
	/**
	 *  인싸 - 공지 게시판 보기
	 * @param groundVO
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("groundNoticeList.do")
	public String groundNoticeList(Model model,String groundNo,String nowPage) {
		if(nowPage==null)nowPage="1";
		ListVO<NoticeVO> noticeList = groundService.getAllGroundNoticeList(groundNo,nowPage);

		model.addAttribute("listVO",noticeList);
		return "ground/home/ground-notice-list.tiles";
	}
	/**
	 *  인싸 - 공지 상세 보기
	 * @param groundVO
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("groundNoticeDetail.do")
	public String groundNoticeDetail(Model model,String noticeNo) {
		NoticeVO noticeVO = groundService.getNoticeDetailByNo(noticeNo);
		model.addAttribute("noticeVO",noticeVO);
		return "ground/home/ground-notice-detail.tiles";
	}
	/**
	 *  싸장 - 공지 삭제
	 * @param noticeVO
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@PostMapping("groundNoticeDelete.do")
	public String deleteGroundNotice(NoticeVO noticeVO) {
		groundService.deleteGroundNotice(noticeVO.getNoticeNo());
		return "redirect:groundNoticeList.do?groundNo="+noticeVO.getGroundNo();
	}
	
	@Secured("ROLE_MEMBER")
	@RequestMapping("groundNoticeUpdateForm.do")
	public String updateGroundNoticeForm(Model model, String noticeNo) {
		NoticeVO noticeVO=groundService.getNoticeDetailByNo(noticeNo);
		model.addAttribute(noticeVO);
		return "ground/home/ground-notice-update-form.tiles";
	}
	
	@Secured("ROLE_MEMBER")
	@PostMapping("groundNoticeUpdate.do")
	public String updateGroundNotice(NoticeVO noticeVO) {
		//System.out.println("groundNoticeRegister:"+noticeVO.getGroundNo()+","+noticeVO.getContent());
		groundService.updateGroundNotice(noticeVO);
		return "redirect:groundNoticeDetail.do?noticeNo="+noticeVO.getNoticeNo();
	}
	@Secured("ROLE_MEMBER")
	@RequestMapping("groundPostRegisterForm.do")
	public String groundPostRegisterForm() {
		
		return "ground/home/ground-post-register-form.tiles";
	}
	@Secured("ROLE_MEMBER")
	@ResponseBody
	@PostMapping("groundPostImgUpload.do")
	public String uploadGroundImg(MultipartFile picture) {
		String nName = null;
		try {
			nName = fileUploadService.fileUpload(picture);
		} catch (IllegalStateException | IOException e) {
			
			e.printStackTrace();
		}
		return nName;
	}
	@Secured("ROLE_MEMBER")
	@Transactional
	@PostMapping("groundPostRegister.do")
	public String registerGroundPost(PostVO postVO) {
		MemberVO mvo= (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		postVO.getInsiderVO().setMemberVO(mvo);
		groundService.registerGroundPost(postVO);
		
		//System.out.println(postVO);
		return "redirect:groundPostDetail.do?postNo="+postVO.getPostNo();
	}
	@Secured("ROLE_MEMBER")
	@RequestMapping("groundPostUpdateForm.do")
	public String groundPostUpdateForm(String postNo,Model model) {
		PostVO postVO = groundService.findPostByPostNo(postNo); 
		model.addAttribute("postVO",postVO);
		System.out.println(postVO);
		return "ground/home/ground-post-update-form.tiles";
	}
	@Secured("ROLE_MEMBER")
	@Transactional
	@PostMapping("groundPostUpdate.do")
	public String groundPostUpdate(PostVO postVO) {	
		groundService.updateGroundPost(postVO);
		return "redirect:groundPostDetail.do?postNo="+postVO.getPostNo();
	}
	
	@Secured("ROLE_MEMBER")
	@RequestMapping("ground-home.do")
	public String groundHome(GroundVO groundVO,Model model,HttpSession session,String sc) {

		System.out.println("ground-home: "+groundVO.getGroundNo());
		GroundVO gvo = groundService.findGroundByGroundNo(groundVO);		
		GroundVO vo = groundService.groundHashtag2(gvo);
		gvo.setTagList(vo.getTagList());
		System.out.println(gvo);
		MemberVO mvo= (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); //세션에서 정보받아옴
		System.out.println(mvo);
		InsiderVO insiderVO = groundService.groundHomeInsider(mvo.getId(),groundVO.getGroundNo());// 출석수
		List<String> attendance = null;
		if(session.getAttribute("attendance")==null) {
			attendance = new ArrayList<String>();	
		}else {
			attendance=(List<String>)session.getAttribute("attendance");			
		}
		groundService.addAttendance(gvo.getGroundNo(),mvo.getId(),attendance);
		model.addAttribute("schedule",groundService.newSchedule(gvo.getGroundNo()));
		session.setAttribute("attendance",attendance);
		List<String> pList = groundService.groundPicture(groundVO);
		System.out.println("********"+pList);
		model.addAttribute("picture",pList);
		model.addAttribute("post",groundService.newPost(groundVO.getGroundNo()));
		model.addAttribute("notice",groundService.newNotice(groundVO));
		session.setAttribute("mvo",mvo);
		session.setAttribute("insiderVO",insiderVO);
		//model.addAttribute("insiderVO",insiderVO);
		session.setAttribute("ground",gvo);
		session.setAttribute("gvo",gvo);
		//model.addAttribute("gvo",gvo);
		if(sc!= null) {
			return "redirect:groundScheduleDetail.do?scheduleNo="+sc;
		}
		return "ground/home/ground-home.tiles";
	}
	@Secured("ROLE_MEMBER")
	@RequestMapping("groundPost.do")
	public String groundPost(Model model,String groundNo,String nowPage) {
		if(nowPage==null) nowPage="1";
		model.addAttribute("listVO",groundService.getAllGroundPostList(groundNo,nowPage));
		return "ground/home/ground-board.tiles";
	}
	
	@Transactional
	@Secured("ROLE_MEMBER")
	@RequestMapping("groundPostDetail.do")
	public String groundPost(String postNo, Model model) {
		PostVO postVO = groundService.findPostByPostNo(postNo); 
		model.addAttribute("postVO",postVO);
		return "ground/home/ground-post-detail.tiles";
	}
	@Secured("ROLE_MEMBER")
	@Transactional
	@PostMapping("groundPostDelete.do")
	public String deleteGroundPost(PostVO postVO) {
		groundService.deleteGroundPost(postVO);
		return "redirect:groundPost.do?groundNo="+postVO.getInsiderVO().getGroundNo();
	}
	
	@Secured("ROLE_MEMBER")
	@RequestMapping("groundScheduleForm.do")
	public String groundScheduleForm(String groundNo) {
		System.out.println(groundNo);
		return "ground/home/ground-schedule-form.tiles";
	}
	@Secured("ROLE_MEMBER")
	@PostMapping("registergroundschedule.do")
	public String registergroundschedule(ScheduleVO scheduleVO,GroundVO groundVO,InsiderVO insiderVO,HttpSession session) {
		System.out.println(scheduleVO);
		MemberVO mvo= (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); //세션에서 정보받아옴		
		GroundVO gvo = (GroundVO)session.getAttribute("ground");		
		insiderVO.setMemberVO(mvo);		
		groundVO.setGroundNo(gvo.getGroundNo());		
		scheduleVO.setInsiderVO(insiderVO);		
		scheduleVO.setGroundVO(groundVO);		
		groundService.registergroundschedule(scheduleVO,gvo,mvo);
		System.out.println("**7");
		return "redirect:groundScheduleList.do";
		
	}
	@Secured("ROLE_MEMBER")
	@RequestMapping("groundScheduleList.do")
	public String groundScheduleList(HttpSession session,Model model,String pageNo) {		
		GroundVO groundVO = (GroundVO)session.getAttribute("ground");
		System.out.println("controller1");
		System.out.println("controller2");
		ListVO<ScheduleVO> listVO = groundService.groundSchedulePagingBean(groundVO, pageNo);	
		MemberVO memberVO= (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); //세션에서 정보받아옴		
		System.out.println("controller3");
		System.out.println(listVO);
		System.out.println("controller4");		
		for(int i=0;i<listVO.getList().size();i++) {
			System.out.println("리스트 번호 : "+listVO.getList().get(i).getScheduleNo());
		}
		model.addAttribute("sList",listVO);
		return "ground/home/ground-schedule-list.tiles";
	}
	@Secured("ROLE_MEMBER")
	@RequestMapping("groundScheduleDetail.do")
	public String groundScheduleDetail(String scheduleNo,Model model,HttpSession session) {
		GroundVO groundVO = (GroundVO)session.getAttribute("ground");		
		ScheduleVO scheduleVO = new ScheduleVO();
		scheduleVO.setScheduleNo(scheduleNo);
		MemberVO memberVO= (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); //세션에서 정보받아옴
		model.addAttribute("participation",groundService.ParticipationBoolean(memberVO, scheduleNo));
		model.addAttribute("scheduleDetail",groundService.findGroundScheduleByScheduleNo(scheduleVO));	
		model.addAttribute("scheduleParticipationMember",groundService.scheduleParticipationMember(groundVO,scheduleNo));		
		return "ground/home/ground-schedule-detail.tiles";
	}
	@Secured("ROLE_MEMBER")
	@RequestMapping("updateGroundScheduleForm.do")
	public String updateGroundScheduleForm(ScheduleVO scheduleVO,Model model) {
		model.addAttribute("scheduleDetail",groundService.findGroundScheduleByScheduleNo(scheduleVO));
		return "ground/home/ground-schedule-update.tiles";
	}
	@Secured("ROLE_MEMBER")
	@PostMapping("updateGroundSchedule.do")
	public String updateGroundSchedule(ScheduleVO scheduleVO) {
		System.out.println("ct1.************"+scheduleVO);
		groundService.updateGroundSchedule(scheduleVO);
		System.out.println("ct2.********");
		return "redirect:groundScheduleList.do";
	}
	@Secured("ROLE_MEMBER")
	@PostMapping("deleteGroundSchedule.do")
	public String deleteGroundSchedule(ScheduleVO scheduleVO) {
		System.out.println(scheduleVO);
		groundService.deleteGroundSchedule(scheduleVO);		
		return "redirect:groundScheduleList.do";
	}
	@Secured("ROLE_MEMBER")
	@RequestMapping("groundMemberList.do")
	public String groundMemberList(Model model,HttpSession session) {
		GroundVO gvo = (GroundVO)session.getAttribute("ground");
		System.out.println(gvo);
		List<InsiderVO> mvo = groundService.findGroundMemberListByGroundNo(gvo);
		System.out.println(mvo);
		model.addAttribute("memberList",groundService.findGroundMemberListByGroundNo(gvo));
		return "ground/home/ground-member-list.tiles";
	}
	@Secured("ROLE_MEMBER")
	@RequestMapping("scheduleParticipation.do")
	public String scheduleParticipation(HttpSession session,String scheduleNo) {
		MemberVO memberVO= (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); //세션에서 정보받아옴
		GroundVO groundVO = (GroundVO)session.getAttribute("ground");
		groundService.scheduleParticipation(scheduleNo, memberVO, groundVO);
		return "redirect:groundScheduleList.do";
	}
	/*@Secured("ROLE_MEMBER")
	@RequestMapping("groundPicture.do")
	public String groundPicture(HttpSession session,Model model) {
		GroundVO groundVO = (GroundVO)session.getAttribute("ground");
		List<PostVO> postList = groundService.groundPicture(groundVO);
		model.addAttribute("postList",postList);
		return "ground/home/ground-picture.tiles";
	}*/
	@Secured("ROLE_MEMBER")
	@RequestMapping("memberInfo.do")
	public String memberInfo(String id,HttpSession session,Model model) {
		/* 게시물수
		 *  출석수
		 *  스케줄 등록수 
		 *  스케줄 참여 횟수
		 */
		GroundVO groundVO = (GroundVO)session.getAttribute("ground");
		//MemberVO memberVO= (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); //세션에서 정보받아옴
		model.addAttribute("memberVO",id);
		model.addAttribute("post",groundService.groundMemberPostCount(id,groundVO.getGroundNo()));
		model.addAttribute("schedule",groundService.groundMemberScheduleCount(id,groundVO.getGroundNo()));
		model.addAttribute("participation",groundService.groundMemberParticipationCount(id,groundVO.getGroundNo()));
		model.addAttribute("attendance",groundService.groundMemberAttendance(id, groundVO.getGroundNo()));
		return "ground/home/ground-member-info.tiles";
	}
	@Secured("ROLE_MEMBER")
	@PostMapping("withdrawGround.do")
	public String withdrawGround(String groundNo) {
		MemberVO memberVO= (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); //세션에서 정보받아옴
		groundService.withdrawGround(memberVO.getId(), groundNo);
		//세션의 모임정보 변경
		memberVO.setGroundNoList(memberService.myGroundNoList(memberVO.getId()));
		return "redirect:home.do";
	}
/*	@Secured("ROLE_MEMBER")
	@RequestMapping("ground-chat.do")
	public String chat() {
		return "ground/home/ground-chat.tiles";
	}*/
}
