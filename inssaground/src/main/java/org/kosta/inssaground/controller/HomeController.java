package org.kosta.inssaground.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController { 
	@RequestMapping("home.do")
	public String home() {
		return "home.tiles";
	}
	@RequestMapping("aboutus.do")
	public String aboutUs() {
		return "home/aboutus.tiles";
	}
	@RequestMapping("service.do")
	public String ourservice() {
		return "home/our-service.tiles";
	}
	@RequestMapping("team.do")
	public String ourTeam() {
		return "home/team.tiles";
	}
}
