package org.kosta.inssaground.model.vo;

public class EmailVO {
	private String receiver;
	private String subject;
	private String content;
	public EmailVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EmailVO(String receiver, String subject, String content) {
		super();
		this.receiver = receiver;
		this.subject = subject;
		this.content = content;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "EmailVO [receiver=" + receiver + ", subject=" + subject + ", content=" + content + "]";
	}
	
}
