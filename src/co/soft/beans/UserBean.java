package co.soft.beans;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class UserBean {

	@NotBlank
	private String t_user_name;

	@NotBlank
	@Size(min = 2, max = 10, message = "2~10글자 이내로 입력해주세요")
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String t_user_id;

	@NotBlank
	@Size(min = 2, max = 10, message = "2~10글자 이내로 입력해주세요")
	private String t_user_pw;

	@NotBlank
	@Size(min = 2, max = 10, message = "2~10글자 이내로 입력해주세요")
	private String t_user_pw2;

	@Email
	@NotBlank
	private String t_user_email;

	private String t_user_email_hashcode;
	
	private String t_user_email_checked;

	@NotBlank
	private String t_user_tel;

	public String getT_user_name() {
		return t_user_name;
	}

	public void setT_user_name(String t_user_name) {
		this.t_user_name = t_user_name;
	}

	public String getT_user_id() {
		return t_user_id;
	}

	public void setT_user_id(String t_user_id) {
		this.t_user_id = t_user_id;
	}

	public String getT_user_pw() {
		return t_user_pw;
	}

	public void setT_user_pw(String t_user_pw) {
		this.t_user_pw = t_user_pw;
	}

	public String getT_user_pw2() {
		return t_user_pw2;
	}

	public void setT_user_pw2(String t_user_pw2) {
		this.t_user_pw2 = t_user_pw2;
	}

	public String getT_user_email() {
		return t_user_email;
	}

	public void setT_user_email(String t_user_email) {
		this.t_user_email = t_user_email;
	}

	public String getT_user_email_hashcode() {
		return t_user_email_hashcode;
	}

	public void setT_user_email_hashcode(String t_user_email_hashcode) {
		this.t_user_email_hashcode = t_user_email_hashcode;
	}

	public String getT_user_email_checked() {
		return t_user_email_checked;
	}

	public void setT_user_email_checked(String t_user_email_checked) {
		this.t_user_email_checked = t_user_email_checked;
	}

	public String getT_user_tel() {
		return t_user_tel;
	}

	public void setT_user_tel(String t_user_tel) {
		this.t_user_tel = t_user_tel;
	}


}
