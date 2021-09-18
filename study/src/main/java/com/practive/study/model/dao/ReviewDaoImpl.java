package com.practive.study.model.dao;

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
	
}
