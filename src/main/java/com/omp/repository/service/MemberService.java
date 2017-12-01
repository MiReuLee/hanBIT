package com.omp.repository.service;

import com.omp.repository.domain.Member;

public interface MemberService {
	public String jungBok(String id) throws Exception;
	public Member login(Member member) throws Exception;
	public void insert(Member member) throws Exception;
	public String memchk(Member member) throws Exception;
	public void memcha(Member member) throws Exception;
	public void up(String id) throws Exception;
}
 