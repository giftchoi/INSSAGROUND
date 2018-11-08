package org.kosta.inssaground.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.inssaground.model.service.GameProgramService;
import org.kosta.inssaground.model.service.GameService;
import org.kosta.inssaground.model.vo.GameProgramListVO;
import org.kosta.inssaground.model.vo.GameProgramVO;
import org.kosta.inssaground.model.vo.ListVO;
import org.kosta.inssaground.model.vo.MemberVO;
import org.kosta.inssaground.model.vo.OfficialGameVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class GameProgramController {
	@Resource
	private GameService gameService;
	@Resource
	private GameProgramService gameProgramService;

	// 게임 프로그램	
	@Secured("ROLE_MEMBER")
	@RequestMapping("myProgram.do")
	public String myProgram(Model model) {
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("gameProgramList", gameProgramService.getAllGameProgram(mvo.getId()));
		return "game-program/myProgram.tiles";
	}
	
	@Secured("ROLE_MEMBER")
	@RequestMapping("makeGameProgramForm.do")
	public String makeGameProgramForm(Model model) {
		model.addAttribute("officialGameLvo", gameService.getOfficialGameList());
		return "game-program/make-form.tiles";
	}
	
	@Secured("ROLE_MEMBER")
	@RequestMapping("makeGameProgramFormByPageNo.do")
	@ResponseBody
	public ListVO<OfficialGameVO> makeGameProgramFormByPageNo(Model model, String pageNo) {
		return gameService.getOfficialGameList(pageNo, "ALL");
	}
	
	@Secured("ROLE_MEMBER")
	@RequestMapping("gameProgramDetail.do")
	public String gameProgramDetail(Model model, int programNo) {
		model.addAttribute("officialGameLvo", gameService.getOfficialGameList());
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(programNo<-1) {
			programNo = 0;
		}
		
		List<GameProgramVO> myGameProgramList = gameProgramService.getGameProgramTitleList(mvo);
		model.addAttribute("myGameProgramList", myGameProgramList);
		/*
		GameProgramVO gameProgramVO = new GameProgramVO(String.valueOf(programNo), null, null, mvo.getId(), null);
		List<GameProgramListVO> gpList = gameProgramService.getGameProgramDetailByProgramNo(gameProgramVO);
		model.addAttribute("gpList", gpList);
		*/
		return "game-program/myProgramDetail.tiles";
	}

	
	@Secured("ROLE_MEMBER")
	@PostMapping("registerGameProgram.do")
	public String registerGameProgram(Model model,
			String title, String detail, String[] oGameNoArr, RedirectAttributes redirectAttributes) {

		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String programNo = gameProgramService.registerGameProgram(title, detail, oGameNoArr, mvo);
		redirectAttributes.addAttribute("programNo", programNo);
		return "redirect:gameProgramDetail.do";
	}
	
	@Secured("ROLE_MEMBER")
	@RequestMapping("editGameProgram.do")
	public String editGameProgram(Model model, String programNo) {
		model.addAttribute("officialGameLvo", gameService.getOfficialGameList());
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		/*
		List<GameProgramVO> myGameProgramTitleList = gameProgramService.getGameProgramTitleList(mvo);
		model.addAttribute("myGameProgramTitleList", myGameProgramTitleList);
		*/
		System.out.println("editGameProgram programNo:"+programNo);
		GameProgramVO gameProgramVO = new GameProgramVO(programNo, null, null, mvo.getId(), null);
		List<GameProgramListVO> gpList = gameProgramService.getGameProgramDetailByProgramNo(gameProgramVO);
		model.addAttribute("gpList", gpList);
		return "game-program/result.tiles";
	}
	
	@Secured("ROLE_MEMBER")
	@RequestMapping("getLeftGameByGameNo.do")
	@ResponseBody
	public OfficialGameVO getLeftGameByGameNo(String oGameNo) {
		return gameService.getOfficialGameDetail(oGameNo);
	}
	
	@Secured("ROLE_MEMBER")
	@RequestMapping("getGameProgramDetailByProgramNo.do")
	@ResponseBody
	public List<GameProgramListVO> getGameProgramDetailByProgramNo(String programNo){
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		GameProgramVO gameProgramVO = new GameProgramVO(programNo, null, null, memberVO.getId(), null);
		List<GameProgramListVO> gpList = gameProgramService.getGameProgramDetailByProgramNo(gameProgramVO);
		//System.out.println("게임리스트확인:"+gpList);
		return gpList;
	}
	@Secured("ROLE_MEMBER")
	@PostMapping("deleteGameProgram.do")
	public String deleteGameProgram(Model model, String deletePno, RedirectAttributes redirectAttributes) {
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("프로그램 삭제:GameProgram-pno:"+deletePno);
		gameProgramService.deleteGameProgram(deletePno, mvo.getId());
		redirectAttributes.addAttribute("programNo", "0");
		return "redirect:gameProgramDetail.do";
	}
	@Secured("ROLE_MEMBER")
	@PostMapping("updateGameProgram.do")
	public String updateGameProgram(Model model,
			String title, String detail, String[] oGameNoArr, String programNo, RedirectAttributes redirectAttributes) {
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		/*
		for(int i=0; i<oGameNoArr.length; i++) {
			System.out.print(oGameNoArr[i]+" ");
		}
		System.out.println("oGameNo 배열 확인");
		*/
		gameProgramService.updateGameProgram(title, detail, oGameNoArr, mvo, programNo);
		redirectAttributes.addAttribute("programNo", "0");
		return "redirect:gameProgramDetail.do";
	}
}
