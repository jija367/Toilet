package co.soft.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.soft.beans.CommentBean;
import co.soft.beans.Gpsbean;
import co.soft.beans.ToiletBean;
import co.soft.dao.ToiletDao;

@Service
public class ToiletService {

	@Autowired
	ToiletDao t_dao;
	
	
	public List<ToiletBean> getToiletBeans(String searchKey){
		return t_dao.getToiletBean(searchKey);
	}
	
	public ToiletBean getOneToilet(int t_no) {
		return t_dao.getOneToilet(t_no);
	}
	
	public int getToiletCount(String searchKey) {
		return t_dao.getToiletCount(searchKey);
	}
	
	public void updateToiletScore(CommentBean commentbean) {
		t_dao.updateToiletScore(commentbean);
	}
	
	public void updateToiletUserPlus(int t_no) {
		t_dao.updateToiletUserPlus(t_no);
	}
	
	public void updateToiletUserMinus(int t_no) {
		t_dao.updateToiletUserMinus(t_no);
	}
	
	public List<ToiletBean> getToiletBeanGps(Gpsbean gps){
		return t_dao.getToiletBeanGps(gps);
	}

	///////////////////////////////
	
	public void updateScore(int t_no) {
		t_dao.updateScore(t_no);
	}
	
	public void updateUserCount(int t_no) {
		t_dao.updateUserCount(t_no);
	}
}
