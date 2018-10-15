package org.kosta.inssaground.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GameController {
	
	@RequestMapping("gameHome.do")
	public String gameHome() {
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
}
