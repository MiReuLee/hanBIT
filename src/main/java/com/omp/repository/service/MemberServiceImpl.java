package com.omp.repository.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omp.repository.domain.Member;
import com.omp.repository.mapper.MemberMapper;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;

	@Override
	public String jungBok(String id) throws Exception {
		return mapper.jungBok(id);
	}
	
	@Override
	public Member login(Member member) throws Exception {
		return mapper.login(member);
	}
	
	@Override
	public void insert(Member member) throws Exception {
		mapper.insert(member);
	}
	
	@Override
	public String memchk(Member member) throws Exception {
		return mapper.memchk(member);
	}
	
	@Override
	public void up(String id) throws Exception {
		mapper.up(id);
	}
	
	@Override
	public void memcha(Member member) throws Exception {
		mapper.memcha(member);	
	}
}
