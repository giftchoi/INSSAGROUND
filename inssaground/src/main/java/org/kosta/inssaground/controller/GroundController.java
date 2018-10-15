package org.kosta.inssaground.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.inssaground.model.service.GroundService;
import org.kosta.inssaground.model.service.HobbyService;
import org.kosta.inssaground.model.service.PagingBean;
import org.kosta.inssaground.model.vo.GroundVO;
import org.kosta.inssaground.model.vo.HobbyVO;
import org.kosta.inssaground.model.vo.ListVO;
import org.kosta.inssaground.model.vo.SigunguVO;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GroundController {
	@Resource
	private GroundService groundService;
	@Resource
	private HobbyService hobbyService;
	
	@RequestMapping("groundList.do")
	public String groundList(Model model) {
		//ListVO<GroundVO> groundList = groundService.searchGround(null);	// no search condition. getAllList()
		int totalCount= groundService.getGroundSearchResultCount(null);
		System.out.println("totalCount:"+totalCount);
		ListVO<GroundVO> listVO = groundService.searchGroundTest(new PagingBean(totalCount),null);
		model.addAttribute("listVO",listVO);
		return "ground/ground-list.tiles";
	}
	@RequestMapping("groundApplyForm.do")
	public String groundApplyForm(Model model) {
		model.addAttribute("sido",groundService.getAllSido());
		model.addAttribute("hobbyCategory",hobbyService.getHobbyCategory());
		return "ground/ground-apply-form.tiles";
	}
	
	@RequestMapping("groundDetail.do")
	public String groundDetail(GroundVO paramVO,Model model) {
		System.out.println(paramVO.getGroundNo());
		GroundVO groundVO = groundService.groundDetail(paramVO);
		model.addAttribute("groundVO",groundVO);
		return "ground/ground-detail";
	}
	@ResponseBody
	@RequestMapping("getSigungu.do")
	public List<SigunguVO> getSigungu(String sido){
		return groundService.getSigungu();
	}
	
	@ResponseBody
	@RequestMapping("findHobbyByHobbyCategoryNo.do")
	public List<HobbyVO> findHobbyByHobbyCategoryNo(String hobbyCategoryNo){	
		return hobbyService.findHobbyByHobbyCategoryNo(hobbyCategoryNo);

	}
}
