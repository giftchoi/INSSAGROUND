package org.kosta.inssaground.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.inssaground.model.service.GroundService;
import org.kosta.inssaground.model.service.HobbyService;
import org.kosta.inssaground.model.service.MemberService;
import org.kosta.inssaground.model.service.PagingBean;
import org.kosta.inssaground.model.vo.GroundImgVO;
import org.kosta.inssaground.model.vo.GroundVO;
import org.kosta.inssaground.model.vo.HobbyCategoryVO;
import org.kosta.inssaground.model.vo.HobbyVO;
import org.kosta.inssaground.model.vo.InsiderVO;
import org.kosta.inssaground.model.vo.ListVO;
import org.kosta.inssaground.model.vo.MemberVO;
import org.kosta.inssaground.model.vo.ScheduleVO;
import org.kosta.inssaground.model.vo.SidoVO;
import org.kosta.inssaground.model.vo.SigunguVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
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
		return groundService.searchGround(sido,sigungu,category,hobby,groundVO,nowPage);	
	}


	@Secured("ROLE_MEMBER")
	@RequestMapping("groundApplyForm.do")
	public String groundApplyForm(Model model) {
		model.addAttribute("sido", groundService.getAllSido());
		model.addAttribute("hobbyCategory", hobbyService.getHobbyCategory());
		return "ground/ground-apply-form.tiles";
	}
	
	@Secured("ROLE_MEMBER")
	@RequestMapping("groundDetail.do")
	public String groundDetail(GroundVO paramVO, Model model) {
		System.out.println(paramVO.getGroundNo());
		GroundVO groundVO = groundService.groundDetail(paramVO);
		model.addAttribute("groundVO", groundVO);
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
		System.out.println(tags[0]+","+tags[1]);
		System.out.println("controller 1");
		groundService.applyGround(groundVO, sidoVO, sigunguVO, hobbyVO, hobbyCategoryVO);		
		System.out.println("controller 2");
		groundService.groundHashtag(tags,groundVO);
		/////////////////////////////////////////////////////////////////
		//String uploadPath=request.getSession().getServletContext().getRealPath("/resources/uploadImage/");
				String uploadPath = System.getProperty("user.home")+"\\git\\INSSAGROUND\\inssaground\\src\\main\\webapp\\resources\\uploadImage\\";
				File uploadDir=new File(uploadPath);
				if(uploadDir.exists()==false)
					uploadDir.mkdirs();
				MultipartFile file=picture;//파일 
				System.out.println(file+"<==");
				//System.out.println(file.isEmpty()); // 업로드할 파일이 있는 지 확인 
				if(file!=null&&file.isEmpty()==false){
					System.out.println("파일명:"+file.getOriginalFilename());
					File uploadFile=new File(uploadPath+file.getOriginalFilename());
					try {
						file.transferTo(uploadFile);//실제 디렉토리로 파일을 저장한다 
						System.out.println(uploadPath+file.getOriginalFilename()+" 파일업로드");
						GroundImgVO givo = new GroundImgVO();
						givo.setImgName(file.getOriginalFilename());
						groundVO.setGroundImgVO(givo);
						groundService.registergroundImg(groundVO);
					} catch (IllegalStateException | IOException e) {				
						e.printStackTrace();
					}
				}		
		
		return "redirect:home.do";
	}
	
	@RequestMapping("groundMasterPage.do")
	public String groundMasterPage() {
		return "ground/home/ground-master-page.tiles";
	}
	
	@RequestMapping("groundMasterReadyList.do")
	public String groundMasterReadyList(HttpSession session,Model model) {
		String groundNo = ((GroundVO)session.getAttribute("ground")).getGroundNo();	//세션에 저장된 모임번호 가져오기
		List<MemberVO> readyList = groundService.getParticipationReadyList(groundNo);
	/*	System.out.println(groundNo);
		System.out.println(readyList);*/
		model.addAttribute("readyList",readyList);
		return "ground/home/ground-master-ready-list.tiles";
	}
	@PostMapping("approveParticipation.do")
	public String approveParticipation(InsiderVO insiderVO) {
		System.out.println("groundNo:"+insiderVO.getGroundNo()+",idididid"+insiderVO.getMemberVO().getId());
		groundService.approveParticipation(insiderVO);
		
		return "home.tiles";
	}
	
	@RequestMapping("ground-home.do")
	public String groundHome(GroundVO groundVO,Model model,HttpSession session) {
		System.out.println("ground-home: "+groundVO.getGroundNo());
		GroundVO gvo = groundService.findGroundByGroundNo(groundVO);		
		System.out.println(gvo);
		session.setAttribute("ground",gvo);
		model.addAttribute("gvo",gvo);
		return "ground/home/ground-home.tiles";
	}
	
	@RequestMapping("groundPost.do")
	public String groundPost() {
		return "ground/home/ground-board.tiles";
	}
	
	@RequestMapping("groundScheduleForm.do")
	public String groundScheduleForm(String groundNo) {
		System.out.println(groundNo);
		return "ground/home/ground-schedule-form.tiles";
	}
	@Secured("ROLE_MEMBER")
	@PostMapping("registergroundschedule.do")
	public String registergroundschedule(ScheduleVO scheduleVO,GroundVO groundVO,InsiderVO insiderVO,HttpSession session) {
		System.out.println("1. "+scheduleVO);
		System.out.println("2. "+groundVO);
		System.out.println("3. "+insiderVO);
		MemberVO mvo= (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); //세션에서 정보받아옴
		System.out.println("**1");
		GroundVO gvo = (GroundVO)session.getAttribute("ground");
		System.out.println("**2");
		insiderVO.setMemberVO(mvo);
		System.out.println("**3");
		groundVO.setGroundNo(gvo.getGroundNo());
		System.out.println("**4");
		scheduleVO.setInsiderVO(insiderVO);
		System.out.println("**5");
		scheduleVO.setGroundVO(groundVO);
		System.out.println("**6");
		System.out.println(scheduleVO);
		groundService.registergroundschedule(scheduleVO);
		System.out.println("**7");
		return "redirect:groundScheduleList.do";
	}
	
	@RequestMapping("groundScheduleList.do")
	public String groundScheduleList(HttpSession session,Model model,String pageNo) {		
		GroundVO groundVO = (GroundVO)session.getAttribute("ground");
		System.out.println("controller1");
		System.out.println("controller2");
		ListVO<ScheduleVO> listVO = groundService.groundSchedulePagingBean(groundVO, pageNo);	
		System.out.println("controller3");
		System.out.println(listVO);
		System.out.println("controller4");		
		model.addAttribute("sList",listVO);
		return "ground/home/ground-schedule-list.tiles";
	}
	
	@RequestMapping("groundScheduleDetail.do")
	public String groundScheduleDetail(String scheduleNo,Model model) {
		System.out.println(scheduleNo);
		ScheduleVO scheduleVO = new ScheduleVO();
		scheduleVO.setScheduleNo(scheduleNo);
		model.addAttribute("scheduleDetail",groundService.findGroundScheduleByScheduleNo(scheduleVO));		
		return "ground/home/ground-schedule-detail.tiles";
	}
}
