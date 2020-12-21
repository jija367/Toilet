package co.soft.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
//bean을 정의하는 클래스
public class RootAppContext {

	@Bean // email 셋팅하는 인터페이스
	public JavaMailSender getJavaMailSender() {
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", true);
		properties.put("mail.transport.protocol", "smtp");
		properties.put("mail.smtp.starttls.enable", true);
		properties.put("mail.smtp.starttls.required", true);
		properties.put("mail.debug", true);

		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(587);
		mailSender.setUsername("2teamsoldesk@gmail.com");
		mailSender.setPassword("@dlxlathfeptmzm123");
		mailSender.setDefaultEncoding("utf-8");
		mailSender.setJavaMailProperties(properties);

		return mailSender;
	}

}
