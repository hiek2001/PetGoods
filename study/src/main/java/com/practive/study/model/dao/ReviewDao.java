package com.practive.study.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.practive.study.model.vo.Review;

public interface ReviewDao {

	List<Review> reviewList(SqlSessionTemplate sqlSessionTemplate);
	
	int insertEnd(SqlSessionTemplate sqlSessionTemplate, Review review);
}
