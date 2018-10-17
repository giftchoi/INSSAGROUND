package org.kosta.inssaground.model.vo;

import java.util.List;

public class MemberVO {
	private String id;
	private String password;
	private String name;
	private String email;
	private int status;
	private String profile;
	private List<String> groundNoList;
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberVO(String id, String password, String name, String email, int status, String profile,
			List<String> groundNoList) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.status = status;
		this.profile = profile;
		this.groundNoList = groundNoList;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	public List<String> getGroundNoList() {
		return groundNoList;
	}

	public void setGroundNoList(List<String> groundNoList) {
		this.groundNoList = groundNoList;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", email=" + email + ", status="
				+ status + ", profile=" + profile + ", groundNoList=" + groundNoList + "]";
	}
	
	
}
