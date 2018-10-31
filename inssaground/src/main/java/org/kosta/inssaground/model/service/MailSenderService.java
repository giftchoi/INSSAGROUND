package org.kosta.inssaground.model.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.kosta.inssaground.model.vo.EmailVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
@Service
public class MailSenderService{
	@Autowired
	private JavaMailSender mailSender;
	public void sendEmail(EmailVO email) {
		MimeMessage message=mailSender.createMimeMessage();
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
			messageHelper.setFrom("yjym0926@gmail.com");
			messageHelper.setTo(email.getReceiver());
			
			messageHelper.setSubject(email.getSubject());
			messageHelper.setText(email.getContent());
			mailSender.send(message);
		} catch (MessagingException e) {
			System.out.println(e);
		}
	}
}
