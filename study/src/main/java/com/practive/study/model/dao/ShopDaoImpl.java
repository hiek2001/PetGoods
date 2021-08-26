package com.practive.study.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.practive.study.model.vo.Order;
import com.practive.study.model.vo.Snack;

@Repository
public class ShopDaoImpl implements ShopDao {

	@Override
	public List<Snack> snackList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("snack.snackList");
	}
	
	@Override
	public Snack snack(SqlSessionTemplate sqlSession, int snackNo) {
		return sqlSession.selectOne("snack.snack", snackNo);
	}
	
	@Override
	public int payEnd(SqlSessionTemplate sqlSession, Order order) {
		return sqlSession.insert("order.orderEnd", order);
	}
	
	@Override
	public Order shopEnd(SqlSessionTemplate sqlSession, String orderUid) {
		System.out.println("3) DAO 진입~~~");
		System.out.println("order::"+orderUid);
		return sqlSession.selectOne("order.shopEnd", orderUid);
	}
}
