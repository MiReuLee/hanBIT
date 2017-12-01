package com.omp.repository.service;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service("mailService")
public class MailServiceImpl implements MailService {
	
	@Autowired
	private JavaMailSender mailSender;

	public void sendMail(String from, String to, String subject, String ra)
			throws Exception {
		try {
			MimeMessage message = mailSender.createMimeMessage();

			message.setFrom(new InternetAddress(from));
			message.addRecipients(RecipientType.TO, to);
			message.setSubject(subject, "utf-8");
			String rand = "<div style=\"color: white;background: linear-gradient(to right, skyblue, pink);font-size: 8vh;padding: 1vh;font-weight: bold;border-radius: 50px;width: 45vw;text-align: center;\">"+ra+"</div>";
			message.setText(rand, "utf-8", "html");

			mailSender.send(message);
		} catch (Exception e) {}
	}
}
