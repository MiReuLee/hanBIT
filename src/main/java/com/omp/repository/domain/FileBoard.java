package com.omp.repository.domain;

public class FileBoard {

    private Integer fileNo;

    private String systemName;

    private String originalName;

    private String filePath;

    private Long fileSize;

    private Integer boardNo;

    public Integer getFileNo() {
        return fileNo;
    }

    public void setFileNo(Integer fileNo) {
        this.fileNo = fileNo;
    }

    public String getSystemName() {
        return systemName;
    }

    public void setSystemName(String systemName) {
        this.systemName = systemName;
    }

    public String getOriginalName() {
        return originalName;
    }

    public void setOriginalName(String originalName) {
        this.originalName = originalName;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public Long getFileSize() {
        return fileSize;
    }

    public void setFileSize(Long fileSize) {
        this.fileSize = fileSize;
    }

    public Integer getBoardNo() {
        return boardNo;
    }

    public void setBoardNo(Integer boardNo) {
        this.boardNo = boardNo;
    }

    // FileBoard 모델 복사
    public void CopyData(FileBoard param)
    {
        this.fileNo = param.getFileNo();
        this.systemName = param.getSystemName();
        this.originalName = param.getOriginalName();
        this.filePath = param.getFilePath();
        this.fileSize = param.getFileSize();
        this.boardNo = param.getBoardNo();
    }
}