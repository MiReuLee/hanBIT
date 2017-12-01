package com.omp.repository.service;

public interface MailService {
	public void sendMail(String from, String to, String subject, String ra) throws Exception;
}
