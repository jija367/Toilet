package co.soft.config;

import javax.servlet.Filter;
import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

/*public class SpringConfigClass implements WebApplicationInitializer{

   @Override
   public void onStartup(ServletContext servletContext) throws ServletException {
      //Spring MVC 프로젝트 설정을 위해 클래스의 객체 생성한다.
      
      AnnotationConfigWebApplicationContext servletAppContext = new AnnotationConfigWebApplicationContext();
      servletAppContext.register(ServletAppContext.class);
      
      //요청을 처리하는 서블릿을 DispatcherServlet으로 설정해준다.
      DispatcherServlet dispatcherServlet = new DispatcherServlet(servletAppContext);
      ServletRegistration.Dynamic servlet = servletContext.addServlet("dispatcher", dispatcherServlet);
      
      servlet.setLoadOnStartup(1);
      servlet.addMapping("/");
      
   	  //Bean 정의하는 클래스를 지정한다.
      AnnotationConfigWebApplicationContext rootAppContext = new AnnotationConfigWebApplicationContext();
      rootAppContext.register(RootAppContext.class);
      
      ContextLoaderListener listener = new ContextLoaderListener(rootAppContext);
      servletContext.addListener(listener);
      
      FilterRegistration.Dynamic filter = servletContext.addFilter("encodingFilter", CharacterEncodingFilter.class);
      filter.setInitParameter("encoding", "UTF-8");
      filter.addMappingForServletNames(null, false, "dispatcher");
   }
}
*/
public class SpringConfig extends AbstractAnnotationConfigDispatcherServletInitializer{
   //DispatcherServlet에 맵핑할 요청 주소를 세팅한다.
   @Override
   protected String[] getServletMappings() {
      // TODO Auto-generated method stub
      return new String[] {"/"};
      //모든요청주소에대해 가능
   }
   
   
   @Override
   protected Class<?>[] getServletConfigClasses() {
      // TODO Auto-generated method stub
      return new Class[] {ServletAppContext.class};
   }
   

   @Override
   protected Class<?>[] getRootConfigClasses() {
      // TODO Auto-generated method stub
      return new Class[] {RootAppContext.class};
   }

   @Override
   protected Filter[] getServletFilters() {
      // TODO Auto-generated method stub
      CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
      encodingFilter.setEncoding("UTF-8");
      return new Filter[] {encodingFilter};
   }
}

