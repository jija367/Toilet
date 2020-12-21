package co.soft.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.soft.beans.MyCommentList;
import co.soft.beans.UserBean;
import co.soft.mapper.UserMapper;

@Repository
public class UserDao {

	@Autowired
	private UserMapper usermapper;

	public void insertUser(UserBean userbean) {
		usermapper.insertUser(userbean);
	}

	public List<String> getId() {
		return usermapper.getId();
	}

	public List<String> getPw() {
		return usermapper.getPw();
	}

	//////////////////////////////////////////////////////////

	public List<String> getName() {
		return usermapper.getName();
	}

	public List<String> getTel() {
		return usermapper.getTel();
	}

	public List<String> getEmail() {
		return usermapper.getEmail();
	}

	public UserBean getOneUserbeanTel(String t_user_tel) {
		return usermapper.getOneUserbeanTel(t_user_tel);
	}

	public UserBean EmailHashCode(String t_user_id) {
		return usermapper.EmailHashCode(t_user_id);
	}

	public void EmailChecked(String t_user_id) {
		usermapper.EmailChecked(t_user_id);
	}

	public void updateImpass(UserBean userbean) {
		usermapper.updateImpass(userbean);
	}

	///////////////////////////////////////////////////////////

	public UserBean getOneUserbean(String t_user_id) {
		return usermapper.getOneUserbean(t_user_id);
	}

	public void deleteUser(String t_user_id) {
		usermapper.deleteUser(t_user_id);
	}

	public void updateUser(UserBean userbean) {
		usermapper.updateUser(userbean);
	}

	public List<MyCommentList> getMyCommentList(String t_user_id) {
		return usermapper.getMyCommentList(t_user_id);
	}
}
