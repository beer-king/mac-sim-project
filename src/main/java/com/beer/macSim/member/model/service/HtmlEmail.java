package com.beer.macSim.member.model.service;

import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class HtmlEmail {

	public class HTMLMail
	{
	       private JavaMailSender mailSender;


	       public void setMailSender(JavaMailSender mailSender) {
	           this.mailSender = mailSender;
	       }

	       public void sendMail(String from, String to, String subject, String msg) {
	           try {

	               MimeMessage message = mailSender.createMimeMessage();

	               message.setSubject(subject);
	               MimeMessageHelper helper;
	               helper = new MimeMessageHelper(message, true);
	               helper.setFrom(from);
	               helper.setTo(to);
	               helper.setText(msg, true);
	               mailSender.send(message);
	           } catch (MessagingException ex) {
	               Logger.getLogger(HTMLMail.class.getName()).log(Level.SEVERE, null, ex);
	           }
	       }


	}

	public void setDebug(boolean b) {

	}

	public void setCharset(String charSet) {
		// TODO Auto-generated method stub
		
	}

	public void setSSL(boolean b) {
		// TODO Auto-generated method stub
		
	}

	public void setHostName(String hostSMTP) {
		// TODO Auto-generated method stub
		
	}

	public void setSmtpPort(int i) {
		// TODO Auto-generated method stub
		
	}
}
