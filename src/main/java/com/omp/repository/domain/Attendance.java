package com.omp.repository.domain;

import java.util.Date;

import com.omp.common.Page;

public class Attendance extends Page
{
	int attendanceNo, memberNo, attend;
	String regDate;
	Date regDateDetail;
	
	public Attendance(int pageNo)
	{
		super(pageNo);
	}
	
	public int getAttendanceNo() 
	{
		return attendanceNo;
	}
	public void setAttendanceNo(int attendanceNo) 
	{
		this.attendanceNo = attendanceNo;
	}
	public int getMemberNo() 
	{
		return memberNo;
	}
	public void setMemberNo(int memberNo) 
	{
		this.memberNo = memberNo;
	}
	public int getAttend() 
	{
		return attend;
	}
	public void setAttend(int attend) 
	{
		this.attend = attend;
	}
	public String getRegDate() 
	{
		return regDate;
	}
	public void setRegDate(String regDate) 
	{
		this.regDate = regDate;
	}
	public Date getRegDateDetail() 
	{
		return regDateDetail;
	}
	public void setRegDateDetail(Date regDateDetail) 
	{
		this.regDateDetail = regDateDetail;
	}
	
	
}
