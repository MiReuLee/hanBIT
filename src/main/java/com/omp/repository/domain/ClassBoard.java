package com.omp.repository.domain;

import java.util.Date;

public class ClassBoard {

    private Integer boardNo;

    private String writer;

    private String title;

    private String contents;

    private Date regDate;

    private Integer categoryNo;

    private Integer classNo;

    private Integer memberNo;

    private Integer look;
    

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

    public Integer getClassNo() {
        return classNo;
    }

    public void setClassNo(Integer classNo) {
        this.classNo = classNo;
    }

    public Integer getMemberNo() {
        return memberNo;
    }

    public void setMemberNo(Integer memberNo) {
        this.memberNo = memberNo;
    }

    public Integer getLook() {
        return look;
    }

    public void setLook(Integer look) {
        this.look = look;
    }

    // ClassBoard 모델 복사
    public void CopyData(ClassBoard param)
    {
        this.boardNo = param.getBoardNo();
        this.writer = param.getWriter();
        this.title = param.getTitle();
        this.contents = param.getContents();
        this.regDate = param.getRegDate();
        this.categoryNo = param.getCategoryNo();
        this.classNo = param.getClassNo();
        this.memberNo = param.getMemberNo();
        this.look = param.getLook();
    }

	@Override
	public String toString() {
		return "ClassBoard [boardNo=" + boardNo + ", writer=" + writer + ", title=" + title + ", contents=" + contents
				+ ", regDate=" + regDate + ", categoryNo=" + categoryNo + ", classNo=" + classNo + ", memberNo="
				+ memberNo + ", look=" + look + "]";
	}
    
    
}
