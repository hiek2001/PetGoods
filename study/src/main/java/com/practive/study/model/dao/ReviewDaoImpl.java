package com.practive.study.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.practive.study.model.vo.Review;

@Repository
public class ReviewDaoImpl implements ReviewDao{

	@Override
	public List<Review> reviewList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("review.reviewList");
	}
	
	@Override
	public int insertEnd(SqlSessionTemplate sqlSession, Review review) {
		return sqlSession.insert("review.insertEnd", review);
	}
	
	@Override
	public Review reviewDetail(SqlSessionTemplate sqlSession, int reviewNo) {
		return sqlSession.selectOne("review.reviewDetail", reviewNo);
	}
	
	@Override
	public int reviewUpdate(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.update("review.reviewUpdate", map);
	}
}
