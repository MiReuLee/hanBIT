package com.omp.repository.domain;

import java.util.Date;

import com.omp.common.Page;

public class Membership extends Page
{
	int memberNo, no;
	String contents;
	Date regDate;
	
	public Membership(int pageNo) 
	{
		super(pageNo);
	}

	public int getMemberNo() 
	{
		return memberNo;
	}
	public void setMemberNo(int memberNo) 
	{
		this.memberNo = memberNo;
	}
	public int getNo()
	{
		return no;
	}
	public void setNo(int no) 
	{
		this.no = no;
	}
	public String getContents() 
	{
		return contents;
	}
	public void setContents(String contents) 
	{
		this.contents = contents;
	}
	public Date getRegDate() 
	{
		return regDate;
	}
	public void setRegDate(Date regDate)
	{
		this.regDate = regDate;
	}
	
	
}
