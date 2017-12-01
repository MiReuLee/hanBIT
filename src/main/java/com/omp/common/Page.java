package com.omp.common;

public class Page {
	private int pageNo;

	public Page(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getBegin() {
		return (pageNo - 1) * 10 + 1;
	}

	public int getEnd() {
		return pageNo * 10;
	}

}
