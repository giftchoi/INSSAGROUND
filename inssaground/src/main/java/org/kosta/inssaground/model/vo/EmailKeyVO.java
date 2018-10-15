package org.kosta.inssaground.model.vo;

public class EmailKeyVO {
	private String email;
	private String emailKey;
	private String regDate;
	private int status;
	public EmailKeyVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public EmailKeyVO(String email, String emailKey) {
		super();
		this.email = email;
		this.emailKey = emailKey;
	}

	public EmailKeyVO(String email, String emailKey, String regDate, int status) {
		super();
		this.email = email;
		this.emailKey = emailKey;
		this.regDate = regDate;
		this.status = status;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "EmailKeyVO [email=" + email + ", emailKey=" + emailKey + ", regDate=" + regDate + ", status=" + status
				+ "]";
	}	
}
