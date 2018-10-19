package org.kosta.inssaground.model.vo;

public class ScheduleVO {
	private String scheduleNo;
	private String startDate;
	private String endDate;
	private String title;
	private String loc;
	private String content;
	private int maxPersonnel;
	private String position;
	private InsiderVO insiderVO;
	private GroundVO groundVO;
	public ScheduleVO() {
		super();
	}
	public ScheduleVO(String startDate, String endDate, String title, String loc, String content, int maxPersonnel) {
		super();
		this.startDate = startDate;
		this.endDate = endDate;
		this.title = title;
		this.loc = loc;
		this.content = content;
		this.maxPersonnel = maxPersonnel;
	}
	public ScheduleVO(String scheduleNo, String startDate, String endDate, String title, String loc, String content,
			int maxPersonnel) {
		super();
		this.scheduleNo = scheduleNo;
		this.startDate = startDate;
		this.endDate = endDate;
		this.title = title;
		this.loc = loc;
		this.content = content;
		this.maxPersonnel = maxPersonnel;
	}
	
	public ScheduleVO(String scheduleNo, String startDate, String endDate, String title, String loc, String content,
			int maxPersonnel, InsiderVO insiderVO, GroundVO groundVO) {
		super();
		this.scheduleNo = scheduleNo;
		this.startDate = startDate;
		this.endDate = endDate;
		this.title = title;
		this.loc = loc;
		this.content = content;
		this.maxPersonnel = maxPersonnel;
		this.insiderVO = insiderVO;
		this.groundVO = groundVO;
	}
	public ScheduleVO(String scheduleNo, String startDate, String endDate, String title, String loc, String content,
			int maxPersonnel, String position, InsiderVO insiderVO, GroundVO groundVO) {
		super();
		this.scheduleNo = scheduleNo;
		this.startDate = startDate;
		this.endDate = endDate;
		this.title = title;
		this.loc = loc;
		this.content = content;
		this.maxPersonnel = maxPersonnel;
		this.position = position;
		this.insiderVO = insiderVO;
		this.groundVO = groundVO;
	}
	public String getScheduleNo() {
		return scheduleNo;
	}
	public void setScheduleNo(String scheduleNo) {
		this.scheduleNo = scheduleNo;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getMaxPersonnel() {
		return maxPersonnel;
	}
	public void setMaxPersonnel(int maxPersonnel) {
		this.maxPersonnel = maxPersonnel;
	}
	
	public InsiderVO getInsiderVO() {
		return insiderVO;
	}
	public void setInsiderVO(InsiderVO insiderVO) {
		this.insiderVO = insiderVO;
	}
	public GroundVO getGroundVO() {
		return groundVO;
	}
	public void setGroundVO(GroundVO groundVO) {
		this.groundVO = groundVO;
	}
	
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	@Override
	public String toString() {
		return "ScheduleVO [scheduleNo=" + scheduleNo + ", startDate=" + startDate + ", endDate=" + endDate + ", title="
				+ title + ", loc=" + loc + ", content=" + content + ", maxPersonnel=" + maxPersonnel + ", position="
				+ position + ", insiderVO=" + insiderVO + ", groundVO=" + groundVO + "]";
	}
	
	
}
