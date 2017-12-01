package com.omp.repository.mapper;

import java.util.List;

import com.omp.repository.domain.Membership;

public interface MembershipMapper
{
	public void insertMemberComment(Membership membership) throws Exception;
	public void deleteMemberComment(int no) throws Exception;
	public void modifyMemberComment(int no) throws Exception;
	public List<Membership> readMemberComment(Membership membership) throws Exception;
	public Membership detailMemberComment(int no) throws Exception;
	public int totalMembershipComment() throws Exception;
}
