package com.practive.study.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	@RequestMapping(value="/reviewWrite.do", method=RequestMethod.GET)
	public String reviewWrite() {
		return "board/reviewWrite";
	}
	
	@RequestMapping(value="/insertEnd.do", method=RequestMethod.POST)
	public ModelAndView writeEnd(Review review, HttpServletRequest request) {
		Logger.info("write Controller로 진입~~~");
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
	
	//@RequestMapping(value="/reviewDetail.do", method=RequestMethod.GET)
	//public String reviewDetail(int reviewNo) {
		//Review review = service.reviewDetail(reviewNo);
	//}
}
