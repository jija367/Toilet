package co.soft.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import co.soft.beans.ToiletBean;
import co.soft.service.ToiletService;

@Controller
public class MainConroller {
	
	@GetMapping("/main")
	public String main(HttpServletRequest request) {
		request.setAttribute("t_user_id",request.getParameter("t_user_id"));
		System.out.println(request.getParameter("t_user_id"));
		return "main";
		
	}

}
