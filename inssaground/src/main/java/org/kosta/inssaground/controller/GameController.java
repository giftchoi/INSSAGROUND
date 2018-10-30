package org.kosta.inssaground.controller;

import java.util.HashMap;

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
		model.addAttribute("filter", "ALL");
		model.addAttribute("officialGameLvo", gameService.getOfficialGameList());
		return "game/game-home.tiles";
	}

	@RequestMapping("officialGameList.do")
	public String officialGameList(Model model, String gameType, String pageNo) {
		model.addAttribute("gameType", "official");
		model.addAttribute("filter", "ALL");
		model.addAttribute("officialGameLvo", gameService.getOfficialGameList(pageNo, "ALL"));
		return "game/game-home.tiles";
	}
	@RequestMapping("smallOfficialGameList.do")
	public String smallOfficialGameList(Model model, String gameType, String pageNo) {
		model.addAttribute("gameType", "official");
		model.addAttribute("filter", "SMALL");
		model.addAttribute("officialGameLvo", gameService.getOfficialGameList(pageNo, "SMALL"));
		return "game/game-home.tiles";
	}
	@RequestMapping("largeOfficialGameList.do")
	public String largeOfficialGameList(Model model, String gameType, String pageNo) {
		model.addAttribute("gameType", "official");
		model.addAttribute("filter", "LARGE");
		model.addAttribute("officialGameLvo", gameService.getOfficialGameList(pageNo, "LARGE"));
		return "game/game-home.tiles";
	}
	@RequestMapping("insideOfficialGameList.do")
	public String insideOfficialGameList(Model model, String gameType, String pageNo) {
		model.addAttribute("gameType", "official");
		model.addAttribute("filter", "INSIDE");
		model.addAttribute("officialGameLvo", gameService.getOfficialGameList(pageNo, "INSIDE"));
		return "game/game-home.tiles";
	}
	@RequestMapping("outsideOfficialGameList.do")
	public String outsideOfficialGameList(Model model, String gameType, String pageNo) {
		model.addAttribute("gameType", "official");
		model.addAttribute("filter", "OUTSIDE");
		model.addAttribute("officialGameLvo", gameService.getOfficialGameList(pageNo, "OUTSIDE"));
		return "game/game-home.tiles";
	}
	
	@Secured("ROLE_MEMBER")
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
		return "game/write-official-form.tiles";
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
		redirectAttributes.addAttribute("oGameNo", Integer.parseInt(officialGameVO.getoGameNo()));
		return "redirect:officialGameDetail.do";
	}

	@Secured("ROLE_ADMIN")
	@PostMapping("deleteOfficialGame.do")
	public String deleteOfficialGame(Model model, String oGameNo) {
		gameService.deleteOfficialGame(oGameNo);
		return "redirect:gameHome.do";
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping("officialGameUpdateForm.do")
	public String officialGameUpdateForm(Model model, String oGameNo) {
		OfficialGameVO ovo = gameService.getOfficialGameDetail(oGameNo);
		// System.out.println(ovo);
		model.addAttribute("officialGameVO", ovo);
		return "game/update-official-form.tiles";
	}

	@Secured("ROLE_ADMIN")
	@PostMapping("updateOfficialGame.do")
	public String updateOfficialGame(Model model, OfficialGameVO officialGameVO,
			RedirectAttributes redirectAttributes) {
		gameService.updateGame(officialGameVO);
		System.out.println("수정글 확인: " + officialGameVO);
		redirectAttributes.addAttribute("oGameNo", Integer.parseInt(officialGameVO.getoGameNo()));
		return "redirect:officialGameDetail.do";
	}

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

	@Secured("ROLE_MEMBER")
	@RequestMapping("customGameDetail.do")
	public String customGameDetail(Model model, String cGameNo) {
		System.out.println("사용자 게임 게시글번호 확인:" + cGameNo);
		model.addAttribute("gameType", "custom");
		model.addAttribute("gvo", gameService.getCustomGameDetail(cGameNo));
		model.addAttribute("count", gameService.selectCountIdBycGameNo(cGameNo));
		return "game/detail.tiles";
	}

	@Secured("ROLE_MEMBER")
	@RequestMapping("customGameWriteForm.do")
	public String customGameWriteForm(Model model) {
		model.addAttribute("gameType", "custom");
		return "game/write-custom-form.tiles";
	}

	@Secured("ROLE_MEMBER")
	@PostMapping("writeCustomGame.do")
	public String writeCustomGame(Model model, MemberVO memberVO, CustomGameVO customGameVO,
			RedirectAttributes redirectAttributes) {
		model.addAttribute("gameType", "custom");
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		customGameVO.setMemberVO(mvo);

		gameService.writeGame(customGameVO);
		System.out.println("작성글 확인" + customGameVO);
		redirectAttributes.addAttribute("cGameNo", Integer.parseInt(customGameVO.getcGameNo()));
		return "redirect:customGameDetail.do";
	}

	@Secured("ROLE_MEMBER")
	@PostMapping("deleteCustomGame.do")
	public String deleteCustomGame(Model model, String cGameNo) {
		gameService.deleteCustomGame(cGameNo);
		return "redirect:gameCustom.do";
	}

	@Secured("ROLE_MEMBER")
	@RequestMapping("customGameUpdateForm.do")
	public String customGameUpdateForm(Model model, String cGameNo) {
		CustomGameVO cvo = gameService.getCustomGameDetail(cGameNo);
		model.addAttribute("customGameVO", cvo);
		return "game/update-custom-form.tiles";
	}

	@Secured("ROLE_MEMBER")
	@PostMapping("updateCustomGame.do")
	public String updateCustomGame(Model model, CustomGameVO customGameVO, RedirectAttributes redirectAttributes) {
		gameService.updateGame(customGameVO);
		System.out.println("수정글 확인:" + customGameVO);
		redirectAttributes.addAttribute("cGameNo", Integer.parseInt(customGameVO.getcGameNo()));
		return "redirect:customGameDetail.do";
	}

	@Secured("ROLE_MEMBER")
	@PostMapping("insertRecommendation.do")
	public String insertRecommendation(Model model, String cGameNo, RedirectAttributes redirectAttributes) {
		HashMap<String, String> map = new HashMap<String, String>();
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		map.put("C_GAME_NO", cGameNo);
		map.put("ID", mvo.getId());
		gameService.insertRecommendation(map);
		gameService.selectCountIdBycGameNo(cGameNo);
		int count = gameService.selectCountIdBycGameNo(cGameNo);
		// model.addAttribute("count",count);
		System.out.println("추천수 증가 확인" + gameService.getCustomGameDetail(cGameNo).getRecommendation());
		redirectAttributes.addAttribute("cGameNo", cGameNo);
		redirectAttributes.addAttribute("count", count);
		return "redirect:customGameDetail.do";
	}
	@Secured("ROLE_ADMIN")
	@RequestMapping("upgradeCustomGameForm.do")
	public String upgradeCustomGameForm(Model model) {
		model.addAttribute("uco",gameService.getCustomGameOrderByRecommendation());		
		return "game/upgrade-custom-form.tiles";
	}
	@Secured("ROLE_ADMIN")
	@RequestMapping("upgradeCustomGame.do")
	public String moveCustomGameToOfficialGame(Model model,String cGameNo) {
		System.out.println(cGameNo);
		gameService.moveCustomGameToOfficialGame(cGameNo);
		return "redirect:upgradeCustomGameForm.do";
	}
	// ----------------------------------------
}
