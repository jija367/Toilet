package co.soft.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import co.soft.beans.MyCommentList;
import co.soft.beans.UserBean;

public interface UserMapper {


	// ȸ������
	@Insert("insert into t_user values(#{t_user_name},#{t_user_id},#{t_user_pw},#{t_user_pw2},#{t_user_email}, #{t_user_email_hashcode} , '0' , #{t_user_tel})")
	public void insertUser(UserBean userbean);
	
	@Select("select t_user_tel from t_user")
	public List<String> getTel();
	   
	   // �̸� �������� ����
	@Select("select t_user_name from t_user")
	public List<String> getName();
	   
	   // �̸��� �������� ����
	@Select("select t_user_email from t_user")
	public List<String> getEmail();
	
	// ��ȭ��ȣ�� ���� �Ѹ��� ���� ������ �������� ����
	@Select("select * from t_user where t_user_tel=#{t_user_tel}")
	public UserBean getOneUserbeanTel(String t_user_tel);
	
	
	//�ؽ��ڵ� �������� ����
	@Select("select * from t_user where t_user_id=#{t_user_id}")
	public UserBean EmailHashCode(String t_user_id);
	   
	//�̸��� ������ 1�� ����
	@Update("update t_user set t_user_email_checked = '1' where t_user_id=#{t_user_id}")
	public void EmailChecked(String t_user_id);
	   
	//��й�ȣ�� ������ ������Ʈ �����ִ� �Լ�
	@Update("update t_user set t_user_pw = #{t_user_pw} where t_user_id=#{t_user_id}")
	public void updateImpass(UserBean userbean);
	
	////////////////////////////////////////////////////////////////////
	
	
	// id �������� ����
	@Select("select t_user_id from t_user")
	public List<String> getId();

	// pw �������� ����
	@Select("select t_user_pw from t_user")
	public List<String> getPw();
	
	// id�� ���� �Ѹ��� ���� ������ �������� ����
	@Select("select * from t_user where t_user_id=#{t_user_id}")
	public UserBean getOneUserbean(String t_user_id);
	
	// Ż��
	@Delete("delete from t_user where t_user_id=#{t_user_id}")
	public void deleteUser(String t_user_id);
	
	//����
	@Update("update t_user set t_user_pw=#{t_user_pw} ,t_user_pw2=#{t_user_pw2} , t_user_email=#{t_user_email}, t_user_tel=#{t_user_tel} where t_user_id = #{t_user_id}")
	public void updateUser(UserBean userbean);
	
	// toilet + t_comment ������ ������������ �� �ڸ�Ʈ ����Ʈ �������� ����
	// id, t_no, t_com_no, ��¥, ����, ���� �� ���� ������
	@Select("select t_com_profileimg, t_comment.t_user_id, toilet.t_no, t_comment.t_com_no, t_com_date, t_name, t_com_com, t_comment.t_com_score from toilet, t_comment where toilet.t_no=t_comment.t_no and t_user_id like #{t_user_id}")
	public List<MyCommentList> getMyCommentList(String t_user_id);
}
