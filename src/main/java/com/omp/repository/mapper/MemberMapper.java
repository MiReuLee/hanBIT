package com.omp.repository.mapper;

import com.omp.repository.domain.Member;

public interface MemberMapper {
	public String jungBok(String id) throws Exception;
	public Member login(Member member) throws Exception; // 회원 정보 상세
	public void insert(Member member) throws Exception; // 회원 등록
	public String memchk(Member member) throws Exception;
	public void up(String id) throws Exception;
	public void memcha(Member member) throws Exception;
}
