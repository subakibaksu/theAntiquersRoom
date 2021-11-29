package com.theantiquersroom.myapp.utils;

import com.theantiquersroom.myapp.config.MailConfig;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;


@Log4j2
public class Mailsender {

    @Setter(onMethod_={@Autowired})
    MailConfig mailconfig;


    public void sendmail(String body, String to) throws Exception{

        log.debug(mailconfig.toString());


        Properties props = System.getProperties();
        props.put("mail.smtp.ssl.trust", "smtp.naver.com");
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.port", mailconfig.getPort());
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        Session session = Session.getDefaultInstance(props);
        MimeMessage msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(mailconfig.getFrom(), mailconfig.getFromname()));
        msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
        msg.setSubject(mailconfig.getSubject());
        msg.setContent(body, "text/html;charset=euc-kr");

        Transport transport = session.getTransport();
        try {
            System.out.println("Sending...");

            transport.connect(mailconfig.getHost(), mailconfig.getSmtp_username(),mailconfig.getSmtp_password());
            transport.sendMessage(msg, msg.getAllRecipients());
            System.out.println("Email sent!");
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            transport.close();
        }
    }


}// end class
