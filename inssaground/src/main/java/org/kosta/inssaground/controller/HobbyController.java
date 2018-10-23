package org.kosta.inssaground.controller;

import java.util.List;
import java.util.Map;

import org.kosta.inssaground.model.service.HobbyService;
import org.kosta.inssaground.model.vo.FeatureVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String findHobbyResult(String ffList, Model model) {
		System.out.println("*********************"+ffList);
		String[] feature = ffList.split(",");
		List<Map> fvo = hobbyService.getFList(feature);
		System.out.println(fvo);
		//List<String> resultHobbyNameList = null;
		String[] hobbyNo = new String[fvo.size()];
		for(int i=0; i<fvo.size(); i++) {
			hobbyNo[i] = String.valueOf(fvo.get(i).get("HOBBY_NO"));
			
			//갖고온 맵의 번호를 가져옴
			//Service단에서 그 번호에 해당하는 게임특징이름을 들고옴
			//그 특징을 resultHobbyNameList에 넣으면 된다!
		}		
		//hobbyService.getFListNameByResultNo(hobbyNo.get);
		List<Map> hobbyList = hobbyService.getFListNameByResultNo(hobbyNo);		
		
		model.addAttribute("fvo",fvo);
		model.addAttribute("hobby", hobbyList);
		return "hobby/find-hobby-result.tiles";
	}
	
}
