package org.kosta.inssaground.model.vo;

import java.util.List;

public class PostVO {
	private String postNo;
	private String title;
	private String content;
	private int hits;
	private String timePosted;
	private List<String> pictureList;
	public PostVO() {
		super();
	}
	public PostVO(String title, String content, int hits, String timePosted, List<String> pictureList) {
		super();
		this.title = title;
		this.content = content;
		this.hits = hits;
		this.timePosted = timePosted;
		this.pictureList = pictureList;
	}
	public PostVO(String postNo, String title, String content, int hits, String timePosted, List<String> pictureList) {
		super();
		this.postNo = postNo;
		this.title = title;
		this.content = content;
		this.hits = hits;
		this.timePosted = timePosted;
		this.pictureList = pictureList;
	}
	public String getPostNo() {
		return postNo;
	}
	public void setPostNo(String postNo) {
		this.postNo = postNo;
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
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getTimePosted() {
		return timePosted;
	}
	public void setTimePosted(String timePosted) {
		this.timePosted = timePosted;
	}
	public List<String> getPictureList() {
		return pictureList;
	}
	public void setPictureList(List<String> pictureList) {
		this.pictureList = pictureList;
	}
	@Override
	public String toString() {
		return "PostVO [postNo=" + postNo + ", title=" + title + ", content=" + content + ", hits=" + hits
				+ ", timePosted=" + timePosted + ", pictureList=" + pictureList + "]";
	}
	
}
