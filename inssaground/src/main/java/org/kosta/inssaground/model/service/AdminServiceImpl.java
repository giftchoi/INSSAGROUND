package org.kosta.inssaground.model.service;

import java.util.List;

import org.kosta.inssaground.model.vo.GroundVO;
import org.kosta.inssaground.model.vo.ReportVO;
import org.springframework.stereotype.Service;
@Service
public class AdminServiceImpl implements AdminService {

	@Override
	public List<GroundVO> applyGroundList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public GroundVO getGroundDetail(String groundNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void permitGround(String groundNo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void rejectGround(String groundNo) {
		// TODO Auto-generated method stub

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
