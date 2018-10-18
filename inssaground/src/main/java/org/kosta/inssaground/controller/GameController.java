package org.kosta.inssaground.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.inssaground.model.service.GameService;
import org.kosta.inssaground.model.vo.CustomGameVO;
import org.kosta.inssaground.model.vo.MemberVO;
import org.kosta.inssaground.model.vo.OfficialGameVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class GameController {
	@Resource
	private GameService gameService;

	// 공식게임----------------------------------------
	@RequestMapping("gameHome.do")
	public String gameHome(Model model) {
		model.addAttribute("officialGameLvo", gameService.getOfficialGameList());
		return "game/game-home.tiles";
	}

	@RequestMapping("officialGameList.do")
	public String officialGameList(Model model, String gameType, String pageNo) {
		model.addAttribute("gameType", "official");
		model.addAttribute("officialGameLvo", gameService.getOfficialGameList(pageNo));
		return "game/game-home.tiles";
	}

	@Secured({ "ROLE_ADMIN", "ROLE_MEMBER" })
	@RequestMapping("officialGameDetail.do")
	public String officialGameDetail(Model model, String oGameNo) {
		model.addAttribute("gameType", "official");
		System.out.println("공식게임 게시글번호 확인:" + oGameNo);
		model.addAttribute("gvo", gameService.getOfficialGameDetail(oGameNo));
		return "game/detail.tiles";
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping("officialGameWriteForm.do")
	public String officialGameWriteForm(Model model) {
		model.addAttribute("gameType", "official");
		return "game/write-form.tiles";
	}

	@Secured("ROLE_ADMIN")
	@PostMapping("writeOfficialGame.do")
	public String writeOfficialGame(Model model, HttpServletRequest request, OfficialGameVO officialGameVO,
			RedirectAttributes redirectAttributes) {
		model.addAttribute("gameType", "official");
		// MemberVO mvo = (MemberVO)
		// SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		gameService.writeGame(officialGameVO);
		System.out.println("작성글 확인" + officialGameVO);
		redirectAttributes.addAttribute("oGameNo", +Integer.parseInt(officialGameVO.getoGameNo()));
		return "redirect:officialGameDetail.do";
	}

	@Secured("ROLE_ADMIN")
	@PostMapping("deleteOfficialGame.do")
	public String deleteOfficialGame(Model model, String oGameNo) {
		gameService.deleteOfficialGame(oGameNo);
		return "redirect:gameHome.do";
	}
	// ----------------------------------------

	// 사용자 정의 게임----------------------------------------
	@RequestMapping("gameCustom.do")
	public String gameCustom(Model model, String gameType) {
		model.addAttribute("gameType", "custom");
		model.addAttribute("customGameLvo", gameService.getCustomGameList());
		return "game/game-home.tiles";
	}

	@RequestMapping("customGameList.do")
	public String customGameList(Model model, String gameType, String pageNo) {
		model.addAttribute("gameType", "custom");
		model.addAttribute("customGameLvo", gameService.getCustomGameList(pageNo));
		return "game/game-home.tiles";
	}

	@Secured({ "ROLE_ADMIN", "ROLE_MEMBER" })
	@RequestMapping("customGameDetail.do")
	public String customGameDetail(Model model, String cGameNo) {
		System.out.println("사용자 게임 게시글번호 확인:" + cGameNo);
		model.addAttribute("gameType", "custom");
		model.addAttribute("gvo", gameService.getCustomGameDetail(cGameNo));
		return "game/detail.tiles";
	}

	@Secured({ "ROLE_ADMIN", "ROLE_MEMBER" })
	@RequestMapping("customGameWriteForm.do")
	public String customGameWriteForm(Model model) {
		model.addAttribute("gameType", "custom");
		return "game/write-form.tiles";
	}

	@Secured({ "ROLE_ADMIN", "ROLE_MEMBER" })
	@PostMapping("writeCustomGame.do")
	public String writeCustomGame(Model model, MemberVO memberVO, CustomGameVO customGameVO,
			RedirectAttributes redirectAttributes) {
		model.addAttribute("gameType", "custom");
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		customGameVO.setMemberVO(mvo);

		gameService.writeGame(customGameVO);
		System.out.println("작성글 확인" + customGameVO);
		redirectAttributes.addAttribute("cGameNo", +Integer.parseInt(customGameVO.getcGameNo()));
		return "redirect:customGameDetail.do";
	}

	@Secured({ "ROLE_ADMIN", "ROLE_MEMBER" })
	@PostMapping("deleteCustomGame.do")
	public String deleteCustomGame(Model model, String cGameNo) {
		gameService.deleteCustomGame(cGameNo);
		return "redirect:gameCustom.do";
	}

	// ----------------------------------------
}
