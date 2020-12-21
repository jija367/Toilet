package co.soft.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import co.soft.beans.CommentBean;

public interface CommentMapper {

	// ȭ��ǿ� �޸� �ڸ�Ʈ ������
	@Select("select * from t_comment where t_no=#{t_no} order by t_com_date desc")
	List<CommentBean> getComment(int t_no);
	
	// �ڸ�Ʈ �߰�
	@Insert("insert into t_comment values(t_com_seq.nextval,#{t_com_profileimg} ,#{t_user_id}, #{t_no},#{t_com_score},#{t_com_com}, sysdate)")
	void addcomment(CommentBean c_bean);
	
	// ��ϵ� �ı��� �� ���� ���ϴ� ������(ȭ��Ǳ���)
	@Select("select count(*) from t_comment where t_no=#{t_no}")
	int getCommentCount(int t_no);	
	
	// ��ϵ� �ı��� �� ���� ���ϴ� ������(���� �ۼ��� �ڸ�Ʈ����)
	@Select("select count(*) from t_comment where t_user_id=#{t_user_id}")
	int getUserCommentCount(String t_user_id);
	
	// �ڸ�Ʈ ����
	@Delete("delete from t_comment where t_com_no=#{t_com_no}")
	void deleteComment(int t_com_no);
	
	// �ϳ��� �ڸ�Ʈ ��ü ������
	@Select("select * from t_comment where t_com_no=#{t_com_no}")
	CommentBean getOneComment(int t_com_no);
	
	// �ڸ�Ʈ ������Ʈ
	@Update("update t_comment set t_com_com=#{t_com_com}, t_com_score=#{t_com_score}, t_com_profileimg=#{t_com_profileimg} where t_com_no=#{t_com_no}")
	void updateComment(CommentBean commentbean);
	
	//ȸ��Ż��� �ۼ��� �ڸ�Ʈ ��� �����ϴ� ����
	@Delete("delete from t_comment where t_user_id=#{t_user_id}")
	void deleteCommentAll(String t_user_id);
	
}
