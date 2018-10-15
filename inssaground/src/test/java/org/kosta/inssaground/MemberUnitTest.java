package org.kosta.inssaground;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.inssaground.model.mapper.GroundMapper;
import org.kosta.inssaground.model.mapper.HobbyMapper;
import org.kosta.inssaground.model.vo.HobbyVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class MemberUnitTest {
	@Resource
	private GroundMapper gm;
	@Resource
	private HobbyMapper hm;
	@Test
	public void test() {
		//List<SidoVO> sidoList = gm.getAllSido();
		//System.out.println(sidoList);
		//List<HobbyVO> list = hm.getAllHobby();
		//list.get(1).getName()
		//List<SigunguVO> list = gm.getSigungu();
		//System.out.println(list);
		//List<HobbyCategoryVO> list = hm.getHobbyCategory();
		//System.out.println(list);
		List<HobbyVO> hvo = hm.findHobbyByHobbyCategoryNo("1");
		System.out.println(hvo);
	}

}
