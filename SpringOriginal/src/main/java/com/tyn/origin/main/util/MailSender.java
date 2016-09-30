package com.tyn.origin.main.util;

import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;

public interface MailSender {
	void send(SimpleMailMessage simpleMessage) throws MailException;
	void send(SimpleMailMessage[] siMessages) throws MailException;
}
