package co.soft.email;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import co.soft.beans.UserBean;

@Component
public class EmailSender {
    @Autowired
    private JavaMailSender mailSender;
    
    public void sendEmail(UserBean userbean) throws Exception{
        //메일 발송 기능 제공
       String host="http://localhost:8080/10142team/user/";
       MimeMessage msg = mailSender.createMimeMessage();
       String content= "다음 링크에 접속하여 이메일을 확인해 주세요" +"<a href='"+
               host + "EmailCheckAction?code=" + 
               new SHA256().getSHA256(userbean.getT_user_email()) + 
               "&t_user_id=" + userbean.getT_user_id() + 
               "'>이메일 인증하기</a>";
       msg.setSubject("지푸라기 인증메일입니다."); //메일 제목
       msg.setContent(content,"text/html;charset=UTF-8");// 글 내용
       msg.setRecipient(RecipientType.TO, new InternetAddress(userbean.getT_user_email()));
       mailSender.send(msg);
    }
}