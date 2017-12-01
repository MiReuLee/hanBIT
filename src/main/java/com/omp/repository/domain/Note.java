package com.omp.repository.domain;

import java.util.Date;

public class Note {

    private Integer memberNo;

    private Date regDate;

    private String contents;

    private String writer;

    private Integer writerMemberNo;

    public Integer getMemberNo() {
        return memberNo;
    }

    public void setMemberNo(Integer memberNo) {
        this.memberNo = memberNo;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public Integer getWriterMemberNo() {
        return writerMemberNo;
    }

    public void setWriterMemberNo(Integer writerMemberNo) {
        this.writerMemberNo = writerMemberNo;
    }

    // Note 모델 복사
    public void CopyData(Note param)
    {
        this.memberNo = param.getMemberNo();
        this.regDate = param.getRegDate();
        this.contents = param.getContents();
        this.writer = param.getWriter();
        this.writerMemberNo = param.getWriterMemberNo();
    }
}