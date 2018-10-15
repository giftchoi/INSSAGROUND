package org.kosta.inssaground.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.inssaground.model.service.GroundService;
import org.kosta.inssaground.model.vo.GroundVO;
import org.kosta.inssaground.model.vo.ListVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GroundController {
	@Resource
	private GroundService groundService;
	
	@RequestMapping("groundList.do")
	public String groundList(Model model) {
		//ListVO<GroundVO> groundList = groundService.searchGround(null);	// no search condition. getAllList()
		List<GroundVO> groundList = groundService.searchGroundTest(null);
		return "ground/ground-list.tiles";
	}
	
}
