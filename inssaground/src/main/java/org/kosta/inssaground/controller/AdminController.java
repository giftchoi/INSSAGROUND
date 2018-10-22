package org.kosta.inssaground.controller;

import org.kosta.inssaground.model.service.AdminService;
import org.kosta.inssaground.model.vo.EmailVO;
import org.kosta.inssaground.model.vo.GroundVO;
import org.kosta.inssaground.model.vo.ListVO;
import org.kosta.inssaground.model.vo.ReportVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
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
	@Secured("ROLE_ADMIN")
	@RequestMapping("applyGroundDetail.do")
	public String applyGroundDetail(String groundNo,Model model) {
		GroundVO groundVO = adminService.getGroundDetail(groundNo);
		model.addAttribute("groundVO", groundVO);
		return "admin/apply-ground-detail.tiles";
	}
	@Secured("ROLE_ADMIN")
	@PostMapping("acceptGroundApply.do")
	public String acceptGroundApply(String groundNo,String master) {
		adminService.permitGround(groundNo,master);
		return "redirect:readyApplyGround.do";
	}
	@Secured("ROLE_ADMIN")
	@PostMapping("rejectGroundApply.do")
	public String rejectGroundApply(String groundNo) {
		adminService.rejectGround(groundNo);
		return "redirect:readyApplyGround.do";
	}
	@Secured("ROLE_ADMIN")
	@RequestMapping("reportList.do")
	public String reportList(Model model,String pageNo) {
		ListVO<ReportVO> reportList=adminService.getReportList(pageNo);
		model.addAttribute("reportList",reportList);
		return "admin/report-list.tiles";
	}
	@Secured("ROLE_ADMIN")
	@RequestMapping("reportDetail.do")
	public String reportDetail(Model model,String reportNo) {
		ReportVO report=adminService.getReportDetail(reportNo);
		model.addAttribute("report", report);
		return "admin/report-detail.tiles";
	}
	@Secured("ROLE_ADMIN")
	@PostMapping("reportAnswer.do")
	public String reportAnswer(EmailVO email,String reportNo) {
		adminService.reportAnswer(email,reportNo);
		return "redirect:reportList.do";
	}
}

