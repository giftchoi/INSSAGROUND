package org.kosta.inssaground.model.service;

import java.util.List;

import org.kosta.inssaground.model.mapper.CustomGameMapper;
import org.kosta.inssaground.model.mapper.GroundMapper;
import org.kosta.inssaground.model.mapper.HobbyMapper;
import org.kosta.inssaground.model.mapper.MemberMapper;
import org.kosta.inssaground.model.mapper.OfficialGameMapper;
import org.kosta.inssaground.model.vo.GroundVO;
import org.kosta.inssaground.model.vo.HobbyVO;
import org.kosta.inssaground.model.vo.ListVO;
import org.kosta.inssaground.model.vo.ReportVO;
import org.kosta.inssaground.model.vo.SigunguVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private GroundMapper groundMapper;
	@Autowired
	private HobbyMapper hobbyMapper;
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private OfficialGameMapper offGameMapper;
	@Autowired
	private CustomGameMapper cusGameMapper;
	@Override
	public ListVO<GroundVO> applyGroundList(String pageNo) {
		int totalCount=groundMapper.getTotalApplyGroundList();
		PagingBean pagingBean=null;
		if(pageNo==null) {
			pagingBean=new PagingBean(totalCount);
		}else {
			pagingBean=new PagingBean(totalCount,Integer.parseInt(pageNo));
		}
		return new ListVO<GroundVO>(pagingBean,groundMapper.getApplyGroundList(pagingBean));
	}

	@Override
	public GroundVO getGroundDetail(String groundNo) {
		GroundVO groundVO=groundMapper.findGroundByGroundNo(groundNo);
		SigunguVO sigungu=groundMapper.findSigunguBySigunguNo(groundVO.getSigunguVO().getSigunguNo());
		groundVO.setArea(sigungu.getSigunguName());
		HobbyVO hobby=hobbyMapper.findHobbyByHobbyNo(groundVO.getHobby());
		groundVO.setHobby(hobby.getName());
		groundVO.setTagList(groundMapper.getHashtagList(groundNo));
		return groundVO;
	}

	@Override
	public void permitGround(String groundNo) {
		groundMapper.permitGround(groundNo);
	}

	@Override
	public void rejectGround(String groundNo) {
		groundMapper.rejectGround(groundNo);
	}

	@Override
	public List<ReportVO> getReportList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ReportVO getReportDetail(String reportNo) {
		// TODO Auto-generated method stub
		return null;
	}

}
