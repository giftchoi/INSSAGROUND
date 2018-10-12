package org.kosta.inssaground.controller;

import org.kosta.inssaground.model.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("loginForm.do")
	public String loginForm() {
		
		return "member/login.tiles";
	}
}
