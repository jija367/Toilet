package co.soft.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import co.soft.beans.CommentBean;

public interface CommentMapper {

	// 화장실에 달린 코멘트 가져옴
	@Select("select * from t_comment where t_no=#{t_no} order by t_com_date desc")
	List<CommentBean> getComment(int t_no);
	
	// 코멘트 추가
	@Insert("insert into t_comment values(t_com_seq.nextval,#{t_com_profileimg} ,#{t_user_id}, #{t_no},#{t_com_score},#{t_com_com}, sysdate)")
	void addcomment(CommentBean c_bean);
	
	// 등록된 후기의 총 개수 구하는 쿼리문(화장실기준)
	@Select("select count(*) from t_comment where t_no=#{t_no}")
	int getCommentCount(int t_no);	
	
	// 등록된 후기의 총 개수 구하는 쿼리문(내가 작성한 코멘트개수)
	@Select("select count(*) from t_comment where t_user_id=#{t_user_id}")
	int getUserCommentCount(String t_user_id);
	
	// 코멘트 삭제
	@Delete("delete from t_comment where t_com_no=#{t_com_no}")
	void deleteComment(int t_com_no);
	
	// 하나의 코멘트 객체 가져옴
	@Select("select * from t_comment where t_com_no=#{t_com_no}")
	CommentBean getOneComment(int t_com_no);
	
	// 코멘트 업데이트
	@Update("update t_comment set t_com_com=#{t_com_com}, t_com_score=#{t_com_score}, t_com_profileimg=#{t_com_profileimg} where t_com_no=#{t_com_no}")
	void updateComment(CommentBean commentbean);
	
	//회원탈퇴시 작성한 코멘트 모두 삭제하는 쿼리
	@Delete("delete from t_comment where t_user_id=#{t_user_id}")
	void deleteCommentAll(String t_user_id);
	
}
