package org.kosta.inssaground.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.kosta.inssaground.model.service.MemberService;
import org.kosta.inssaground.model.vo.ListVO;
import org.kosta.inssaground.model.vo.MemberVO;
import org.kosta.inssaground.model.vo.ReportVO;
import org.kosta.inssaground.model.vo.ScheduleVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("loginForm.do")
	public String loginForm() {
		return "member/login.tiles";
	}
	
	@RequestMapping("registerForm.do")
	public String joinForm() {
		return "member/register-form.tiles";
	}
	@PostMapping("registerMember.do")
	public String registerMember(MemberVO mvo,MultipartFile picture) {
		try {
			memberService.registerMember(mvo,picture);
		} catch (IllegalStateException | IOException e) {
			return "member/find_fail";
		}
		return "member/register-result.tiles";
	}
	@RequestMapping("login_fail.do")
	public String loginFail() {
		return "member/login_fail";
	}
	@RequestMapping("idcheckAjax.do")
	@ResponseBody
	public String idcheckAjax(String id) {
		return memberService.idcheck(id);
	}
	@RequestMapping("sendEmailAjax.do")
	@ResponseBody
	public void sendEmailAjax(String email) {
		memberService.sendEmailForRegister(email);
	}
	@RequestMapping("checkEmailKey.do")
	@ResponseBody
	public String checkEmailKey(String email, String inputKey) {
		return memberService.checkEmailKey(email, inputKey);
	}
	@RequestMapping("findIdForm.do")
	public String findIdForm() {
		return "member/findId-form.tiles";
	}
	@RequestMapping("findPasswordForm.do")
	public String findPasswordForm() {
		return "member/findpassword-form.tiles";
	}
	@PostMapping("findMemberId.do")
	public String findMemberId(Model model,MemberVO vo) {
		List<String> idList=memberService.findMemberId(vo);
		model.addAttribute("idList",idList);
		return "member/findId-result.tiles";
	}
	@PostMapping("findPassword.do")
	public String findPasswordForm(Model model,String id) {
		try {
			memberService.findPassword(id);
		} catch (Exception e) {
			return "member/find_fail";
		}
		return "member/findpassword-result.tiles";
	}
/*	@Secured("ROLE_MEMBER")
	@RequestMapping("mypage.do")
	public String mypage() {
		return "member/mypage.tiles";
	}*/
	@RequestMapping("viewMemberInfo.do")
	public String viewMemberInfo(Model model) {
		MemberVO mvo= (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("member", mvo);
		return "member/view-member-info.tiles";
	}
	@Secured("ROLE_MEMBER")
	@RequestMapping("modifyMemberForm.do")
	public String modifyMemberForm(Model model) {
		MemberVO mvo= (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("member", mvo);
		return "member/modify-member-form.tiles";
	}
	@Transactional
	@PostMapping("modifyMember.do")
	public String modifyMember(MemberVO newVO) {
		MemberVO vo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setPassword(newVO.getPassword());
		vo.setName(newVO.getName());
		memberService.updateMember(vo);
		return "redirect:viewMemberInfo.do";
	}
	
	@Secured("ROLE_MEMBER")
	@RequestMapping("withdrawForm.do")
	public String withdrawForm() {
		return "member/withdraw";
	}
	@Secured("ROLE_MEMBER")
	@RequestMapping("withdraw.do")
	public String withdraw() {
		MemberVO mvo= (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		memberService.withdrawMember(mvo);
		return "member/link-logout";
	}
	@Secured("ROLE_MEMBER")
	@RequestMapping("myGround.do")
	public String myGroundList(Model model) {
		MemberVO mvo= (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<Map<String, String>> myGroundList = memberService.myGroundList(mvo.getId());
		model.addAttribute("myGround", myGroundList);
		return "member/mypage.tiles";
	}
	@Secured("ROLE_MEMBER")
	@RequestMapping("reportForm.do")
	public String reportForm(Model model) {
		MemberVO mvo= (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<Map<String, String>> myGroundList = memberService.myGroundList(mvo.getId()); 
		model.addAttribute("groundList", myGroundList);
		return "home/report-form.tiles";
	}
	@Secured("ROLE_MEMBER")
	@PostMapping("reportGround.do")
	public String reportGround(ReportVO reportVO) {
		MemberVO mvo= (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		reportVO.setId(mvo.getId());
		memberService.reportGround(reportVO);
		return "home/report-result";
	}
	@Secured("ROLE_MEMBER")
	@RequestMapping("mySchedule.do")
	public String mySchedule(String  pageNo,Model model) {
		MemberVO mvo= (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		ListVO<ScheduleVO> myScheduleList = memberService.myScheduleList(mvo.getId(),pageNo);
		System.out.println(myScheduleList);
		model.addAttribute("myScheduleList",myScheduleList);
		return "member/mySchedule-list.tiles";
	}
}
