package org.kosta.inssaground.controller;

import org.kosta.inssaground.model.service.HobbyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class HobbyController {
	@Autowired
	private HobbyService hobbyService;
}
