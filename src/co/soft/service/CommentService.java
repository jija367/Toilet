package co.soft.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.soft.beans.CommentBean;
import co.soft.dao.CommentDao;

@Service
public class CommentService {

	@Autowired
	CommentDao c_dao;
	
	public  List<CommentBean> getComment(int t_no){
		return c_dao.getComment(t_no);
	}
	
	public void addcomment(CommentBean c_bean) {
		c_dao.addcomment(c_bean);
	}
	
	public int getCommentCount(int t_no) {
		return c_dao.getCommentCount(t_no);
	}
	
	public int getUserCommentCount(String t_user_id) {
		return c_dao.getUserCommentCount(t_user_id);
	}
	
	public void deleteComment(int t_com_no) {
		c_dao.deleteComment(t_com_no);
	}
	
	public CommentBean getOneComment(int t_com_no) {
		return c_dao.getOneComment(t_com_no);
	}
	
	public void updateComment(CommentBean commentbean) {
		c_dao.updateComment(commentbean);
	}
	
	public void deleteCommentAll(String t_user_id) {
		c_dao.deleteCommentAll(t_user_id);
	}

}
