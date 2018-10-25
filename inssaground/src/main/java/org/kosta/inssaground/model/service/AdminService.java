package org.kosta.inssaground.model.service;

import org.kosta.inssaground.model.vo.EmailVO;
import org.kosta.inssaground.model.vo.GroundVO;
import org.kosta.inssaground.model.vo.ListVO;
import org.kosta.inssaground.model.vo.ReportVO;


public interface AdminService {
	/**
	 * 모임 개설 신청 리스트
	 * @param pageNo
	 * @return
	 */
	public ListVO<GroundVO> applyGroundList(String pageNo);
	/**
	 * 모임 정보를 가져온다
	 * @param groundNo
	 * @return
	 */
	public GroundVO getGroundDetail(String groundNo);
	/**
	 * 모임 신청 승낙
	 * @param groundNo
	 * @param masterId
	 */
	public void permitGround(String groundNo,String masterId);
	/**
	 * 모임 신청 거절
	 * @param groundNo
	 */
	public void rejectGround(String groundNo);
	/**
	 * 신고 리스트 가져오기
	 * @param pageNo
	 * @return
	 */
	public ListVO<ReportVO> getReportList(String pageNo);
	/**
	 * 신고 정보를 가져온다
	 * @param reportNo
	 * @return
	 */
	public ReportVO getReportDetail(String reportNo);
	/**
	 * 신고에 대한 답변을 이메일로 보내준다
	 * @param email
	 * @param reportNo
	 */
	public void reportAnswer(EmailVO email,String reportNo);
}
