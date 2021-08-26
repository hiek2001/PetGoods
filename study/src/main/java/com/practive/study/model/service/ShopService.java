package com.practive.study.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.practive.study.model.dao.ShopDao;
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
		System.out.println("2) Service 진입~~~");
		return dao.payEnd(sqlSession, order);
	}
}
