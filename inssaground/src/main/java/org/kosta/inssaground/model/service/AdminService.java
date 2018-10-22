package org.kosta.inssaground.model.service;

import java.util.List;

import org.kosta.inssaground.model.vo.EmailVO;
import org.kosta.inssaground.model.vo.GroundVO;
import org.kosta.inssaground.model.vo.ListVO;
import org.kosta.inssaground.model.vo.ReportVO;
import org.springframework.stereotype.Service;


public interface AdminService {
	public ListVO<GroundVO> applyGroundList(String pageNo);

	public GroundVO getGroundDetail(String groundNo);

	public void permitGround(String groundNo,String masterId);

	public void rejectGround(String groundNo);

	public ListVO<ReportVO> getReportList(String pageNo);

	public ReportVO getReportDetail(String reportNo);

	public void reportAnswer(EmailVO email,String reportNo);
}
