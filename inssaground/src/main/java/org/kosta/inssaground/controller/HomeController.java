package org.kosta.inssaground.controller;

import javax.annotation.Resource;

import org.kosta.inssaground.model.service.GameService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController { 
	@Resource
	GameService gameService;
	
	@RequestMapping("home.do")
	public String home(Model model) {
		//System.out.println("추천별 게임 확인:" +  gameService.getCustomGameOrderByRecommendation());
		//model.addAttribute("pcoList",gameService.getCustomGameOrderByRecommendation());
		return "home.tiles";
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
