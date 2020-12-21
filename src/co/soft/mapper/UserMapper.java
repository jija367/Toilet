package co.soft.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import co.soft.beans.MyCommentList;
import co.soft.beans.UserBean;

public interface UserMapper {


	// 회원가입
	@Insert("insert into t_user values(#{t_user_name},#{t_user_id},#{t_user_pw},#{t_user_pw2},#{t_user_email}, #{t_user_email_hashcode} , '0' , #{t_user_tel})")
	public void insertUser(UserBean userbean);
	
	@Select("select t_user_tel from t_user")
	public List<String> getTel();
	   
	   // 이름 가져오는 쿼리
	@Select("select t_user_name from t_user")
	public List<String> getName();
	   
	   // 이메일 가져오는 쿼리
	@Select("select t_user_email from t_user")
	public List<String> getEmail();
	
	// 전화번호를 통해 한명의 유저 데이터 가져오는 쿼리
	@Select("select * from t_user where t_user_tel=#{t_user_tel}")
	public UserBean getOneUserbeanTel(String t_user_tel);
	
	
	//해쉬코드 가져오는 맵핑
	@Select("select * from t_user where t_user_id=#{t_user_id}")
	public UserBean EmailHashCode(String t_user_id);
	   
	//이메일 인증시 1로 변경
	@Update("update t_user set t_user_email_checked = '1' where t_user_id=#{t_user_id}")
	public void EmailChecked(String t_user_id);
	   
	//비밀번호를 난수로 업데이트 시켜주는 함수
	@Update("update t_user set t_user_pw = #{t_user_pw} where t_user_id=#{t_user_id}")
	public void updateImpass(UserBean userbean);
	
	////////////////////////////////////////////////////////////////////
	
	
	// id 가져오는 쿼리
	@Select("select t_user_id from t_user")
	public List<String> getId();

	// pw 가져오는 쿼리
	@Select("select t_user_pw from t_user")
	public List<String> getPw();
	
	// id를 통해 한명의 유저 데이터 가져오는 쿼리
	@Select("select * from t_user where t_user_id=#{t_user_id}")
	public UserBean getOneUserbean(String t_user_id);
	
	// 탈퇴
	@Delete("delete from t_user where t_user_id=#{t_user_id}")
	public void deleteUser(String t_user_id);
	
	//수정
	@Update("update t_user set t_user_pw=#{t_user_pw} ,t_user_pw2=#{t_user_pw2} , t_user_email=#{t_user_email}, t_user_tel=#{t_user_tel} where t_user_id = #{t_user_id}")
	public void updateUser(UserBean userbean);
	
	// toilet + t_comment 데이터 이퀴조인으로 내 코멘트 리스트 가져오는 쿼리
	// id, t_no, t_com_no, 날짜, 내용, 내가 준 별점 가져옴
	@Select("select t_com_profileimg, t_comment.t_user_id, toilet.t_no, t_comment.t_com_no, t_com_date, t_name, t_com_com, t_comment.t_com_score from toilet, t_comment where toilet.t_no=t_comment.t_no and t_user_id like #{t_user_id}")
	public List<MyCommentList> getMyCommentList(String t_user_id);
}
