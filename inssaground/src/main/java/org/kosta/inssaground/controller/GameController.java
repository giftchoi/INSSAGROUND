package org.kosta.inssaground.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
