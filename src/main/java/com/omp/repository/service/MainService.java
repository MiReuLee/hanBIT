package com.omp.repository.service;

import java.util.List;

import com.omp.repository.domain.Board;

public interface MainService 
{
	public Board selectNotice(int categoryNo) throws Exception;
	public List<Board> selectNewlyBoard() throws Exception;
	public void updateNotice(Board board) throws Exception;
	public void updateTodayDeal(Board board) throws Exception;
}
 