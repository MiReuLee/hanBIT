package com.omp.repository.domain;

import java.util.Date;

public class Board {
	private Integer boardNo;

	private String writer;

	private String title;

	private String contents;

	private Date regDate;

	private Integer categoryNo;

	private Integer memberNo;

	public Integer getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(Integer boardNo) {
		this.boardNo = boardNo;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Integer getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(Integer categoryNo) {
		this.categoryNo = categoryNo;
	}

	public Integer getMemberNo() {
		return memberNo;
	}	

	public void setMemberNo(Integer memberNo) {
		this.memberNo = memberNo;
	}
}
