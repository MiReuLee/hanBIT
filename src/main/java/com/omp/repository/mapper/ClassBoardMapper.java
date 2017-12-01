package com.omp.repository.mapper;

import java.util.List;

import com.omp.repository.domain.ClassBoard;

public interface ClassBoardMapper {
	public List<ClassBoard> classBoardList() throws Exception;
	public void insertclassBoard(ClassBoard study) throws Exception;
	public void deleteclassBoard(int no) throws Exception;
	public ClassBoard modifyForm(int no) throws Exception;
	public void modify(ClassBoard study) throws Exception;
	public void look(int no) throws Exception;
	public ClassBoard detail(int no) throws Exception;
}
