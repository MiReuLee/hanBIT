package com.omp.repository.domain;

import java.util.List;

public class Study {

    private Integer classNo;

    private String classTitle;

    private String classRegDate;
    
    private List<ClassBoard> list;
    
	public List<ClassBoard> getList() {
		return list;
	}

	public void setList(List<ClassBoard> list) {
		this.list = list;
	}

	public Integer getClassNo() {
        return classNo;
    }

    public void setClassNo(Integer classNo) {
        this.classNo = classNo;
    }

    public String getClassTitle() {
        return classTitle;
    }

    public void setClassTitle(String classTitle) {
        this.classTitle = classTitle;
    }

    public String getClassRegDate() {
        return classRegDate;
    }

    public void setClassRegDate(String classRegDate) {
        this.classRegDate = classRegDate;
    }

    // Class 모델 복사
    public void CopyData(Study param)
    {
        this.classNo = param.getClassNo();
        this.classTitle = param.getClassTitle();
        this.classRegDate = param.getClassRegDate();
    }

	@Override
	public String toString() {
		return "Study [classNo=" + classNo + ", classTitle=" + classTitle + ", classRegDate=" + classRegDate + "]";
	}
    
    
}
