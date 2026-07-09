package com.email;




	import java.util.Properties;
	import javax.mail.*;
	import javax.mail.internet.*;

	public class EmailUtility {

	    public static void sendEmail(String host, String port,
	                                 final String userName,
	                                 final String password,
	                                 String toAddress,
	                                 String subject,
	                                 String message)
	            throws AddressException, MessagingException {

	        Properties properties = new Properties();

	        properties.put("mail.smtp.host", host);
	        properties.put("mail.smtp.port", port);
	        properties.put("mail.smtp.auth", "true");
	        properties.put("mail.smtp.starttls.enable", "true");

	        Authenticator auth = new Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(userName, password);
	            }
	        };

	        Session session = Session.getInstance(properties, auth);

	        Message msg = new MimeMessage(session);

	        msg.setFrom(new InternetAddress(userName));
	        msg.setRecipients(Message.RecipientType.TO,
	                InternetAddress.parse(toAddress, false));

	        msg.setSubject(subject);
	        msg.setText(message);

	        Transport.send(msg);
	    }
	}


