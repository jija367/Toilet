package co.soft.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.soft.beans.MyCommentList;
import co.soft.beans.UserBean;
import co.soft.dao.UserDao;

@Service
public class UserService {

	@Autowired
	UserDao userdao;

	public void insertUser(UserBean userbean) {
		userdao.insertUser(userbean);
	}

	public List<String> getId() {
		return userdao.getId();
	}

	public List<String> getPw() {
		return userdao.getPw();
	}

	public UserBean getOneUserbean(String t_user_id) {
		return userdao.getOneUserbean(t_user_id);
	}

	public void deleteUser(String t_user_id) {
		userdao.deleteUser(t_user_id);
	}

	public void updateUser(UserBean userbean) {
		userdao.updateUser(userbean);
	}

	public List<MyCommentList> getMyCommentList(String t_user_id) {
		return userdao.getMyCommentList(t_user_id);
	}

	/////////////////////////////////

	public List<String> getTel() {
		return userdao.getTel();
	}

	public List<String> getName() {
		return userdao.getName();
	}

	public List<String> getEmail() {
		return userdao.getEmail();
	}

	public UserBean getOneUserbeanTel(String t_user_tel) {
		return userdao.getOneUserbeanTel(t_user_tel);
	}

	public UserBean EmailHashCode(String t_user_id) {
		return userdao.EmailHashCode(t_user_id);
	}

	public void EmailChecked(String t_user_id) {
		userdao.EmailChecked(t_user_id);
	}

	public void updateImpass(UserBean userbean) {
		userdao.updateImpass(userbean);
	}
}
