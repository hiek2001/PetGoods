package com.practive.study.controller;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.practive.study.model.service.ReviewService;
import com.practive.study.model.vo.Review;

@Controller
public class ReviewController {
	
	private static final Logger Logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private ReviewService service;
	
	// 01 리뷰 게시물 리스트 불러오기
	@RequestMapping(value="/board.do", method=RequestMethod.GET)
	public ModelAndView reviewList() {
		Logger.info("Controller로 진입!!!!");
		ModelAndView mv = new ModelAndView();
		List<Review> reviewList = service.reviewList();
		Logger.info("review::"+reviewList);
		mv.addObject("review",reviewList);
		mv.setViewName("board/review");
		return mv;
	}
	
	// 02 리뷰 게시물 쓰기 화면 이동
	@RequestMapping(value="/reviewWrite.do", method=RequestMethod.GET)
	public String reviewWrite() {
		return "board/reviewWrite";
	}
	
	// 03 리뷰 게시물 저장 
	@RequestMapping(value="/insertEnd.do", method=RequestMethod.POST)
	public ModelAndView writeEnd(Review review, HttpServletRequest request) {
		int result = service.insertEnd(review);
		if(result>0) {
			Logger.info("db 저장 완료~~");
		}
		else {
			Logger.info("db 저장 실패ㅠㅠ 다시 확인하기~~");
		}
		ModelAndView mv = new ModelAndView();
		List<Review> reviewList = service.reviewList();
		Logger.info("review::"+reviewList);
		mv.addObject("review",reviewList);
		mv.setViewName("board/review");
		return mv;
	}
	
	// 04 리뷰 게시물 상세보기, 조회수 업데이트
	@RequestMapping(value="/reviewDetail.do", method=RequestMethod.GET)
	public ModelAndView reviewDetail(int reviewNo, ModelMap model) throws Exception{
		Logger.info("write Controller로 진입~~~");
		// 리뷰게시판 번호에 알맞은 내용 가져오기
		Review review = service.reviewDetail(reviewNo);
		Logger.info("review"+review);
		// 조회수 업데이트
		Logger.info("userEmail::"+review.getUserEmail());
		String userEmail = (String)model.get("userEmail");
		int result = 0;
		if(!review.getUserEmail().equals(userEmail)) {
			HashMap<String,Integer> map = new HashMap<String,Integer>();
			int cnt = review.getViewCnt();
			map.put("cnt", cnt);
			map.put("reviewNo", reviewNo);
			result = service.reviewUpdate(map);
		}
		if(result>0) Logger.info("viewcnt 업데이트 완료!!");
		else Logger.info("업데이트 실패~~ㅠㅠ 다시 확인해보기");
		review = service.reviewDetail(reviewNo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("review", review);
		mv.setViewName("board/reviewDetail");
		return mv;
	}
}
