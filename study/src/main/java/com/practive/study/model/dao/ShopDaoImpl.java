package com.practive.study.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.practive.study.snackShopPagination;
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
}
