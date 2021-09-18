package com.practive.study.model.dao;

import java.util.HashMap;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;

import com.practive.study.model.vo.Member;
import com.practive.study.model.vo.Order;
import com.practive.study.model.vo.Snack;

public interface ShopDao {

	List<Snack> snackList(SqlSessionTemplate sqlSession);
	
	Snack snack(SqlSessionTemplate sqlSession, int snackNo);
	
	int payEnd(SqlSessionTemplate sqlSession, Order order);
	
	Order shopEnd(SqlSessionTemplate sqlSession, HashMap map);
	
	Member userSame(SqlSessionTemplate sqlSession, String userEmail);
	
	int setSnack(SqlSessionTemplate sqlSession, Snack snack);
}
