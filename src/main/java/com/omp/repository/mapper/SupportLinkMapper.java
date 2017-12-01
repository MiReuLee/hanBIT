package com.omp.repository.mapper;

import java.util.List;

import com.omp.common.Page;
import com.omp.repository.domain.SupportLink;

public interface SupportLinkMapper 
{
	public void insertSupportLink(SupportLink sld) throws Exception;
	public void deleteSupportLink(int supportNo) throws Exception;
	public void modifySupportLink(int supportNo) throws Exception;
	public List<SupportLink> readSupportLink(Page page) throws Exception;
	public SupportLink detailSupportLink(int supportNo) throws Exception;
	public int totalSupportLink() throws Exception;
	
}
