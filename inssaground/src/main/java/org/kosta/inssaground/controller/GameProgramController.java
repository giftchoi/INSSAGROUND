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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		return gameService.getOfficialGameList(pageNo);
	}

	
	@Secured("ROLE_MEMBER")
	@PostMapping("registerGameProgram.do")
	public String registerGameProgram(Model model,
			String title, String detail, String gameNoList, String gameNameList) {
		//System.out.println(title);
		//System.out.println(detail);
		//System.out.println(gameNoList);
		//System.out.println(gameNameList);
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		gameProgramService.registerGameProgram(title, detail, gameNoList, mvo);
		
		return "redirect:resultGameProgram.do";
	}
	
	@Secured("ROLE_MEMBER")
	@RequestMapping("resultGameProgram.do")
	public String resultGameProgram(Model model) {
		model.addAttribute("officialGameLvo", gameService.getOfficialGameList());
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		List<GameProgramVO> myGameProgramList = gameProgramService.getGameProgramList(mvo);
		model.addAttribute("myGameProgramList", myGameProgramList);
		return "game-program/result.tiles";
	}
	
	@Secured("ROLE_MEMBER")
	@RequestMapping("getLeftGameByGameNo.do")
	@ResponseBody
	public OfficialGameVO getLeftGameByGameNo(String oGameNo) {
		return gameService.getOfficialGameDetail(oGameNo);
	}
	
	@Secured("ROLE_MEMBER")
	@RequestMapping("getGameProgramDetail.do")
	@ResponseBody
	public List<GameProgramListVO> getGameProgramDetail(String programNo){
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		GameProgramVO gameProgramVO = new GameProgramVO(programNo, null, null, memberVO.getId(), null);
		List<GameProgramListVO> gpList = gameProgramService.getGameProgramDetail(gameProgramVO);
		System.out.println("게임리스트확인:"+gpList);
		return gpList;
	}
	@Secured("ROLE_MEMBER")
	@PostMapping("deleteGameProgram.do")
	public String deleteGameProgram(Model model, String deletePno) {
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("프로그램 삭제:GameProgram-pno"+deletePno);
		gameProgramService.deleteGameProgram(deletePno, mvo.getId());
		return "redirect:resultGameProgram.do";
	}
	@Secured("ROLE_MEMBER")
	@PostMapping("updateGameProgram.do")
	@Transactional
	public String updateGameProgram(Model model,
			String title, String detail, String gameNoList, String gameNameList, String programNo) {
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		gameProgramService.updateGameProgram(title, detail, gameNoList, mvo, programNo);
		return "redirect:resultGameProgram.do";
	}
	
}
