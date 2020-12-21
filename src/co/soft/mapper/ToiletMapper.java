package co.soft.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import co.soft.beans.CommentBean;
import co.soft.beans.Gpsbean;
import co.soft.beans.ToiletBean;


public interface ToiletMapper {

	// 검색 키워드로 화장실 데이터 가져오는 쿼리문
	@Select("select * from toilet where t_nm_name like '%'||#{searchKey}||'%' or t_m_name like '%'||#{searchKey}||'%' order by t_nm_name")
	List<ToiletBean> getToiletBean(String searchKey);
	
	// 매개변수에 넣은 화장실 기본키를 가진 하나의 화장실 데이터 가져오는 쿼리문
	@Select("select * from toilet where t_no=#{t_no}")
	ToiletBean getOneToilet(int t_no);
	
	// 검색한 화장실의 총 개수 구하는 쿼리문
	@Select("select count(*) from toilet where t_nm_name like '%'||#{searchKey}||'%' or t_m_name like '%'||#{searchKey}||'%'")
	int getToiletCount(String searchKey);
	
	// 댓글이 추가될때 별점 변경해주는 쿼리
	@Update("update toilet set t_com_score=t_com_score+#{t_com_score} where t_no=#{t_no}")
	void updateToiletScore(CommentBean commentbean);
	
	// 댓글을 남기면 유저 카운트 증가
	@Update("update toilet set t_user_count=t_user_count+1 where t_no=#{t_no}")
	void updateToiletUserPlus(int t_no);
	
	// 댓글 삭제시 유저 카운트 감소
	@Update("update toilet set t_user_count=t_user_count-1 where t_no=#{t_no}")
	void updateToiletUserMinus(int t_no);
	
	// 위치 기반 가까운 화장실 조회하는 쿼리문(0.5=500m)
	@Select("SELECT *FROM "
			+ "(SELECT t_no, t_nm_name, t_m_name, t_name, t_mwm,t_ml_number,t_ms_number,t_hml_number,t_hms_number,t_cml_number,t_cms_number, t_wml_number, t_hwml_number,t_hwms_number, t_com_score, t_user_count, "
			+ "( 6371 * acos( cos( radians( #{t_la} ) ) * cos( radians( t_la) ) * cos( radians( t_lo ) - radians( #{t_lo} ) ) +sin( radians( #{t_la} ) ) * sin( radians(t_la) ) ) ) "
			+ "AS distance FROM toilet) DATA WHERE DATA.distance < 1 order by distance")
	List<ToiletBean> getToiletBeanGps(Gpsbean gps);
	
	
	////////////////////////////
	
	@Update("update toilet set t_com_score=(select sum(t_com_score) from t_comment where t_no=#{t_no}) where t_no=#{t_no}")
	void updateScore(int t_no);
	
	@Update("update toilet set t_user_count=(select count(*) from t_comment where t_no=#{t_no}) where t_no=#{t_no}")
	void updateUserCount(int t_no);
}
