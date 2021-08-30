package com.practive.study;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import com.practive.study.controller.MemberController;

public class NaverShoppingCrawling {

	private static final Logger Logger = LoggerFactory.getLogger(MemberController.class);
	
	public static void getGoods(String URL) throws Exception{
		
		// best 펫 용품 URL
		
		Document doc = null;
		
		// 해당 HTML을 document 형식으로 가져옴
		// document에는 해당 페이지의 전체 소스가 저장됨
		doc = Jsoup.connect(URL).get();
		
		// select를 사용해 원하는 태그를 선택
		// list가 있는 태그
		Elements element = doc.select("li .list");
		
		// 약 30개		
		for(Element e : element) {
			Logger.info("상품명 : "+e.select("strong .name"));
			Logger.info("가격 : "+e.select("span .won"));
			Logger.info("상품사진 : "+e.select("a .N=a:bst.best").attr("href"));
		}
	}
}
