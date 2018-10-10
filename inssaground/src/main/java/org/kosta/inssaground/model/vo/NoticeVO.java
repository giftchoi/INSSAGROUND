package org.kosta.inssaground.model.vo;

public class NoticeVO {
	private String noticeNo;
	private String content;
	private String timePosted;
	public NoticeVO() {
		super();
	}
	public NoticeVO(String content, String timePosted) {
		super();
		this.content = content;
		this.timePosted = timePosted;
	}
	public NoticeVO(String noticeNo, String content, String timePosted) {
		super();
		this.noticeNo = noticeNo;
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
	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo + ", content=" + content + ", timePosted=" + timePosted + "]";
	}
	
}
