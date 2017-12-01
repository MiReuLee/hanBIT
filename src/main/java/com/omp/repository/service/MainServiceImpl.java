package com.omp.repository.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omp.repository.domain.Board;
import com.omp.repository.mapper.MainMapper;


@Service("mainService")
public class MainServiceImpl implements MainService 
{
	
	@Autowired
	private MainMapper mapper;

	@Override
	public Board selectNotice(int categoryNo) throws Exception {
		return mapper.selectNotice(categoryNo);
	}
	@Override
	public List<Board> selectNewlyBoard() throws Exception {
		return mapper.selectNewlyBoard();
	}
	@Override
	public void updateNotice(Board board) throws Exception {
		mapper.updateNotice(board);	
	}
	@Override
	public void updateTodayDeal(Board board) throws Exception {
		mapper.updateTodayDeal(board);	
	}	
}
