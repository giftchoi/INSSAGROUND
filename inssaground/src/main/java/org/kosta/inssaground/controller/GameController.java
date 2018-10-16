package org.kosta.inssaground.controller;

import javax.annotation.Resource;

import org.kosta.inssaground.model.service.GameService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GameController {
	@Resource
	private GameService gameService;
	
	@RequestMapping("gameHome.do")
	public String gameHome(Model model) {
		model.addAttribute("officialGameLvo",gameService.getOfficialGameList());
		return "game/game-home.tiles";
	}
	
	@RequestMapping("customGameDetail.do")
	public String customGameDetail() {
		return "game/detail.tiles";
	}
	@RequestMapping("customGameList.do")
	public ModelAndView customGameList(String pageNo) {
		return new ModelAndView("game/list","cvo",customGameList(pageNo));
	}
	@RequestMapping("officialGameDetail.do")
	public String officialGameDetail(Model model, String oGameNo) {
		System.out.println("게시글번호 확인:"+oGameNo);
		model.addAttribute("ogvo", gameService.getOfficialGameDetail(oGameNo));
		return "game/detail.tiles";
	}
	
	@RequestMapping("gameList.do")
	public ModelAndView gameList(String gameType, String pageNo) {
		if(gameType=="official")
			return new ModelAndView("game/list.tiles","officialGameLvo",gameService.getOfficialGameList(pageNo));
		else
			return new ModelAndView("game/list.tiles","officialGameLvo",gameService.getOfficialGameList(pageNo));
	}
	
}
