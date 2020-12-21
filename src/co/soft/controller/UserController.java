package co.soft.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.soft.beans.MyCommentList;
import co.soft.beans.PageNumBean;
import co.soft.beans.UserBean;
import co.soft.email.EmailSender;
import co.soft.email.EmailSenderPw;
import co.soft.email.SHA256;
import co.soft.service.CommentService;
import co.soft.service.ToiletService;
import co.soft.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	UserService userservice;

	@Autowired
	EmailSender emailSender;

	@Autowired
	EmailSenderPw emailSenderPw;

	@Autowired
	CommentService c_service;
	
	@Autowired
	ToiletService t_service;

	@GetMapping("/join")
	public String userJoin(@ModelAttribute("userbean") UserBean userbean) {
		return "user/join";
	}
	
	@PostMapping("/joinpass")
	   public String userJoinPass(@Valid @ModelAttribute("userbean") UserBean userbean, BindingResult r) throws Exception {
	      if (r.hasErrors()) {
	         return "user/join";
	      }
	      userbean.setT_user_email_hashcode(new SHA256().getSHA256(userbean.getT_user_email()));
	      userservice.insertUser(userbean);
	      emailSender.sendEmail(userbean);
	      return "user/joinpass";
	   }
	
	
	@GetMapping("/id_search")
	   public String IdCheck(HttpServletRequest request) {
		 String searchKey=request.getParameter("searchKey");
		   request.setAttribute("searchKey",searchKey);
		   
	      return "user/id_search";
	   }
	   
	   //아이디 찾기 할때 전화번호로 검색해서 가져옴
	   @PostMapping("/id_searchpass")
	      public String IdCheckPass(HttpServletRequest request) {
		   
		   
	         String name=request.getParameter("t_user_name");
	         String tel = request.getParameter("t_user_tel");
	         List<String> name_list=userservice.getName();
	         List<String> tel_list=userservice.getTel();
	         if(name_list.contains(name) && tel_list.contains(tel)) {
	            UserBean userbean = userservice.getOneUserbeanTel(tel);
	            System.out.println(userbean);
	            String id = userbean.getT_user_id();
	            System.out.println(id);
	            request.setAttribute("t_user_name", name);
	            System.out.println(name);
	            request.setAttribute("t_user_id", id);
	            System.out.println(id);
	            return "user/id_searchpass";
	         }
	         return "user/id_searchfail";
	   }
	

	   @PostMapping("/passwordcheck1")
	   public String PasswordCheck(HttpServletRequest request) throws Exception {
	      String id = request.getParameter("t_user_id");
	      String email = request.getParameter("t_user_email");
	      List<String> id_list = userservice.getId();
	      List<String> email_list = userservice.getEmail();
	      if (id_list.contains(id) && email_list.contains(email)) {
	         //비밀번호를 업데이트 해주는 함수
	         UserBean userbean = userservice.getOneUserbean(id);
	         userbean.setT_user_pw(emailSenderPw.getRandomPassword(10));
	         userservice.updateUser(userbean);
	         //이메일을 보내
	         emailSenderPw.sendEmail(userbean);
	         request.setAttribute("t_user_id", id);
	         return "user/PasswordCheckAction";
	      }
	      String loginfailmsg = "id와 등록된 email 이 일치하지 않습니다.";
	      request.setAttribute("loginfailmsg", loginfailmsg);
	      return "user/loginfail";
	   }
	   
	
	   @PostMapping("/passwordcheck2")
	   public String PasswordCheck2(HttpServletRequest request) {
	      String id = request.getParameter("t_user_id");
	      String pw = request.getParameter("t_user_pw");
	      List<String> id_list = userservice.getId();
	      List<String> pw_list = userservice.getPw();
	      
	      String loginfailmsg = "비밀번호 인증이 되지 않았습니다. 다시 로그인 해주세요.";
	      
	      if (id_list.contains(id) && pw_list.contains(pw)) {
	         UserBean userbean = userservice.getOneUserbean(id);
	         request.setAttribute("userbean", userbean);
	         return "user/user_update";
	      }
	      request.setAttribute("loginfailmsg", loginfailmsg);
	      return "user/loginfail";
	   }
	   
	   //이메일 가입보낼때
	   @GetMapping("/EmailCheckAction")
	   public String EmailChecked(HttpServletRequest request) {
	      String code = request.getParameter("code");
	      String t_user_id = request.getParameter("t_user_id");
	      UserBean code1 = userservice.getOneUserbean(t_user_id);
	   
	      if(code1.getT_user_email_hashcode().equals(code)) {
	         // 인증여부 업데이트
	         userservice.EmailChecked(t_user_id);
	         return "user/EmailCheckAction";
	      }
	      else {
	         return "user/EmailFail";
	      }
	   }
	   

	@GetMapping("/login")
	public String login() {
		return "user/login";
	}

	@PostMapping("/loginpass")
	public String loginpass(HttpServletRequest request) {
		String id = request.getParameter("t_user_id");
		String pw = request.getParameter("t_user_pw");
		UserBean userbean = userservice.getOneUserbean(id);

		List<String> id_list = userservice.getId();
		List<String> pw_list = userservice.getPw();
		
		String loginfailmsg = "";
		String re = "";

		if (!id_list.contains(id)) {
			request.setAttribute("t_user_id", id);
			re = "user/loginfail";
			loginfailmsg = "등록되지 않은 id입니다.";
		} else if (!pw_list.contains(pw)) {
			re = "user/loginfail";
			loginfailmsg = "비밀번호가 일치하지 않습니다";
		} else if(userbean.getT_user_email_checked().equals("0")) {
			loginfailmsg = "이메일 인증이 되지 않은 id입니다. 인증 후 로그인 해주세요.";
			re = "user/loginfail";
		}else {
			re = "user/loginpass";
		}
		request.setAttribute("t_user_id", id);
		request.setAttribute("loginfailmsg", loginfailmsg);
		return re;
	}

	@GetMapping("/logout")
	public String logout() {
		return "user/logout";
	}

	@PostMapping("/user_updatepass")
	public String userupdatePass(@ModelAttribute("userbean") UserBean userbean, HttpServletRequest request) {

		userservice.updateUser(userbean);
		String t_user_id = request.getParameter("t_user_id");
		request.setAttribute("t_user_id", t_user_id);
		String pw_check_code = "update";
		request.setAttribute("pw_check_code", pw_check_code);
		return "user/pw_check_pass";
	}

	///////////////////////////////////////////

	@GetMapping("/my_comment")
	public String my_comment(HttpServletRequest request) {
		String t_user_id = request.getParameter("t_user_id");
		List<MyCommentList> li = userservice.getMyCommentList(t_user_id);
		request.setAttribute("li", li);
		request.setAttribute("t_user_id", t_user_id);
		return "user/my_comment";
	}

	// 비번 확인이 필요할 경우 체크폼 이동
	@GetMapping("/pw_check")
	public String pw_check(HttpServletRequest request) {
		String pw_check_code = request.getParameter("pw_check_code");
		String t_user_id = request.getParameter("t_user_id");
		request.setAttribute("t_user_id", t_user_id);
		request.setAttribute("pw_check_code", pw_check_code);

		return "user/pw_check";
	}

	// 디비에 있는 비번과 입력한 비번 확인하여 갖고 있는 pw_check_code값으로 해당 페이지 이동
	@GetMapping("/pw_check_pass")
	public String pw_check_pass(HttpServletRequest request, UserBean userbean) {
		String pw_check_code = request.getParameter("pw_check_code");
		String t_user_id = request.getParameter("t_user_id");
		String t_user_pw = request.getParameter("t_user_pw");
		request.setAttribute("t_user_id", t_user_id);
		request.setAttribute("pw_check_code", pw_check_code);
		request.setAttribute("t_user_pw", t_user_pw);
		userbean = userservice.getOneUserbean(t_user_id);
		request.setAttribute("userbean", userbean);
		
		String check_result = "";

		if (pw_check_code.equals("delete")) {

			if (userbean.getT_user_pw().equals(t_user_pw)) {
				// 내가 작성한 화장실 목록 리스트에 담음(탈퇴시 화장실별점 총점 업데이트 하기 위한 용도)
				// 코멘트 삭제되기전에 먼저 실행해야 됨(삭제된 이후엔 코멘트가 없어 화장실정보 가져올 수 없음)
				List<MyCommentList>li= userservice.getMyCommentList(t_user_id);
				
				// 내가 작성한 코멘트 모두 삭제
				c_service.deleteCommentAll(t_user_id);
				
				// 화장실 별점총점, 댓글개수 업데이트
				for(MyCommentList my:li) {
					t_service.updateScore(my.getT_no());
					t_service.updateUserCount(my.getT_no());
				}
				
				userservice.deleteUser(t_user_id);
				check_result = "user/pw_check_pass";
			} else {
				check_result = "user/pw_check_fail";
			}
		} else if (pw_check_code.equals("update")) {

			if (userbean.getT_user_pw().equals(t_user_pw)) {
				check_result = "user/user_update";
			} else {
				check_result = "user/pw_check_fail";
			}
		}

		return check_result;
	}

	@GetMapping("/mypage")
	public String mypage(HttpServletRequest request, UserBean userbean) {
		String t_user_id = request.getParameter("t_user_id");
		userbean = userservice.getOneUserbean(t_user_id);
		request.setAttribute("userbean", userbean);
		request.setAttribute("t_user_id", t_user_id);
		// 내가 작성한 코멘트 확인하는 함수
		List<MyCommentList> li = userservice.getMyCommentList(t_user_id);
		request.setAttribute("li", li);

		return "user/mypage";
	}

	@GetMapping("/my_commentlist")
	public String my_commentlist(HttpServletRequest request) {
		String t_user_id = request.getParameter("t_user_id");
		request.setAttribute("t_user_id", t_user_id);

		List<MyCommentList> li = userservice.getMyCommentList(t_user_id);
		request.setAttribute("li", li);

		/////////////////////////////// 페이지 번호

		String current_page_num = request.getParameter("current_page_num");
		int current = 1;
		if (current_page_num == null||current_page_num =="") {
			current = 1;
		}else{
			current = Integer.parseInt(current_page_num);
		}

		// 검색된 모든 코멘트 개수 저장
		int total_list = c_service.getUserCommentCount(t_user_id);

		// 페이지빈에 매개변수 저장해서 jsp로 전달
		PageNumBean pagenumbean = new PageNumBean(current, total_list);
		request.setAttribute("pagenumbean", pagenumbean);

		return "user/my_commentlist";
	}

	// 아이디 중복체크
	@GetMapping("/id_check")
	public String id_check(@ModelAttribute("userbean") UserBean userbean, HttpServletRequest request) {
		String t_user_id = request.getParameter("t_user_id");
		String id_check_result;

		List<String> li = userservice.getId();
		if (li.contains(t_user_id)) { // 아이디가 있으면실패
			id_check_result = "false";
		} else {
			id_check_result = "true";
		}

		request.setAttribute("id_check_result", id_check_result);

		return "user/join";
	}

}
