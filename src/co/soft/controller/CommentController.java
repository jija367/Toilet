package co.soft.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import co.soft.beans.CommentBean;
import co.soft.beans.PageNumBean;
import co.soft.beans.ToiletBean;
import co.soft.service.CommentService;
import co.soft.service.ToiletService;

@Controller
@RequestMapping(value="/comment")
public class CommentController {

	@Autowired
	private CommentService c_service;
	
	@Autowired
	private ToiletService t_service;
	
	@GetMapping("/commentlist")
	public String commentlist(HttpServletRequest request,
			Model model) {
		
		// id 전달
		String t_user_id=request.getParameter("t_user_id");
		model.addAttribute("t_user_id",t_user_id);
		////////////////////
		int t_no=Integer.parseInt(request.getParameter("t_no"));
		
		String current_page_num=request.getParameter("current_page_num");
		if(current_page_num==null) {
			current_page_num="1";
		}
		int current=Integer.parseInt(current_page_num);
		
		// 검색된 모든 코멘트 개수 저장
		int total_list=c_service.getCommentCount(t_no);
		
		// 페이지빈에 매개변수 저장해서 jsp로 전달
		PageNumBean pagenumbean=new PageNumBean(current, total_list);
		model.addAttribute("pagenumbean", pagenumbean);
		
		List<CommentBean> li=c_service.getComment(t_no); 
		model.addAttribute("li",li);
		model.addAttribute("t_no",t_no);
		
		return "comment/commentlist";
	}
	
	@PostMapping("/add_comment")
	public String addcomment(HttpServletRequest request,
			CommentBean commentbean) {
		String t_user_id=request.getParameter("t_user_id");
		request.setAttribute("t_user_id", t_user_id);
		System.out.println(t_user_id);
		
		String t_no=request.getParameter("t_no");
		String com=request.getParameter("t_com_com");
		String score=request.getParameter("t_com_score");
		String profileimg=request.getParameter("t_com_profileimg");
		commentbean.setT_com_com(com);
		commentbean.setT_com_score(Integer.parseInt(score));
		commentbean.setT_user_id(t_user_id);
		commentbean.setT_no(Integer.parseInt(t_no));
		commentbean.setT_com_profileimg(profileimg);
		request.setAttribute("t_no",t_no);
		c_service.addcomment(commentbean);
		
		//코멘트 추가시 화장실 총점, 댓글개수 업데이트
		t_service.updateScore(Integer.parseInt(t_no));
		t_service.updateUserCount(Integer.parseInt(t_no));
		
		return "comment/add_comment";
	}
	
	@GetMapping("/com_delete")
	public String com_delete(HttpServletRequest request) {
		String t_user_id=request.getParameter("t_user_id");
		String t_com_no=request.getParameter("t_com_no");
		String t_no=request.getParameter("t_no");
		
		request.setAttribute("t_user_id",t_user_id);
		request.setAttribute("t_com_no",t_com_no);
		request.setAttribute("t_no",t_no);
		
		return "comment/com_delete";
	}
	
	@GetMapping("/com_deletepass")
	public String com_deletepass(HttpServletRequest request) {
		String t_user_id=request.getParameter("t_user_id");
		String t_com_no=request.getParameter("t_com_no");
		String t_no=request.getParameter("t_no");
		
		request.setAttribute("t_user_id",t_user_id);
		request.setAttribute("t_com_no",t_com_no);
		request.setAttribute("t_no",t_no);
		
		c_service.deleteComment(Integer.parseInt(t_com_no));
		
		//코멘트 삭제시 화장실 총점, 댓글개수 업데이트
		t_service.updateScore(Integer.parseInt(t_no));
		t_service.updateUserCount(Integer.parseInt(t_no));
		
		return "comment/com_deletepass";
	}
	
	@GetMapping("/com_update")
	public String com_update(HttpServletRequest request, 
			CommentBean commentbean) {
		
		String t_com_no=request.getParameter("t_com_no");
		String t_no=request.getParameter("t_no");
		
		request.setAttribute("t_no",t_no);
		
		commentbean=c_service.getOneComment(Integer.parseInt(t_com_no));
		request.setAttribute("commentbean",commentbean);
		
		return "comment/com_update";
	}
	
	@PostMapping("/com_updatepass")
	public String com_updatepass(CommentBean commentbean,
			HttpServletRequest request) {
		String t_com_no=request.getParameter("t_com_no");
		commentbean=c_service.getOneComment(Integer.parseInt(t_com_no));
		
		String t_com_profileimg=request.getParameter("t_com_profileimg");
		String t_com_score=request.getParameter("t_com_score");
		String t_com_com=request.getParameter("t_com_com");
		
		
		int score=0;
		if(t_com_score==null) {
			score=0;
		}else if(t_com_score=="") {
			score=0;
		}else {
			score=Integer.parseInt(t_com_score);
		}
		
		commentbean.setT_com_com(t_com_com);
		commentbean.setT_com_profileimg(t_com_profileimg);
		commentbean.setT_com_score(score);
		
		System.out.println(score);
		
		request.setAttribute("commentbean",commentbean);
		c_service.updateComment(commentbean);
		
		
		// 화장실 별점 변경시 toilet 테이블의 별점 총점도 변경해줌
		String t_no=request.getParameter("t_no");
		t_service.updateScore(Integer.parseInt(t_no));

		return "comment/com_updatepass";
	}
	
}
