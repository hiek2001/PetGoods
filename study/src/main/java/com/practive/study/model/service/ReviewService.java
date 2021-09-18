package com.practive.study.model.service;

import java.util.HashMap;
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
	
	// 리뷰 게시물 리스트 가져오기
	public List<Review> reviewList() {
		return dao.reviewList(sqlSessionTemplate);
	}
	
	// 리뷰 게시물 등록
	public int insertEnd(Review review) {
		return dao.insertEnd(sqlSessionTemplate, review);
	}
	
	// 리뷰 게시물 상세 보기
	public Review reviewDetail(int reviewNo) throws Exception{
		return dao.reviewDetail(sqlSessionTemplate, reviewNo);
	}
	
	// 리뷰 게시물 조회수 업데이트
	public int reviewUpdate(HashMap map) {
		System.out.println("insert Service 지난다아`~~~");
		return dao.reviewUpdate(sqlSessionTemplate, map);
	}
}
