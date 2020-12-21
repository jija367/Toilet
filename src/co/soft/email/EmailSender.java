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
        //���� �߼� ��� ����
       String host="http://localhost:8080/10142team/user/";
       MimeMessage msg = mailSender.createMimeMessage();
       String content= "���� ��ũ�� �����Ͽ� �̸����� Ȯ���� �ּ���" +"<a href='"+
               host + "EmailCheckAction?code=" + 
               new SHA256().getSHA256(userbean.getT_user_email()) + 
               "&t_user_id=" + userbean.getT_user_id() + 
               "'>�̸��� �����ϱ�</a>";
       msg.setSubject("��Ǫ��� ���������Դϴ�."); //���� ����
       msg.setContent(content,"text/html;charset=UTF-8");// �� ����
       msg.setRecipient(RecipientType.TO, new InternetAddress(userbean.getT_user_email()));
       mailSender.send(msg);
    }
}