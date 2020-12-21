package co.soft.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.soft.beans.CommentBean;
import co.soft.beans.Gpsbean;
import co.soft.beans.ToiletBean;
import co.soft.mapper.ToiletMapper;

@Repository
public class ToiletDao {

	@Autowired
	private ToiletMapper t_mapper;
	
	public List<ToiletBean> getToiletBean(String searchKey){
		return t_mapper.getToiletBean(searchKey);
	}
	
	public ToiletBean getOneToilet(int t_no) {
		return t_mapper.getOneToilet(t_no);
	}
	
	public int getToiletCount(String searchKey) {
		return t_mapper.getToiletCount(searchKey);
	}
	
	public void updateToiletScore(CommentBean commentbean) {
		t_mapper.updateToiletScore(commentbean);
	}
	
	public void updateToiletUserPlus(int t_no) {
		t_mapper.updateToiletUserPlus(t_no);
	}
	
	public void updateToiletUserMinus(int t_no) {
		t_mapper.updateToiletUserMinus(t_no);
	}
	
	public List<ToiletBean> getToiletBeanGps(Gpsbean gps){
		return t_mapper.getToiletBeanGps(gps);
	}
	
	
	///////////////////////////////////////
	
	public void updateScore(int t_no) {
		t_mapper.updateScore(t_no);
	}
	
	public void updateUserCount(int t_no) {
		t_mapper.updateUserCount(t_no);
	}
	
}
