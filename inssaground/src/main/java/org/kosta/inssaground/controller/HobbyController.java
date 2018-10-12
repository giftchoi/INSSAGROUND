package org.kosta.inssaground.controller;

import org.kosta.inssaground.model.service.HobbyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HobbyController {
	@Autowired
	private HobbyService hobbyService;
	@RequestMapping("")
	public String groundList() {
		return "";
	}
}
