package co.soft.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import co.soft.beans.ToiletBean;
import co.soft.dao.ToiletDao;
import co.soft.mapper.CommentMapper;
import co.soft.mapper.ToiletMapper;
import co.soft.mapper.UserMapper;

// Spring MVC 프로젝트에 관련된 설정을 하는 클래스
@Configuration
// Controller 어노테이션이 셋팅되어 있는 클래스를 Controller로 등록한다.
@EnableWebMvc
// 스캔할 패키지를 지정한다.
@ComponentScan("co.soft.controller")
@ComponentScan("co.soft.dao")
@ComponentScan("co.soft.service")
@ComponentScan("co.soft.email") // 이메일 패키지 생성
@PropertySource("/WEB-INF/pro/db.properties") // 프로퍼티 등록
public class ServletAppContext implements WebMvcConfigurer {
	@Value("${db.classname}")
	private String classname;

	@Value("${db.url}")
	private String url;

	@Value("${db.username}")
	private String username;

	@Value("${db.password}")
	private String password;

// Controller의 메서드가 반환하는 jsp의 이름 앞뒤에 경로와 확장자를 붙혀주도록 설정한다.
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
// TODO Auto-generated method stub
		WebMvcConfigurer.super.configureViewResolvers(registry);
		registry.jsp("/WEB-INF/views/", ".jsp");
	}

	@Bean
	public BasicDataSource data() {
		BasicDataSource source = new BasicDataSource();
		source.setDriverClassName(classname);
		source.setUrl(url);
		source.setUsername(username);
		source.setPassword(password);
		return source;
	}

	@Bean
	public SqlSessionFactory fac(BasicDataSource source) throws Exception {
		SqlSessionFactoryBean facbean = new SqlSessionFactoryBean();
		facbean.setDataSource(source);
		SqlSessionFactory fac = facbean.getObject();
		return fac;
	}

	@Bean
	public MapperFactoryBean<ToiletMapper> toiletMapperFac(SqlSessionFactory factory) {
		MapperFactoryBean<ToiletMapper> fac = new MapperFactoryBean<ToiletMapper>(ToiletMapper.class);
		fac.setSqlSessionFactory(factory);
		return fac;
	}

	@Bean
	public MapperFactoryBean<UserMapper> userMapperFac(SqlSessionFactory factory) {
		MapperFactoryBean<UserMapper> fac = new MapperFactoryBean<UserMapper>(UserMapper.class);
		fac.setSqlSessionFactory(factory);
		return fac;
	}

	@Bean
	public MapperFactoryBean<CommentMapper> commentMapperFac(SqlSessionFactory factory) {
		MapperFactoryBean<CommentMapper> fac = new MapperFactoryBean<CommentMapper>(CommentMapper.class);
		fac.setSqlSessionFactory(factory);
		return fac;
	}

// 정적 파일의 경로를 매핑한다.

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// TODO Auto-generated method stub
		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/**").addResourceLocations("/resources/");
	}

	
	// 파일 업로드
	@Bean
	public StandardServletMultipartResolver multipartResolver() {
		return new StandardServletMultipartResolver();
	}


	 
}
