package org.kosta.inssaground.model.vo;

public class EmailKeyVO {
	private String id;
	private String emailKey;
	private String regDate;
	public EmailKeyVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EmailKeyVO(String id, String emailKey, String regDate) {
		super();
		this.id = id;
		this.emailKey = emailKey;
		this.regDate = regDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmailKey() {
		return emailKey;
	}
	public void setEmailKey(String emailKey) {
		this.emailKey = emailKey;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "EmailKeyVO [id=" + id + ", emailKey=" + emailKey + ", regDate=" + regDate + "]";
	}
	
}
