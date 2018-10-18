package org.kosta.inssaground.model.vo;

public class NoticeVO {
	private String noticeNo;
	private String groundNo;
	private String content;
	private String timePosted;
	public NoticeVO() {
		super();
	}
	
	public NoticeVO(String noticeNo, String groundNo, String content, String timePosted) {
		super();
		this.noticeNo = noticeNo;
		this.groundNo = groundNo;
		this.content = content;
		this.timePosted = timePosted;
	}

	public String getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
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
	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo + ", groundNo=" + groundNo + ", content=" + content + ", timePosted="
				+ timePosted + "]";
	}
	
}
