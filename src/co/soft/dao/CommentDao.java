package co.soft.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.soft.beans.CommentBean;
import co.soft.mapper.CommentMapper;

@Repository
public class CommentDao {

	@Autowired
	CommentMapper c_mapper;
	
	public List<CommentBean> getComment(int t_no){
		return c_mapper.getComment(t_no);
	}
	
	public void addcomment(CommentBean c_bean) {
		c_mapper.addcomment(c_bean);
	}
	
	public int getCommentCount(int t_no) {
		return c_mapper.getCommentCount(t_no);
	}
	
	public int getUserCommentCount(String t_user_id) {
		return c_mapper.getUserCommentCount(t_user_id);
	}
	
	public void deleteComment(int t_com_no) {
		c_mapper.deleteComment(t_com_no);
	}
	
	public CommentBean getOneComment(int t_com_no) {
		return c_mapper.getOneComment(t_com_no);
	}
	
	public void updateComment(CommentBean commentbean) {
		c_mapper.updateComment(commentbean);
	}
	
	public void deleteCommentAll(String t_user_id) {
		c_mapper.deleteCommentAll(t_user_id);
	}

}
