package org.kosta.inssaground.controller;

import javax.annotation.Resource;

import org.kosta.inssaground.model.service.GameService;
import org.kosta.inssaground.model.vo.OfficialGameVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GameProgramController {
	@Resource
	private GameService gameService;

	// 게임 프로그램
	@Secured("ROLE_MEMBER")
	@RequestMapping("makeGameProgramForm.do")
	public String makeGameProgramForm(Model model) {
		model.addAttribute("officialGameLvo", gameService.getOfficialGameList());
		return "game-program/make-form.tiles";
	}

	
	@Secured("ROLE_MEMBER")
	@PostMapping("registerGameProgram.do")
	public String registerGameProgram(Model model) {
		return "game-program/result.tiles";
	}
	

	@RequestMapping("resultGameProgramTest.do")
	public String resultGameProgramTest(Model model) {
		model.addAttribute("officialGameLvo", gameService.getOfficialGameList());
		return "game-program/result.tiles";
	}
	
	@RequestMapping("getLeftGameByGameNo.do")
	@ResponseBody
	public OfficialGameVO getLeftGameByGameNo(String oGameNo) {
		OfficialGameVO ovo = gameService.getOfficialGameDetail(oGameNo);
		return ovo;
	}
}
