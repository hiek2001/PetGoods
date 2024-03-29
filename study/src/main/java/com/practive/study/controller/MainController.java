package com.practive.study.controller;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.practive.study.NaverShoppingCrawling;
import com.practive.study.model.service.ShopService;
import com.practive.study.model.vo.Snack;

@Controller
public class MainController {
	//로그를 남기기 위한 것
	private static final Logger Logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	public ShopService shopservice;
	
	//메인 GET 공통
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main() throws Exception{
		Logger.info("메인 페이지 진입");
		
		return "index";
	}
	
	// best상품 crawling
	@RequestMapping(value="/crawling.do", method = RequestMethod.GET)
	public void NaverShoppingCrawling() throws Exception{
		// 네이버쇼핑 베스트 펫 용품 웹 크롤링
		String URL = "https://www.11st.co.kr/browsing/BestSeller.tmall?method=getBestSellerMain&cornerNo=11&dispCtgrNo=1001453";
		// 해당 HTML을 document 형식으로 가져옴
		// document에는 해당 페이지의 전체 소스가 저장됨
		Document doc = Jsoup.connect(URL).get();		
		Elements element = doc.select("li[id^='thisClick_']");
	    
		List<Snack> list = new ArrayList<Snack>();
		
		 Elements picEle = element.select("div.img_plot");
		 // 상품사진 주소
		 Elements picAddr = doc.getElementsByTag("img");
		 String src = " ";
		 Snack product = new Snack();
		 for(int i=0 ; i<picAddr.size() ; i++) {
			 src = picAddr.get(i).attr("src");
			 product.setSnackImg(src);
		 }
		 
		 // 상품명
		 String picName = element.select("div.pname p").text();
		 System.out.println("상품명::"+ picName);
		
		 
		 // 가격
		 Elements priceEle = element.select("div.price_info");
		 String price = priceEle.select("strong.sale_price").text();
		 System.out.println("가격::"+price);

		 
		 product.setCategoryNo(2);
		 product.setSnackName(picName);		
		 product.setPrice(Integer.parseInt(price));
		 list.add(product);
		 Logger.info("product::"+list);
		//int result = shopservice.setSnack(product);
	}
}
