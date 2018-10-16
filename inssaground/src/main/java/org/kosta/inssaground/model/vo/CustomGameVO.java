package org.kosta.inssaground.model.vo;

public class CustomGameVO {
  private String cGameNo;
  private String title;
  private int minPersonnel;
  private int maxPersonnel;
  private int gameTime;
  private String materials;
  private String content;
  private int recommendation;
  private MemberVO memberVO;
  private int cgNo;
public CustomGameVO() {
	super();

}
public CustomGameVO(String cGameNo, String title, int minPersonnel, int maxPersonnel, int gameTime, String materials,
		String content, int recommendation, MemberVO memberVO, int cgNo) {
	super();
	this.cGameNo = cGameNo;
	this.title = title;
	this.minPersonnel = minPersonnel;
	this.maxPersonnel = maxPersonnel;
	this.gameTime = gameTime;
	this.materials = materials;
	this.content = content;
	this.recommendation = recommendation;
	this.memberVO = memberVO;
	this.cgNo = cgNo;
}
public String getcGameNo() {
	return cGameNo;
}
public void setcGameNo(String cGameNo) {
	this.cGameNo = cGameNo;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public int getMinPersonnel() {
	return minPersonnel;
}
public void setMinPersonnel(int minPersonnel) {
	this.minPersonnel = minPersonnel;
}
public int getMaxPersonnel() {
	return maxPersonnel;
}
public void setMaxPersonnel(int maxPersonnel) {
	this.maxPersonnel = maxPersonnel;
}
public int getGameTime() {
	return gameTime;
}
public void setGameTime(int gameTime) {
	this.gameTime = gameTime;
}
public String getMaterials() {
	return materials;
}
public void setMaterials(String materials) {
	this.materials = materials;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public int getRecommendation() {
	return recommendation;
}
public void setRecommendation(int recommendation) {
	this.recommendation = recommendation;
}
public MemberVO getMemberVO() {
	return memberVO;
}
public void setMemberVO(MemberVO memberVO) {
	this.memberVO = memberVO;
}
public int getCgNo() {
	return cgNo;
}
public void setCgNo(int cgNo) {
	this.cgNo = cgNo;
}
@Override
public String toString() {
	return "CustomGameVO [cGameNo=" + cGameNo + ", title=" + title + ", minPersonnel=" + minPersonnel
			+ ", maxPersonnel=" + maxPersonnel + ", gameTime=" + gameTime + ", materials=" + materials + ", content="
			+ content + ", recommendation=" + recommendation + ", memberVO=" + memberVO + ", cgNo=" + cgNo + "]";
}

}