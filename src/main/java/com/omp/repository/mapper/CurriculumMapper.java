package com.omp.repository.mapper;

import java.util.List;

import com.omp.repository.domain.Curriculum;

public interface CurriculumMapper 
{
	public void insertCurriculum(Curriculum curriculum) throws Exception;
	public void deleteCurriculum(Curriculum curriculum) throws Exception;
	public void modifyCurriculum(Curriculum curriculum) throws Exception;
	public List<Curriculum> readCurriculum(Curriculum curriculum) throws Exception;
	public Curriculum detailCurriculum(Curriculum curriculum) throws Exception;
	public int totalCurriculum() throws Exception;
}
