package org.kosta.inssaground.controller;

import javax.annotation.Resource;

import org.kosta.inssaground.model.service.GameService;
import org.kosta.inssaground.model.service.GroundService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController { 
	@Resource
	private GameService gameService;
	@Resource
	private GroundService groundService;
	
	@RequestMapping("home.do")
	public String home(Model model) {
		//System.out.println("추천별 게임 확인:" +  gameService.getCustomGameOrderByRecommendation());
		//model.addAttribute("pcoList",gameService.getCustomGameOrderByRecommendation());
		model.addAttribute("groundList",groundService.getHotGroundList());
		
		return "home.tiles";
	}
	
	@RequestMapping("shome.do")
	public String shome(Model model,String groundNo) {
		//System.out.println("추천별 게임 확인:" +  gameService.getCustomGameOrderByRecommendation());
		//model.addAttribute("pcoList",gameService.getCustomGameOrderByRecommendation());
		model.addAttribute("groundList",groundService.getHotGroundList());
		model.addAttribute("groundNo",groundNo);
		return "shome.tiles";
	}
	
	
	@RequestMapping("aboutus.do")
	public String aboutUs() {
		return "home/aboutus.tiles";
	}
	@RequestMapping("service.do")
	public String ourservice() {
		return "home/our-service.tiles";
	}
	@RequestMapping("team.do")
	public String ourTeam() {
		return "home/team.tiles";
	}
	@RequestMapping("accessDeniedView.do")
	public String accessDeniedView() {
		return "home/accessDeniedView";
	}
}
