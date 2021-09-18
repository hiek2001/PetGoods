package com.practive.study.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.practive.study.model.dao.ReviewDao;
import com.practive.study.model.vo.Review;

@Service
public class ReviewService {

	@Autowired
	private ReviewDao dao;
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List reviewList() {
		System.out.println("Service 지난다아아~~");
		return dao.reviewList(sqlSessionTemplate);
	}
	
	public int insertEnd(Review review) {
		System.out.println("insert Service 지난다아`~~~");
		return dao.insertEnd(sqlSessionTemplate, review);
	}
}
