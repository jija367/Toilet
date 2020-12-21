package co.soft.beans;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

public class CommentBean {

	
	private int t_com_no;
	
	private String t_user_id;
	
	private int t_no;
	
	@NotBlank
	private int t_com_score;
	
	@NotBlank
	@Size(min=2,max=100,message = "코멘트는  2~100글자 이내로 작성해주세요.")
	private String t_com_com;
	
	private String t_com_date;

	//프로필 이미지 선택
	private String t_com_profileimg;

	public int getT_com_no() {
		return t_com_no;
	}

	public void setT_com_no(int t_com_no) {
		this.t_com_no = t_com_no;
	}

	public String getT_user_id() {
		return t_user_id;
	}

	public void setT_user_id(String t_user_id) {
		this.t_user_id = t_user_id;
	}

	public int getT_no() {
		return t_no;
	}

	public void setT_no(int t_no) {
		this.t_no = t_no;
	}

	public int getT_com_score() {
		return t_com_score;
	}

	public void setT_com_score(int t_com_score) {
		this.t_com_score = t_com_score;
	}

	public String getT_com_com() {
		return t_com_com;
	}

	public void setT_com_com(String t_com_com) {
		this.t_com_com = t_com_com;
	}

	public String getT_com_date() {
		return t_com_date;
	}

	public void setT_com_date(String t_com_date) {
		this.t_com_date = t_com_date;
	}

	public String getT_com_profileimg() {
		return t_com_profileimg;
	}

	public void setT_com_profileimg(String t_com_profileimg) {
		this.t_com_profileimg = t_com_profileimg;
	}

}
