package org.kosta.inssaground.controller;

import org.kosta.inssaground.model.service.MemberService;
import org.kosta.inssaground.model.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String registerMember(MemberVO mvo) {
		memberService.registerMember(mvo);
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
}
