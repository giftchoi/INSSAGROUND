package org.kosta.inssaground.model.vo;

import java.util.List;

import org.kosta.inssaground.model.service.PagingBean;

public class ListVO<T> {
	private PagingBean pagingBean;
	private List<T> list;
	public ListVO(PagingBean pagingBean, List<T> list) {
		super();
		this.pagingBean = pagingBean;
		this.list = list;
	}
	public ListVO() {
		super();
		
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	@Override
	public String toString() {
		return "ListVO [pagingBean=" + pagingBean + ", list=" + list + "]";
	}
	
}
