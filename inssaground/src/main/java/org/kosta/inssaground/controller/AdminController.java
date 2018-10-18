package org.kosta.inssaground.controller;

import org.kosta.inssaground.model.service.AdminService;
import org.kosta.inssaground.model.vo.GroundVO;
import org.kosta.inssaground.model.vo.ListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	/* @Secure 어노테이션을 이용해 권한이 부여된 대상들만 서비스를 제공받도록 설정한다 
	 * 관리자만 들어가야 할 경우 
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("adminMain.do")
	public String adminMain() {
		System.out.println("adminMain");
		return "admin/main.tiles";
	}
	@Secured("ROLE_ADMIN")
	@RequestMapping("readyApplyGround.do")
	public String getReadyApplyGround(Model model,String pageNo) {
		ListVO<GroundVO> gList=adminService.applyGroundList(pageNo);
		model.addAttribute("groundList", gList);
		return "admin/apply-ground-list.tiles";
	}
}
