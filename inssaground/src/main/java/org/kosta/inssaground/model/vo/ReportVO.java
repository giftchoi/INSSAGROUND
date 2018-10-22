package org.kosta.inssaground.model.vo;

public class ReportVO {
	private String reportNo;
	private String title;
	private String content;
	private String timePosted;
	private String groundNo;
	private String id;
	private int status;
	public ReportVO() {
		super();
	}
	public ReportVO(String title, String content, String groundNo, String id) {
		super();
		this.title = title;
		this.content = content;
		this.groundNo = groundNo;
		this.id = id;
	}
	
	public ReportVO(String reportNo, String title, String content, String timePosted, String groundNo, String id,
			int status) {
		super();
		this.reportNo = reportNo;
		this.title = title;
		this.content = content;
		this.timePosted = timePosted;
		this.groundNo = groundNo;
		this.id = id;
		this.status = status;
	}
	public String getReportNo() {
		return reportNo;
	}
	public void setReportNo(String reportNo) {
		this.reportNo = reportNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTimePosted() {
		return timePosted;
	}
	public void setTimePosted(String timePosted) {
		this.timePosted = timePosted;
	}
	public String getGroundNo() {
		return groundNo;
	}
	public void setGroundNo(String groundNo) {
		this.groundNo = groundNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "ReportVO [reportNo=" + reportNo + ", title=" + title + ", content=" + content + ", timePosted="
				+ timePosted + ", groundNo=" + groundNo + ", id=" + id + ", status=" + status + "]";
	}
}
