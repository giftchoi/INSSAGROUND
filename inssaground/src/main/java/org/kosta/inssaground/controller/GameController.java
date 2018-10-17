package org.kosta.inssaground.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.kosta.inssaground.model.service.GameService;
import org.kosta.inssaground.model.vo.CustomGameVO;
import org.kosta.inssaground.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class GameController {
	@Resource
	private GameService gameService;
	
	
	@RequestMapping("gameHome.do")
	public String gameHome(Model model) {
		model.addAttribute("officialGameLvo",gameService.getOfficialGameList());
		return "game/game-home.tiles";
	}
	
	@RequestMapping("gameCustom.do")
	public String gameCustom(Model model, String gameType) {
		model.addAttribute("gameType", "custom");
		model.addAttribute("customGameLvo",gameService.getCustomGameList());
		return "game/game-home.tiles";
	}


	@RequestMapping("customGameWriteForm.do")
	public String writeForm() {
		return "game/write-form.tiles";
	}
	
	//공식게임----------------------------------------
	@RequestMapping("officialGameList.do")
	public String officialGameList(Model model, String gameType, String pageNo) {
		model.addAttribute("gameType", "official");
		model.addAttribute("officialGameLvo",gameService.getOfficialGameList(pageNo));
		return "game/game-home.tiles";
	}
	
	@RequestMapping("officialGameDetail.do")
	public String officialGameDetail(Model model, String oGameNo) {
		System.out.println("공식게임 게시글번호 확인:"+oGameNo);
		model.addAttribute("gvo", gameService.getOfficialGameDetail(oGameNo));
		return "game/detail.tiles";
	}
	//----------------------------------------

	//사용자 정의 게임----------------------------------------
	@RequestMapping("customGameList.do")
	public String customGameList(Model model, String gameType, String pageNo) {
		model.addAttribute("gameType", "custom");
		model.addAttribute("officialGameLvo",gameService.getOfficialGameList(pageNo));
		return "game/game-home.tiles";
	}
	
	@RequestMapping("customGameDetail.do")
	public String customGameDetail(Model model, String cGameNo) {
		System.out.println("사용자 게임 게시글번호 확인:"+cGameNo);
		model.addAttribute("gvo", gameService.getCustomGameDetail(cGameNo));
		return "game/detail.tiles";
	}
	
	@PostMapping("writeCustomGame.do")
	public String writeCustomGame(HttpSession session,CustomGameVO customGameVO
			,RedirectAttributes redirectAttributes) {
		MemberVO mvo=(MemberVO)session.getAttribute("mvo");
		if(mvo!=null) {
			customGameVO.setMemberVO(mvo);
		}
		gameService.writeGame(customGameVO);
		redirectAttributes.addAttribute("c_game_no",+Integer.parseInt(customGameVO.getcGameNo()));
		return "redirect:customGame-detail.do";
	}
	//----------------------------------------
}
