package co.soft.email;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import co.soft.beans.UserBean;

@Component
public class EmailSenderPw {
    @Autowired
    private JavaMailSender mailSender;
    
    public static String getRandomPassword(int len) { 
       char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' }; 
       int idx = 0; 
       StringBuffer sb = new StringBuffer(); 
       System.out.println("charSet.length :::: "+charSet.length); 
       for (int i = 0; i < len; i++) { 
          idx = (int) (charSet.length * Math.random());
          // 36 * ������ ������ Int�� ���� (�Ҽ�������)
          System.out.println("idx :::: "+idx); sb.append(charSet[idx]);
       } 
       return sb.toString(); 
    }
    
    public void sendEmail(UserBean userbean) throws Exception{
        //���� �߼� ��� ����
       String tempassword="";
       String host="http://localhost:8080/10142team/user/";
        MimeMessage msg = mailSender.createMimeMessage();
        msg.setSubject("��Ǫ��� ��й�ȣ ������ȣ�Դϴ�."); //���� ����
        msg.setText("�ӽú�й�ȣ�� " + 
             userbean.getT_user_pw() + 
             "�Դϴ�."); // �� ����
        msg.setRecipient(RecipientType.TO, new InternetAddress(userbean.getT_user_email()));
        mailSender.send(msg);
    }
    
   }