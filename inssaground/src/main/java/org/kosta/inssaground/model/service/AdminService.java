package org.kosta.inssaground.model.service;

import java.util.List;

import org.kosta.inssaground.model.vo.GroundVO;
import org.kosta.inssaground.model.vo.ReportVO;

public interface AdminService {
	public List<GroundVO> applyGroundList();
	public GroundVO getGroundDetail(String groundNo);
	public void permitGround(String groundNo);
	public void rejectGround(String groundNo);
	public List<ReportVO> getReportList();
	public ReportVO getReportDetail(String reportNo);
}
