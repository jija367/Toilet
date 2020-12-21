package co.soft.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.soft.beans.CommentBean;
import co.soft.beans.Gpsbean;
import co.soft.beans.PageNumBean;
import co.soft.beans.ToiletBean;
import co.soft.service.CommentService;
import co.soft.service.ToiletService;

@Controller
@RequestMapping("/toilet")
public class ToiletController {
	
	
	@Autowired
	ToiletService t_service;
	
	@Autowired
	CommentService c_service;
	
	@GetMapping("/list")
	public String list(Model model, HttpServletRequest request ) {
		// 위도, 경도 가져오기
		String t_la=request.getParameter("t_la");
		String t_lo=request.getParameter("t_lo");
		
		
		// 검색한 값 가져오기
		String searchKey=request.getParameter("searchKey");
		
		
		//////////////// id 전달
		String t_user_id=request.getParameter("t_user_id");
		request.setAttribute("t_user_id", t_user_id);
		System.out.println(t_user_id);
		
		////////////////// 체크박스 선택 값 전달
		String mwm=request.getParameter("mwm");
		String child=request.getParameter("child");
		String handicap=request.getParameter("handicap");
		
		if(mwm==null) {
			mwm="Y";
		}
		if(child==null) {
			child="0";
		}
		if(handicap==null) {
			handicap="0";
		}
		
		request.setAttribute("mwm",mwm);
		request.setAttribute("child",Integer.parseInt(child));
		request.setAttribute("handicap",Integer.parseInt(handicap));
		
		request.setAttribute("searchKey", searchKey);
		
		/////////////// 검색한 키워드 전달
		List<ToiletBean> li;
		Gpsbean gps;
		
		if(t_la==null&&t_lo==null) {
			t_la="0";
			t_lo="0";
			li=t_service.getToiletBeans(searchKey);
			model.addAttribute("li", li);
		}else if(t_la==""&&t_lo=="") {
			t_la="0";
			t_lo="0";
			li=t_service.getToiletBeans(searchKey);
			model.addAttribute("li", li);
		}else{
			double la=Double.parseDouble(t_la);
			double lo=Double.parseDouble(t_lo);
			
			gps=new Gpsbean(la,lo);
			li=t_service.getToiletBeanGps(gps);
			request.setAttribute("li", li);
			request.setAttribute("t_la",t_la); 
			request.setAttribute("t_lo",t_lo);
		}
		
		return "toilet/list";
	}
	
	@GetMapping("/detail")
	public String detail(HttpServletRequest request) {
		String t_user_id=request.getParameter("t_user_id");
		request.setAttribute("t_user_id", t_user_id);
		System.out.println(t_user_id);
		
		int t_no=Integer.parseInt(request.getParameter("t_no"));
		ToiletBean oneToilet=t_service.getOneToilet(t_no);
		request.setAttribute("oneToilet", oneToilet);
		
		// 후기 미리보기 띄우주기 위해 리스트 셋팅
		List<CommentBean> li=c_service.getComment(t_no); 
		request.setAttribute("li",li);
		
		return "toilet/detail";
	}
	
}
