package org.kosta.inssaground.model.vo;

import java.util.List;

public class GroundVO {
	private String groundNo;
	private String groundName;
	private int maxPersonnel;
	private String introduction;
	private String hobby;
	private String master;
	private String area;
	private int status;
	private GroundImgVO groundImgVO;
	private SigunguVO sigunguVO;
	private List<String> tagList;
	private List<InsiderVO> InsiderList;
	private List<ScheduleVO> scheduleList;
	private List<PostVO> postList;
	private List<NoticeVO> noticeList;
	public GroundVO() {
		super();
	}
	public GroundVO(String groundName, int maxPersonnel, String introduction, String hobby, String master, String area,
			List<String> tagList, List<InsiderVO> insiderList, List<ScheduleVO> scheduleList, List<PostVO> postList,
			List<NoticeVO> noticeList) {
		super();
		this.groundName = groundName;
		this.maxPersonnel = maxPersonnel;
		this.introduction = introduction;
		this.hobby = hobby;
		this.master = master;
		this.area = area;
		this.tagList = tagList;
		InsiderList = insiderList;
		this.scheduleList = scheduleList;
		this.postList = postList;
		this.noticeList = noticeList;
	}
	public GroundVO(String groundNo, String groundName, int maxPersonnel, String introduction, String hobby,
			String master, String area, GroundImgVO groundImgVO, SigunguVO sigunguVO, List<String> tagList,
			List<InsiderVO> insiderList, List<ScheduleVO> scheduleList, List<PostVO> postList,
			List<NoticeVO> noticeList) {
		super();
		this.groundNo = groundNo;
		this.groundName = groundName;
		this.maxPersonnel = maxPersonnel;
		this.introduction = introduction;
		this.hobby = hobby;
		this.master = master;
		this.area = area;
		this.groundImgVO = groundImgVO;
		this.sigunguVO = sigunguVO;
		this.tagList = tagList;
		InsiderList = insiderList;
		this.scheduleList = scheduleList;
		this.postList = postList;
		this.noticeList = noticeList;
	}
	
	public GroundVO(String groundNo, String groundName, int maxPersonnel, String introduction, String hobby,
			String master, String area, int status, GroundImgVO groundImgVO, SigunguVO sigunguVO, List<String> tagList,
			List<InsiderVO> insiderList, List<ScheduleVO> scheduleList, List<PostVO> postList,
			List<NoticeVO> noticeList) {
		super();
		this.groundNo = groundNo;
		this.groundName = groundName;
		this.maxPersonnel = maxPersonnel;
		this.introduction = introduction;
		this.hobby = hobby;
		this.master = master;
		this.area = area;
		this.status = status;
		this.groundImgVO = groundImgVO;
		this.sigunguVO = sigunguVO;
		this.tagList = tagList;
		InsiderList = insiderList;
		this.scheduleList = scheduleList;
		this.postList = postList;
		this.noticeList = noticeList;
	}
	public String getGroundNo() {
		return groundNo;
	}
	public void setGroundNo(String groundNo) {
		this.groundNo = groundNo;
	}
	public String getGroundName() {
		return groundName;
	}
	public void setGroundName(String groundName) {
		this.groundName = groundName;
	}
	public int getMaxPersonnel() {
		return maxPersonnel;
	}
	public void setMaxPersonnel(int maxPersonnel) {
		this.maxPersonnel = maxPersonnel;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getMaster() {
		return master;
	}
	public void setMaster(String master) {
		this.master = master;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public GroundImgVO getGroundImgVO() {
		return groundImgVO;
	}
	public void setGroundImgVO(GroundImgVO groundImgVO) {
		this.groundImgVO = groundImgVO;
	}
	public SigunguVO getSigunguVO() {
		return sigunguVO;
	}
	public void setSigunguVO(SigunguVO sigunguVO) {
		this.sigunguVO = sigunguVO;
	}
	public List<String> getTagList() {
		return tagList;
	}
	public void setTagList(List<String> tagList) {
		this.tagList = tagList;
	}
	public List<InsiderVO> getInsiderList() {
		return InsiderList;
	}
	public void setInsiderList(List<InsiderVO> insiderList) {
		InsiderList = insiderList;
	}
	public List<ScheduleVO> getScheduleList() {
		return scheduleList;
	}
	public void setScheduleList(List<ScheduleVO> scheduleList) {
		this.scheduleList = scheduleList;
	}
	public List<PostVO> getPostList() {
		return postList;
	}
	public void setPostList(List<PostVO> postList) {
		this.postList = postList;
	}
	public List<NoticeVO> getNoticeList() {
		return noticeList;
	}
	public void setNoticeList(List<NoticeVO> noticeList) {
		this.noticeList = noticeList;
	}
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "GroundVO [groundNo=" + groundNo + ", groundName=" + groundName + ", maxPersonnel=" + maxPersonnel
				+ ", introduction=" + introduction + ", hobby=" + hobby + ", master=" + master + ", area=" + area
				+ ", status=" + status + ", groundImgVO=" + groundImgVO + ", sigunguVO=" + sigunguVO + ", tagList="
				+ tagList + ", InsiderList=" + InsiderList + ", scheduleList=" + scheduleList + ", postList=" + postList
				+ ", noticeList=" + noticeList + "]";
	}
	
	
	
}
