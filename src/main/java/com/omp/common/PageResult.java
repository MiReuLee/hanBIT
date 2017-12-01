package com.omp.common;

 /*페이지에 대한 모듈처러*/
public class PageResult 
{
	private int pageNo;
	private int count;
	private int beginPage;
	private int endPage;
 
	private boolean prev;
	private boolean next;
	
	
	public PageResult(int pageNo, int count) 
	{
		this.pageNo = pageNo;
		this.count = count;
		
		//마지말 페이지 번호 구하기
		int lastPage = (count % 10 == 0) ? count / 10 : count / 10 + 1;
		
		//tab 블락 관련 처리
		//페이지 번호에 따른 tab 번호, 탭에 시작, 탭에 종료
		int currentTab = (pageNo - 1) / 10 + 1;
		beginPage = (currentTab - 1) * 10 + 1;
		endPage = (currentTab * 10 > lastPage) ?  lastPage : currentTab * 10;
		
		prev = beginPage != 1;
		next = endPage != lastPage;
	}
	
	

	public int getPageNo() {
		return pageNo;
	}



	public int getCount() {
		return count;
	}


	public int getBeginPage() {
		return  beginPage;
	}


	public int getEndPage() {
		return  endPage;
	}


	public boolean getPrev() {
		return prev;
	}


	public boolean getNext() {
		return next;
	}

}
