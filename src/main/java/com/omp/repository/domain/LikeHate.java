package com.omp.repository.domain;

public class LikeHate 
{
	int boardNo, memberNo;
	String likeHate;
	
	
	public int getBoardNo()
	{
		return boardNo;
	}
	public void setBoardNo(int boardNo) 
	{
		this.boardNo = boardNo;
	}
	public int getMemberNo() 
	{
		return memberNo;
	}
	public void setMemberNo(int memberNo) 
	{
		this.memberNo = memberNo;
	}
	public String getLikeHate() 
	{
		return likeHate;
	}
	public void setLikeHate(String likeHate) 
	{
		this.likeHate = likeHate;
	} 
}
