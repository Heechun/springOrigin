package com.tyn.origin.main.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.SimpleMailMessage;

public class SendEmail {
	private void sendEmail(String email){
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost("mail.server.com");
		
		Properties props = new Properties();
		props.put("mail.smtp.host", "mail.ksug.org");
		Session s = Session.getInstance(props, null);
		
		MimeMessage message = new MimeMessage(s);
		try {
			message.setFrom(new InternetAddress("useradmin@ksug.org"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			message.setSubject("");
			message.setText("");
			
			Transport.send(message);
		}
		catch (Exception e) {
			throw new RuntimeException();
		}
		
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setTo(email);
		mailMessage.setFrom("useradmin@ksug.org");
		mailMessage.setSubject("email 테스트 제목");
		mailMessage.setText("email 테스트 내용");
		
		mailSender.send(mailMessage);
	}
}
