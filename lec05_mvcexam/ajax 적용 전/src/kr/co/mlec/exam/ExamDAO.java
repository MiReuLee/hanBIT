package kr.co.mlec.exam;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;

public class ExamDAO {
	private static SqlSession session = MyAppSqlConfig.getSqlSessionInstance();
	private final static String NS = "exam.ExamDAO.";
	
	public static List<ExamVO> search(ExamVO vo) {
		return session.selectList(NS+"search", vo);
	}
	
	public static int size(ExamVO vo) {
		return session.selectOne(NS+"size", vo);
	}
	
	public static List<ExamVO> normal(String a) {
		return session.selectList(NS+a);
	}
	
	public static ExamVO date() {
		return session.selectOne(NS+"date");
	}
	
	public static int no() {
		return session.selectOne(NS+"no");
	}
	
	public static void stin(ExamVO vo) {
		session.insert(NS+"stin", vo);
	}
	
	public static void skin(ExamVO vo) {
		session.insert(NS+"skin", vo);
	}
	
	public static void del(int no) {
		session.delete(NS+"skde", no);
		session.delete(NS+"stde", no);
	}
	
	public static ExamVO det(int no) {
		ExamVO vo = new ExamVO();
		vo = session.selectOne(NS+"detail", no);
		vo.setSki(session.selectList(NS+"detailski", no));
		return vo;
	}
	
	public static List<Integer> modi(int no) {
		return session.selectList(NS+"skitest", no);
	}
	
	public static int jj(ExamVO vo) {
		return session.selectOne(NS+"jj", vo);
	}
	
	public static void modi(ExamVO vo) {
		session.delete(NS+"skidel", vo);
	}
	
	public static void modify(ExamVO vo) {
		session.update(NS+"modify", vo);
	}
}