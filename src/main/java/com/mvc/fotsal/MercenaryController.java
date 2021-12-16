package com.mvc.fotsal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.fotsal.model.biz.MercenaryBiz;
import com.mvc.fotsal.model.dto.MercenaryDto;

@Controller
public class MercenaryController {
	
	private static final Logger logger = LoggerFactory.getLogger(MercenaryController.class);
	
	@Autowired
	private MercenaryBiz biz;
	
	@RequestMapping("/mercenary.do") //용병 지원 페이지
	public String mercenary() {
		logger.info("move page mercenary.jsp");
		return "mercenary";
	}
	
	@RequestMapping("/mercenary_insert.do")
	public String mercenary_insert(MercenaryDto dto) {
		logger.info("용병지원서 작성중");
		
		int res = biz.insert(dto);
		
		if(res>0) {
			logger.info("용병 지원서 작성완료");
			return "redirect:index.do";
		} else {
			logger.info("용병 지원서 작성실패");
			return "redirect:mercenary.do";
		}
		
	}
	
	@RequestMapping("/mercenaryDetail.do") // 용병 지원 자세히보기
	public String mercenaryDetail() {
		logger.info("move page mercenary_detail.jsp");
		return "mercenary_detail";
	}
	
	@RequestMapping("/index.do") // 메인페이지로 이동하기
	public String mainPage() {
		logger.info("move page index.jsp");
		return "index";
	}
}
