package org.kosta.inssaground.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.inssaground.model.service.GroundService;
import org.kosta.inssaground.model.service.HobbyService;
import org.kosta.inssaground.model.service.PagingBean;
import org.kosta.inssaground.model.vo.GroundVO;
import org.kosta.inssaground.model.vo.HobbyCategoryVO;
import org.kosta.inssaground.model.vo.HobbyVO;
import org.kosta.inssaground.model.vo.ListVO;
import org.kosta.inssaground.model.vo.SidoVO;
import org.kosta.inssaground.model.vo.SigunguVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GroundController {
	@Resource
	private GroundService groundService;
	@Resource
	private HobbyService hobbyService;

	
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
		model.addAttribute("groundVO", groundVO);
		return "ground/ground-detail";
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
			HobbyCategoryVO hobbyCategoryVO) {
		String tags[] = request.getParameterValues("hashtag");
		System.out.println(tags[0]+","+tags[1]);
		System.out.println("controller 1");
		groundService.applyGround(groundVO, sidoVO, sigunguVO, hobbyVO, hobbyCategoryVO);		
		System.out.println("controller 2");
		groundService.groundHashtag(tags,groundVO);
		return "redirect:home.do";
	}
}
