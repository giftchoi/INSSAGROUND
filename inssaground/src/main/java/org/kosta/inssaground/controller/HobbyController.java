package org.kosta.inssaground.controller;

import java.util.List;

import org.kosta.inssaground.model.service.HobbyService;
import org.kosta.inssaground.model.vo.FeatureVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HobbyController {
	@Autowired
	private HobbyService hobbyService;
	
	@RequestMapping("findHobby.do")
	public String findHobby() {
		return "hobby/find-hobby.tiles";
	}
	
	@ResponseBody
	@RequestMapping("getFeatureList.do")
	public List<FeatureVO> getFeatureList(){
		return hobbyService.getHobbyFeatureAndHobbyFeatureNoList();
	}
	@RequestMapping("findHobbyResult.do")
	public String findHobbyResult() {
		return "hobby/find-hobby-result.tiles";
	}
}
