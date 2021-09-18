package com.practive.study.model.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.practive.study.model.dao.ShopDao;
import com.practive.study.model.vo.Member;
import com.practive.study.model.vo.Order;
import com.practive.study.model.vo.Snack;

@Service
public class ShopService {

	@Autowired
	public ShopDao dao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Snack> snackList() {
		return dao.snackList(sqlSession);
				
	}
	
	public Snack snack(int snackNo) {
		return dao.snack(sqlSession, snackNo);
	}
	
	public int payEnd(Order order) {	
		return dao.payEnd(sqlSession, order);
	}
	
	public Order shopEnd(HashMap map) {
		return dao.shopEnd(sqlSession, map);
	}
	
	public Member userSame(String userEmail) {
		return dao.userSame(sqlSession, userEmail);
	}
	
	public int setSnack(Snack snack) {
		System.out.println("2) Service 진입~~~");
		return dao.setSnack(sqlSession, snack);
	}
}
