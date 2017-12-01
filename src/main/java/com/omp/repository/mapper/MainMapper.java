package com.omp.repository.mapper;

import java.util.List;

import com.omp.repository.domain.Board;

public interface MainMapper {
	public Board selectNotice(int categoryNo) throws Exception; // 공지사항 조회
	public List<Board> selectNewlyBoard() throws Exception; // 공지사항 조회
	public void updateNotice(Board board) throws Exception; // 공지사항 수정
	public void updateTodayDeal(Board board) throws Exception; // 오늘의내기 수정
}
